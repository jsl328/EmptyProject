//
//  NSDate+Extensions.h
//  Dandelion
//
//  Created by Bob Li on 13-4-18.
//  Copyright (c) 2013年 Bob Li. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (Extensions)

-(NSDateComponents*) components;

-(NSString*) toString;

- (NSString *)ymd;

- (NSString *)weekdayStr;

- (NSString *)weekdayStr2;


@end
