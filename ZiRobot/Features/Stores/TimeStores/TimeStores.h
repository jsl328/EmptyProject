//
//  TimeStores.h
//  ZiRobot
//
//  Created by 阿布都沙拉木吾斯曼 on 15/6/13.
//  Copyright (c) 2015年 ;. All rights reserved.
//

#import <Foundation/Foundation.h>
@class TimeLM;

@interface TimeStores : NSObject
+ (TimeLM *)getWithAutoID:(int)autoID;

+ (NSMutableArray *)getAll;
/**
 通过名称选择时间
 */
+ (NSString*)selectWithName:(NSString *)name;
/**
 通过名称更新时间
 */
+ (void)updateTimeWithName:(NSString*)name Time:(NSString*)time;
@end
