//
//  DCStrings.h
//  AmaranthDemo
//
//  Created by Sofia Work on 14-8-12.
//  Copyright (c) 2014年 Bob Li. All rights reserved.
//

#import <Foundation/Foundation.h>

enum DCStringKey {
    DCStringKeyAudioUnavailable = 0,
    DCStringKeyRecordingFail = 1,
    DCStringKeyAudioTooShort = 2,
    DCStringKeyDefaultRecordDialogUse = 3,
    DCStringKeyDefaultRecordDialogDiscard = 4,
    DCStringKeyDefaultRecordDialogPleaseSpeak = 5,
    DCStringKeyDefaultRecordDialogTimeExpired = 6,
    DCStringKeyCameraUnavailable = 7,
    DCStringKeyDefaultDrawDialogUse = 8,
    DCStringKeyDefaultDrawDialogDiscard = 9
};
typedef enum DCStringKey DCStringKey;


@interface DCLocalizedStrings : NSObject

+(NSException*) exceptionForKey:(DCStringKey) key;

+(NSException*) exceptionForKey:(DCStringKey)key parameters:(NSArray*) parameters;

+(NSString*) stringForKey:(DCStringKey) key;

+(NSString*) stringForKey:(DCStringKey)key parameters:(NSArray*) parameters;

@end
