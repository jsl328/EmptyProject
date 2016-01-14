//
//  DCSerialTaskPool.m
//  DandelionDemo1
//
//  Created by Bob Li on 14-5-26.
//  Copyright (c) 2014年 Bob Li. All rights reserved.
//

#import "DCSerialTaskPool.h"

@implementation DCSerialTaskPool {

    BOOL _isExecutingTask;
}

-(id) init {
    self = [super init];
    if (self) {
        _queue = dispatch_queue_create([DCUUIDMake() UTF8String], NULL);
        _isExecutingTask = NO;
    }
    return self;
}


// overrides

-(void) addTaskToList:(DCTask*) task {
    if(task.priority)
       [_tasks addObject:task];
    else
        [_tasks insertObject:task atIndex:0];
}

-(BOOL) shouldStartTask:(DCTask*) task {
    return task.state == DCTaskStateQueued && !_isExecutingTask;
}

-(void) requestQuotaForTask:(DCTask*) task {
    _isExecutingTask = YES;
}

-(void) releaseQuotaForTask:(DCTask*) task {
    _isExecutingTask = NO;
}

//


@end
