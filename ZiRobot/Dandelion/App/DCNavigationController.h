//
//  DCNavigationController.h
//  DandelionDemo
//
//  Created by Bob Li on 14-2-5.
//  Copyright (c) 2014年 Bob Li. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DCNavigationController : UINavigationController
{
    CGPoint startTouch;
    
    UIImageView *lastScreenShotView;
    UIView *blackMask;
}

- (void)removeGestureRecognizer;
- (void)addGestureRecognizer;

@property (nonatomic,retain) UIView *backgroundView;
@property (nonatomic,retain) NSMutableArray *screenShotsList;

@property (nonatomic,assign) BOOL isMoving;

@property (nonatomic,assign) BOOL canDragBack;

@property (nonatomic) int orientationMask;

@end
