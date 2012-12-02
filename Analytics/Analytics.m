//
//  Analytics.m
//  Analytics
//
//  Created by Maximilian Tagher on 12/1/12.
//  Copyright (c) 2012 Max. All rights reserved.
//

#import "Analytics.h"


@implementation Analytics

NSString * const kAnalyticsPrefix = @"com.Analytics:";

+ (id)sharedAnalytics
{
    static Analytics *sharedAnalytics = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedAnalytics = [[Analytics alloc] init];
    });
    return sharedAnalytics;
}

+ (void)logAnalyticWithType:(NSString *)type userInfo:(NSDictionary *)userInfo
{
    
}

+ (NSString *)defaultsKeyForName:(NSString *)name
{
    return [kAnalyticsPrefix stringByAppendingString:name];
}

- (BOOL)shouldScreenShotForName:(NSString *)name
{
    return YES;
    if (self.takeScreenshots) {
        if (![[NSUserDefaults standardUserDefaults] objectForKey:[[self class] defaultsKeyForName:name]]) {
            // Add it to NSUserDefaults so we don't screenshot it again.
            [[NSUserDefaults standardUserDefaults] setObject:[NSDate date]
                                                      forKey:[[self class] defaultsKeyForName:name]];
            return YES;
        }
    }
    return NO;
}

@end
