//
//  NSObject+AnalyticsName.m
//  Analytics
//
//  Created by Maximilian Tagher on 12/1/12.
//  Copyright (c) 2012 Max. All rights reserved.
//

#import "NSObject+AnalyticsName.h"

@implementation NSObject (AnalyticsName)

+ (NSString *)analyticsName
{
    return NSStringFromClass([self class]);
}

@end
