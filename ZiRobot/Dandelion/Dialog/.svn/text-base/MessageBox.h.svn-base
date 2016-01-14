//
//  DialogHelper.h
//  Dandelion
//
//  Created by Bob Li on 13-8-29.
//  Copyright (c) 2013年 Bob Li. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DCDialog.h"

#define MessageBoxButtonOK 0
#define MessageBoxButtonOKCancel 1
#define MessageBoxButtonYesNo 2
#define MessageBoxButtonNone 3

@interface MessageBox : DCDialog <UIAlertViewDelegate> {
    
    UIAlertView* _alertView;
    
    id _positiveCallback;
    
    id _negativeCallback;
    
    NSString* _message;
    
    int _button;
}

-(id) initWithMessageNoButton: (NSString*) message;

-(id) initWithMessage: (NSString*) message;

-(id) initWithMessage: (NSString *)message positiveCallback: (void (^)(void)) positiveCallback negativeCallback: (void (^)(void)) negativeCallback button: (int) button;

@end
