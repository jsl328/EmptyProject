//
//  DCOverlayDialog.m
//  AmaranthDemo
//
//  Created by Bob Li on 14-8-6.
//  Copyright (c) 2014年 Bob Li. All rights reserved.
//

#import "DCOverlayDialog.h"
#import "DCContentPresenter.h"

@implementation DCOverlayDialog {

    UIView* _mask;
    
    DCContentPresenter* _overlay;
}

@synthesize content = _content;
@synthesize frame = _frame;


-(void) setContent:(id)content {
    _content = content;
    _overlay.content = content;
}

-(void) setFrame:(CGRect)frame {
    _frame = frame;
    _overlay.frame = frame;
}

-(void) show {

    _mask = [[UIView alloc] init];
    _mask.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5];
    _overlay = [[DCContentPresenter alloc] init];
    _overlay.content = _content;
    _overlay.frame = _frame;
    [_mask addSubview:_overlay];
    
    UIWindow* window = [[[UIApplication sharedApplication] delegate] window];
    
    [window addSubview:_mask];
    _mask.frame = window.bounds;
}

-(void) close {
    [_mask removeFromSuperview];
    _mask = nil;
    [self didClose];
}

@end
