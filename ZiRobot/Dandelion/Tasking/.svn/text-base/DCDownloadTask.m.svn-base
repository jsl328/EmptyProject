//
//  DownloadTask.m
//  Mulberry
//
//  Created by Bob Li on 13-7-9.
//  Copyright (c) 2013年 Bob Li. All rights reserved.
//

#import "DCDownloadTask.h"
#import "FileSystem.h"
#import "DCExceptionFunctions.h"
@implementation DCDownloadTask {
    

    NSMutableURLRequest* _request;
    
    NSURLConnection* _connection;
    
    int _receivedDataLength;
    
    NSError* _error;
    
    int _statusCode;
    
    
    BOOL _isFinished;
}

@synthesize url;

@synthesize responseContentLength;
@synthesize body;
@synthesize contentType;
@synthesize httpMethod;
@synthesize useCookie;
@synthesize globalHeader;
@synthesize requestHeader;
@synthesize requestEncodingName;


// abstract methods

-(void) onDownloadStart {
}

-(void) writeData:(NSData*) data {
}

-(void) onDownloadComplete {
}

//


-(id) init {
    self = [super init];
    if (self) {
        httpMethod = @"GET";
        self.feature = DCTaskFeatureStreamDownload;
    }
    return self;
}


-(void) execute {
    
    _request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:url] cachePolicy:NSURLRequestReloadIgnoringLocalAndRemoteCacheData timeoutInterval:self.timeout];
    
    [_request setHTTPMethod:httpMethod];
    
    if (body) {
        [_request setValue:contentType forHTTPHeaderField:@"Content-Type"];
        [_request setHTTPBody:body];
    }

    if (useCookie) {
        [self addCookieToRequest:_request];
    }
    
    if (globalHeader) {
        [globalHeader applyToRequest:_request];
    }
    
    if (requestHeader) {
        [requestHeader applyToRequest:_request];
    }
    
    
    _connection = [[NSURLConnection alloc] initWithRequest:_request delegate:self startImmediately:YES];
    

    while (!_isFinished) {
        [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:[NSDate distantFuture]];
    }
    
    if (_error) {
        @throw DCWebExceptionMake(@"Download exception", _error);
    }
}

-(void) addCookieToRequest:(NSMutableURLRequest*) request {
    
    NSArray * cookies = [[NSHTTPCookieStorage sharedHTTPCookieStorage] cookiesForURL:request.URL];
    NSDictionary * headers = [NSHTTPCookie requestHeaderFieldsWithCookies:cookies];
    
    [request setAllHTTPHeaderFields:headers];
}

-(void) storeCookiesForResponse:(NSHTTPURLResponse*) response {
        
    NSArray * cookies = [NSHTTPCookie cookiesWithResponseHeaderFields:[response allHeaderFields] forURL:response.URL];
    [[NSHTTPCookieStorage sharedHTTPCookieStorage] setCookies:cookies forURL:response.URL mainDocumentURL:nil];
}

-(NSError*) error {
    return _error;
}

-(int) statusCode {
    return _statusCode;
}


-(void) connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {

    _connection = nil;
    
    [self onDownloadComplete];
    
    _error = error;
    _isFinished = YES;
}

-(void) connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    
    _statusCode = ((NSHTTPURLResponse*)response).statusCode;
    
    if (useCookie) {
        [self storeCookiesForResponse:(NSHTTPURLResponse*)response];
    }
    
    responseContentLength = (int)[response expectedContentLength];
    if (responseContentLength == NSURLResponseUnknownLength) {
        responseContentLength = -1;
    }
}

-(void) connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {

    [self writeData:data];
    
    _receivedDataLength += data.length;
    
    if (responseContentLength > 0) {
        [self reportProgress: (double)_receivedDataLength / responseContentLength];
    }
}

-(void) connectionDidFinishLoading:(NSURLConnection *)connection {
    
    [self onDownloadComplete];
    
    _connection = nil;
    _isFinished = YES;
}

@end
