//
//  TimeLM.m
//  ZiRobot
//
//  Created by 阿布都沙拉木吾斯曼 on 15/6/13.
//  Copyright (c) 2015年 fuyonghua. All rights reserved.
//

#import "TimeLM.h"
#import "TimeDB.h"
@implementation TimeLM

- (id)initWithDB:(TimeDB *)db{
    if(self = [super init])
    {
        _time =db.time;
        _name = db.name;
    }
    return self;
}

- (void)save
{
    TimeDB *db = [[TimeDB alloc]init];
    db.time = _time;
    db.name = _name;
    [db save];
}

@end
