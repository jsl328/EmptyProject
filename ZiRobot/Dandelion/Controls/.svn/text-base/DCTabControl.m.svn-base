//
//  DCTabControl.m
//  Nanumanga
//
//  Created by Bob Li on 13-9-4.
//  Copyright (c) 2013年 Bob Li. All rights reserved.
//

#import "DCTabControl.h"
#import "AppContext.h"
#import "DCControl.h"
/*
@implementation DCTabControl
@synthesize headers = _headers;
@synthesize contents;
@synthesize pageIndex = _pageIndex;
@synthesize delegate;

-(id) initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self initialize];
    }
    return self;
}

-(id) init
{
    self = [super init];
    if (self) {
        [self initialize];
    }
    return self;
}

-(void) initialize {
    
    _contentContainer = [[DCPageScrollView alloc] init];
    _contentContainer.delegate = self;
    _contentContainer.showSeparatorLineWhileSliding = YES;
    [self addSubview:_contentContainer];
    
    _headerContainer = [[DCSegmentLayout alloc] init];
    [self addSubview:_headerContainer];
    
    self.clipsToBounds = YES;
}

-(void) setHeaders:(NSArray *)headers {
    _headerContainer.onSelectedIndexChangedDelegate = self;
    _headers = headers;
    _headerContainer.items = headers;
}

-(void) sender:(id)sender selectedIndexDidChangeTo:(int)index {
    [self updatePageIndex:index];
    _contentContainer.pageIndex = index;
}

-(void) pageScrollView:(DCPageScrollView*) pageScrollView pageIndexDidChangeBySliding:(int)pageIndex {
    [self updatePageIndex:pageIndex];
    _headerContainer.selectedIndex = pageIndex;
}

-(void) setPageIndex:(int)pageIndex {
    [self updatePageIndex:pageIndex];
    _contentContainer.pageIndex = pageIndex;
    _headerContainer.selectedIndex = pageIndex;
}

-(void) updatePageIndex:(int) pageIndex {
    
    if (_pageIndex == pageIndex) {
        return;
    }
    
    _pageIndex = pageIndex;
    
    [delegate tabControl:self didSelectPage:_pageIndex];
}

-(void) setContents:(NSArray *)newContents {
    
    contents = newContents;
    
    [_contentContainer clearPages];
    
    for (id content in contents) {
        ContentPresenter* cp = [[ContentPresenter alloc] initWithContent:content];
        [_contentContainer addSubview:cp];
    }
    
    [_contentContainer initialize];
    
    
    if (contents.count > 0) {
        _pageIndex = -1;
        self.pageIndex = 0;
    }
}

-(void) layoutSubviews {
    
    [super layoutSubviews];

    [_headerContainer layoutAtPoint:CGPointMake(0, 0) withWidthSpec:DCMeasureSpecMakeExactly(self.frame.size.width) heightSpec:DCMeasureSpecMakeExactly(44)];
    
    _contentContainer.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height - _headerContainer.frame.size.height);    
}

@end
*/