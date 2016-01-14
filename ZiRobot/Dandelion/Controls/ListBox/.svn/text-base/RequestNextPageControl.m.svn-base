//
//  RequestNextPageControl.m
//  Nanumanga
//
//  Created by Bob Li on 13-9-10.
//  Copyright (c) 2013年 Bob Li. All rights reserved.
//

#import "RequestNextPageControl.h"

@implementation RequestNextPageControl {

    UIView* _paginationView;
}

@synthesize delegate;

-(id) init {
    self = [super init];
    if (self) {
        [self initialize];
    }
    return self;
}

-(void) initialize {
    self.backgroundColor = [UIColor clearColor];
    _maskButton = [[UIButton alloc] init];
    [_maskButton addTarget:self action:@selector(didClickMaskButton:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_maskButton];
    
    _activityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    [self addSubview:_activityIndicator];
    _activityIndicator.hidden = YES;
}

-(void) setPaginationView:(UIView*) view {
    [_paginationView removeFromSuperview];
    _paginationView = view;
    [self insertSubview:_paginationView atIndex:0];
}

-(void) didClickMaskButton:(id) sender {
    if (!_isRefreshing) {
        [self startRefreshing];
        [delegate requestNextPageControlDidClick];
    }
}

-(void) layoutSubviews {
    [super layoutSubviews];
    _maskButton.frame = self.bounds;
    _activityIndicator.frame = CGRectMake(180, 5, 60, 30);
    _paginationView.frame = self.bounds;
}


-(BOOL) isRefreshing {
    return _isRefreshing;
}

-(void) startRefreshing {
    [_activityIndicator startAnimating];
    _activityIndicator.hidden = NO;
    _isRefreshing = YES;
}

-(void) endRefreshing {
    [_activityIndicator stopAnimating];
    _activityIndicator.hidden = YES;
    _isRefreshing = NO;
}

@end
