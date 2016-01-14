//
//  DCTabControl.h
//  Nanumanga
//
//  Created by Bob Li on 13-9-4.
//  Copyright (c) 2013年 Bob Li. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DCPageScrollView.h"
#import "DCTabControlDelegate.h"
#import "DCOnSelectedIndexChangedDelegate.h"
/*
@interface DCTabControl : UIView <DCPageScrollViewDelegate, DCOnSelectedIndexChangedDelegate> {
    DCSegmentLayout* _headerContainer;
    DCPageScrollView* _contentContainer;
}

@property (retain, nonatomic) NSArray* headers;
@property (retain, nonatomic) NSArray* contents;
@property (nonatomic) int pageIndex;
@property (retain, nonatomic) id <DCTabControlDelegate> delegate;

@end
*/