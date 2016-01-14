//
//  DCDeviceShell.m
//  AmaranthDemo
//
//  Created by Bob Li on 14-8-4.
//  Copyright (c) 2014年 Bob Li. All rights reserved.
//

#import "DCDeviceShell.h"
#import "DCSelectImageDialogDefaultImpl.h"
#import "DCLocalizedStrings.h"
#import "DCRecordDialogDefaultImpl.h"
#import "DCRecorderImpl.h"
#import "DCPlayerImpl.h"
#import "DCDrawImageDialog.h"
#import "DCDrawImageDialogDefaultImpl.h"
#import "DCVolumnMeterViewDefaultImpl.h"
#import "DCAppEventDispatcher.h"


static DCDeviceShell* _defaultShell;

@implementation DCDeviceShell {
    
    DCRecorder* _recorder;
    DCRecordDialog* _recordDialog;
    DCSelectImageDialog* _selectImageDialog;
    DCPlayer* _player;
    DCDrawImageDialog* _drawImageDialog;
    
    
    NSTimer* _pollVolumnTimer;
    
    long _startRecordingTime;
    

    NSTimer* _pollProgressTimer;
    
    BOOL _isPlaying;
    
    int _tickCount;
    
    NSString* _playingAudioFilePath;
    
    NSString* _scheduledAudioFilePath;
    
    float _duration;
}

@synthesize recorderClass = _recorderClass;
@synthesize recordDialogClass = _recordDialogClass;
@synthesize selectImageDialogClass = _selectImageDialogClass;
@synthesize playerClass = _playerClass;
@synthesize drawImageDialogClass = _drawImageDialogClass;
@synthesize volumnMeterViewClass = _volumnMeterViewClass;

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.recorderClass = [DCRecorderImpl class];
        self.recordDialogClass = [DCRecordDialogDefaultImpl class];
        self.selectImageDialogClass = [DCSelectImageDialogDefaultImpl class];
        self.playerClass = [DCPlayerImpl class];
        self.drawImageDialogClass = [DCDrawImageDialogDefaultImpl class];
        self.volumnMeterViewClass = [DCVolumnMeterViewDefaultImpl class];
    }
    return self;
}

+(void) load {
    _defaultShell = [[DCDeviceShell alloc] init];
}

+(DCDeviceShell*) defaultShell {
    return _defaultShell;
}

-(NSTimeInterval) durationOfPlayingFile {
    return _duration;
}

-(void) setRecorderClass:(Class)recorderClass {
    _recorderClass = recorderClass;
    _recorder = [[recorderClass alloc] init];
}

-(void) setRecordDialogClass:(Class)recordDialogClass {
    _recordDialogClass = recordDialogClass;
    _recordDialog = [[recordDialogClass alloc] init];
}

-(void) setSelectImageDialogClass:(Class)selectImageDialogClass {
    _selectImageDialogClass = selectImageDialogClass;
    _selectImageDialog = [[selectImageDialogClass alloc] init];
    _selectImageDialog.maxDimension = 800;
}

-(void) setPlayerClass:(Class)playerClass {
    _playerClass = playerClass;
    _player = [[playerClass alloc] init];
}

-(void) setDrawImageDialogClass:(Class)drawImageDialogClass {
    _drawImageDialogClass = drawImageDialogClass;
    _drawImageDialog = [[drawImageDialogClass alloc] init];
}


-(void) playDidStop {

    [_pollProgressTimer invalidate];
    _pollProgressTimer = nil;
    _tickCount = 0;
    _duration = 0;
    _isPlaying = NO;
    
    [DCAppEventDispatcher dispatchStopPlayingAudioFile:_playingAudioFilePath];
    _playingAudioFilePath = nil;

    if (_scheduledAudioFilePath) {
        [self playAudioAtFilePath:_scheduledAudioFilePath];
        _scheduledAudioFilePath = nil;
    }
}

-(void) playAudioAtFilePath:(NSString *)filePath {

    if (_playingAudioFilePath) {
        _scheduledAudioFilePath = filePath;
        [_player stopPlaying];
    }
    else if (filePath && filePath.length > 0) {
        
        _playingAudioFilePath = filePath;
        [DCAppEventDispatcher dispatchStartPlayingAudioFile:filePath];
        
        [_player playAudioFileAtPath:filePath stopCallback:^{
            [self playDidStop];
        }];
        
        _isPlaying = YES;
        _duration = [_player durationOfAudio];
        _tickCount = 0;
        _pollProgressTimer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(onPollProgressTimerTick:) userInfo:nil repeats:YES];
    }
}

-(void) stopPlaying {
    [_player stopPlaying];
}

-(void) onPollProgressTimerTick:(NSTimer*) sender {
    
    _tickCount++;
    [DCAppEventDispatcher dispatchPlayAudioFile:_playingAudioFilePath toTime:(float)_tickCount * 0.1 outOfTotalTime:_duration];
}


-(void) recordVoiceUpToDuration:(NSTimeInterval) duration usingCallback:(void (^)(NSString*)) callback {
    
    if (_isPlaying) {
        [self stopPlaying];
    }
    

    NSString* filePath = [[AppContext storageResolver] pathForPickedFile:@"mp4"];
    
    _recorder.maxDuration = duration;
    [_recorder initRecordingToFileAtPath:filePath];
    
    if (!_recorder.isAudioAvailable) {
        [DCAppEventDispatcher dispatchReceiveErrorMessageFromStringKey:DCStringKeyAudioUnavailable];
        return;
    }
    
    
    long startRecordingTime = [[[NSDate alloc] init] timeIntervalSince1970];
    _startRecordingTime = startRecordingTime;
    
    if (_volumnMeterViewClass) {
        _recordDialog.volumnMeterView = [[_volumnMeterViewClass alloc] init];
    }
    
    _recordDialog.keepRecordedAudio = YES;
    [_recordDialog showDialog:^{
        [_recorder stopRecording];
    }];
    
    
    [_recorder startRecordingWithExpireCallback:^{
        
        if (_pollVolumnTimer) {
            [_pollVolumnTimer invalidate];
            _pollVolumnTimer = nil;
        }
        
        [_recordDialog setTimeExipired];
        
    } completeCallback:^{
        
        BOOL keepFile = YES;
        
        if (!_recorder.isRecordingSucceeded) {
            [DCAppEventDispatcher dispatchReceiveErrorMessageFromStringKey:DCStringKeyRecordingFail];
            keepFile = NO;
        }
        
        long endRecordingTime = [[[NSDate alloc] init] timeIntervalSince1970];
        if (endRecordingTime - startRecordingTime < 1) {
            [DCAppEventDispatcher dispatchReceiveErrorMessageFromStringKey:DCStringKeyAudioTooShort];
            keepFile = NO;
        }
        
        if (!_recordDialog.keepRecordedAudio) {
            keepFile = NO;
        }
        
        
        if (!keepFile) {
            [[NSFileManager defaultManager] removeItemAtPath:filePath error:nil];
        }
        
        if (_pollVolumnTimer) {
            [_pollVolumnTimer invalidate];
            _pollVolumnTimer = nil;
        }
        
        _recordDialog.volumnMeterView = nil;
        callback(keepFile ? filePath : nil);
    }];
    

    _pollVolumnTimer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(onPollVolumnTimerTick:) userInfo:nil repeats:YES];
}

-(void) onPollVolumnTimerTick:(NSTimer*) timer {
    
    if (_recordDialog.volumnMeterView) {
        [_recordDialog.volumnMeterView setVolumn:_recorder.volumn];
    }
        
    [_recordDialog setTimeInSeconds:[[NSDate alloc] init].timeIntervalSince1970 - _startRecordingTime];
}


-(void) takePhotoUsingCallback:(void (^)(NSString*)) callback {
    
    if (!_selectImageDialog.isCameraAvailable) {
        [DCAppEventDispatcher dispatchReceiveErrorMessageFromStringKey:DCStringKeyCameraUnavailable];
        callback(nil);
        return;
    }
    else {
        [_selectImageDialog openSelectImageDialog:YES callback:^{
            callback(_selectImageDialog.selectedFilePath);
            _selectImageDialog.selectedFilePath = nil;
        }];
    }
}

-(void) pickPhotoUsingCallback:(void (^)(NSString*)) callback {
    
    [_selectImageDialog openSelectImageDialog:NO callback:^{
        callback(_selectImageDialog.selectedFilePath);
        _selectImageDialog.selectedFilePath = nil;
    }];
}


-(void) drawImageUsingCallback:(void (^)(NSString*))callback {

    [_drawImageDialog showDialog:^{
        callback(_drawImageDialog.drawnImageFilePath);
        _drawImageDialog.drawnImageFilePath = nil;
    }];
}


@end
