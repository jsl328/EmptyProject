//
//  TimeStores.m
//  ZiRobot
//
//  Created by 阿布都沙拉木吾斯曼 on 15/6/13.
//  Copyright (c) 2015年 fuyonghua. All rights reserved.
//

#import "TimeStores.h"
#import "TimeLM.h"
#import "TimeDB.h"
#import "DB.h"
@implementation TimeStores

+ (TimeLM *)getWithAutoID:(int)autoID;
{
    return (TimeLM *)[DB get:[TimeDB class] withAutoID:autoID];
}

+(NSMutableArray *)getAll{
    NSMutableArray * array = [[NSMutableArray alloc]initWithArray:[DB select:[TimeDB class] withSql:@"select * from PhonDB"]];
    return array;
}

+ (NSString*)selectWithName:(NSString *)name
{
    NSArray *times = [DB select:[TimeDB class] withSql:[NSString stringWithFormat:@"select * from TimeDB where name='%@'",name]];
    NSString *time = @"";
    if(times.count>0)
        time = times[0];
    return time;
}

+ (void)updateTimeWithName:(NSString*)name Time:(NSString*)time
{
    [DB executeSql:[NSString stringWithFormat:@"update zhiLingDB set time = '%@' where name = '%@'",time,name]];
}

@end
