//
//  DCDeviceShell.h
//  AmaranthDemo
//
//  Created by Bob Li on 14-8-4.
//  Copyright (c) 2014年 Bob Li. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DCSelectImageDialog.h"
#import "DCRecorder.h"
#import "DCRecordDialog.h"
#import "DCPlayer.h"

@interface DCDeviceShell : NSObject

@property (retain, nonatomic) Class recorderClass;
@property (retain, nonatomic) Class recordDialogClass;
@property (retain, nonatomic) Class selectImageDialogClass;
@property (retain, nonatomic) Class playerClass;
@property (retain, nonatomic) Class drawImageDialogClass;
@property (retain, nonatomic) Class volumnMeterViewClass;


+(DCDeviceShell*) defaultShell;

-(NSTimeInterval) durationOfPlayingFile;


-(void) playAudioAtFilePath:(NSString*) filePath;

-(void) stopPlaying;

-(void) recordVoiceUpToDuration:(NSTimeInterval) duration usingCallback:(void (^)(NSString*)) callback;

-(void) takePhotoUsingCallback:(void (^)(NSString*)) callback;

-(void) pickPhotoUsingCallback:(void (^)(NSString*)) callback;

-(void) drawImageUsingCallback:(void (^)(NSString*)) callback;


@end
