//
//  ServiceShell.h
//  Lvpingguo
//
//  Created by fuyonghua on 14-8-28.
//  Copyright (c) 2014年 fuyonghua. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LService.h"
@interface ServiceShell : NSObject

/**
 *  网络请求调用接口函数
 *
 *  @param imei     传入的字符串
 *  @param callback callback
 */
+(void) employeeLoginWithImei:(NSString *)imei usingCallback:(void (^)(DCServiceContext*, id*)) callback;

@end
