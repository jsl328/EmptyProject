//
//  DialogLib.m
//  Dandelion
//
//  Created by Bob Li on 13-8-29.
//  Copyright (c) 2013年 Bob Li. All rights reserved.
//

#import "LDialog.h"
#import "MessageBox.h"
#import "AppContext.h"
#import "WaitBox.h"
#import "ActionSheetDialog.h"
#import "DCDialogManager.h"
#import "DCOverlayDialog.h"

#ifdef __USE_PREVIEW_DIALOG
#import "DocumentPreviewDialog.h"
#endif

@implementation LDialog

+ (void)showMessageNoButton:(NSString *)message{
    [[DCDialogManager defaultManager] addDialog:[[MessageBox alloc] initWithMessageNoButton:message]];
}

+(void) showMessage: (NSString*) message {
    [[DCDialogManager defaultManager] addDialog:[[MessageBox alloc] initWithMessage:message]];
}

+(void) showMessage: (NSString*) message ok: (void (^)(void)) ok {
    [[DCDialogManager defaultManager] addDialog:[[MessageBox alloc] initWithMessage:message positiveCallback:ok negativeCallback:nil button:MessageBoxButtonOK]];
}

+(void) showMessageOKCancel: (NSString*) message ok: (void (^)(void)) ok cancel: (void (^)(void)) cancel {
    [[DCDialogManager defaultManager] addDialog:[[MessageBox alloc] initWithMessage:message positiveCallback:ok negativeCallback:cancel button:MessageBoxButtonOKCancel]];
}

+(void) showMessageYesNo: (NSString*) message yes: (void (^)(void)) yes no: (void (^)(void)) no {
    [[DCDialogManager defaultManager] addDialog:[[MessageBox alloc] initWithMessage:message positiveCallback:yes negativeCallback:no button:MessageBoxButtonYesNo]];
}

+(void) showActionSheet:(NSArray*) items callback:(void (^)(int)) buttonClickCallback {
    
    ActionSheetDialog* actionSheetDialog = [[ActionSheetDialog alloc] initWithCallback:buttonClickCallback];
    actionSheetDialog.items = items;
    [[DCDialogManager defaultManager] addDialog:actionSheetDialog];
}

+(void) showOverlay:(id) content withFrame:(CGRect) frame {
    
    DCOverlayDialog* overlayDialog = [[DCOverlayDialog alloc] init];
    overlayDialog.content = content;
    overlayDialog.frame = frame;
    [[DCDialogManager defaultManager] addDialog:overlayDialog];
}

+(void) closeDialog {
    [[DCDialogManager defaultManager] closeDialog];
}

+(void) showWaitBox:(NSString*) message {
    [[WaitBox defaultWaitBox] show];
    [WaitBox defaultWaitBox].message = message;
}

+(void) closeWaitBox {
    [[WaitBox defaultWaitBox] close];
}

#ifdef __USE_PREVIEW_DIALOG

+(void) showDocumentPreviewWithTitle:(NSString*) title filePath:(NSString*) filePath {
    DocumentPreviewDialog* dialog = [[DocumentPreviewDialog alloc] init];
    dialog.title = title;
    dialog.filePath = filePath;
    [dialog showInController:[AppContext navigationConductor].navigationController];
}

#endif

@end
