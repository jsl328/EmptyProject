//
//  DCStrings.m
//  AmaranthDemo
//
//  Created by Sofia Work on 14-8-12.
//  Copyright (c) 2014年 Bob Li. All rights reserved.
//

#import "DCLocalizedStrings.h"


static NSMutableDictionary* _dictionary;

static NSArray* _messageTypeKeys;


@implementation DCLocalizedStrings

+(NSException*) exceptionForKey:(DCStringKey) key {
    return [NSException exceptionWithName:@"Exception" reason:[DCLocalizedStrings stringForKey:key] userInfo:nil];
}

+(NSException*) exceptionForKey:(DCStringKey)key parameters:(NSArray*) parameters {
    return [NSException exceptionWithName:@"Exception" reason:[DCLocalizedStrings stringForKey:key parameters:parameters] userInfo:nil];
}

+(NSString*) stringForKey:(DCStringKey) key {
    return [_dictionary objectForKey:[DCLocalizedStrings keyForErrorType:key]];
}

+(NSString*) stringForKey:(DCStringKey)key parameters:(NSArray*) parameters {
    
    NSString* template = [_dictionary objectForKey:[DCLocalizedStrings keyForErrorType:key]];
    
    
    NSString* message = nil;
    
    if (parameters.count == 1) {
        message = [NSString stringWithFormat:template, [parameters objectAtIndex:0]];
    }
    
    
    return message;
}

+(NSString*) keyForErrorType:(int) errorType {
    return (NSString*)[_messageTypeKeys objectAtIndex:errorType];
}

+(void) load {
    
    _messageTypeKeys = @[
      @"audioUnavailable", // DCStringKeyAudioUnavailable
      @"recordingFail", // DCStringKeyRecordingFail
      @"audioTooShort", // DCStringKeyAudioTooShort
      @"defaultRecordDialog.use", // DCStringKeyDefaultRecordDialogUse
      @"defaultRecordDialog.discard", // DCStringKeyDefaultRecordDialogDiscard
      @"defaultRecordDialog.pleaseSpeak", // DCStringKeyDefaultRecordDialogPleaseSpeak
      @"defaultRecordDialog.timeExpired", // DCStringKeyDefaultRecordDialogTimeExpired
      @"cameraUnavailable", // DCStringKeyCameraUnavailable
      @"defaultDrawDialog.use", // DCStringKeyDefaultDrawDialogUse
      @"defaultDrawDialog.discard", // DCStringKeyDefaultDrawDialogDiscard
    ];
    
    _dictionary = [[NSMutableDictionary alloc] init];
    
    for (int i = 0; i <= _messageTypeKeys.count - 1; i++) {
        NSString* key = [DCLocalizedStrings keyForErrorType:i];
        NSString* message = [[NSBundle mainBundle] localizedStringForKey:key value:key table:@"dandelion"];
        [_dictionary setObject:message forKey:key];
    }
}

@end
