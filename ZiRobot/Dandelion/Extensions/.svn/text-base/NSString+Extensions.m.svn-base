//
//  NSObject+NSString_Extensions.m
//  Nanumanga
//
//  Created by Bob Li on 13-10-20.
//  Copyright (c) 2013年 Bob Li. All rights reserved.
//

#import "NSString+Extensions.h"

@implementation NSString (Extensions)

-(BOOL) startsWithString:(NSString*) string {
    return self.length >= string.length && [[self substringToIndex:string.length] isEqualToString:string];
}

-(BOOL) endsWithString:(NSString*) string {
    return self.length >= string.length && [[self substringFromIndex:self.length - string.length] isEqualToString:string];
}

-(BOOL) endsWithStrings:(NSArray*) strings {
    return [strings any:^(NSString* item) {
        return [self endsWithString:item];
    }];
}

@end
