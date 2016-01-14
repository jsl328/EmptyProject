//
//  LService.m
//  DandelionDemo1
//
//  Created by Bob Li on 14-5-7.
//  Copyright (c) 2014年 Bob Li. All rights reserved.
//

#import "LService.h"
#import "Request.h"
#import "RequestTracker.h"
#import "ServiceMetadata.h"
#import "DCUrlDownloader.h"

@implementation LService

+(void) request:(NSString*) name with:(NSArray*) parameters returns:(Class) returnType whenDone:(void (^)(DCServiceContext*, id)) callback {
	
	Request* request = [Request create:name parameterValues:parameters returnType:returnType];
	
	[request sendWithDataCallback:callback];
}

+(void) request:(NSString*) name with:(NSArray*) parameters whenDone:(void (^)(DCServiceContext*)) callback {
	
	Request* request = [Request create:name parameterValues:parameters returnType:nil];
	[request sendWithVoidCallback:callback];
}

+(BOOL) isWaiting {
	return [RequestTracker isWaitingOnRequest];
}

+(void) stop {
	return [RequestTracker abort];
}

+(NSArray*) serviceMethods {
	return [ServiceMetadata serviceMethodConfigs];
}

+(void) enableAppDelegate {
	[DCUrlDownloader defaultDownloader].enableAppDelegate = YES;
}

+(void) downloadFromUrl:(NSString*) url {
	[[DCUrlDownloader defaultDownloader] downloadUrl:url fileName:nil limitSize:-1];
}

+(void) downloadFromUrl:(NSString *)url whenSuccess:(void (^)(NSString*)) successCallback whenFail:(void (^)(void)) failCallback {
	[[DCUrlDownloader defaultDownloader] downloadUrl:url fileName:nil limitSize:-1 completeCallback:successCallback failCallback:failCallback];
}

@end
