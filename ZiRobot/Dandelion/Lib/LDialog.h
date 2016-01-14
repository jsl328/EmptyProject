//
//  DialogLib.h
//  Dandelion
//
//  Created by Bob Li on 13-8-29.
//  Copyright (c) 2013年 Bob Li. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MessageBox.h"

@interface LDialog : NSObject

+ (void)showMessageNoButton:(NSString *)message;

+(void) showMessage: (NSString*) message;

+(void) showMessage: (NSString*) message ok: (void (^)(void)) ok;

+(void) showMessageOKCancel: (NSString*) message ok: (void (^)(void)) ok cancel: (void (^)(void)) cancel;

+(void) showMessageYesNo: (NSString*) message yes: (void (^)(void)) yes no: (void (^)(void)) no;

+(void) showActionSheet:(NSArray*) items callback:(void (^)(int)) buttonClickCallback;

+(void) showOverlay:(id) content withFrame:(CGRect) frame;

+(void) closeDialog;

+(void) showWaitBox:(NSString*) message;

+(void) closeWaitBox;

#ifdef __USE_PREVIEW_DIALOG

+(void) showDocumentPreviewWithTitle:(NSString*) title filePath:(NSString*) filePath;

#endif

@end
