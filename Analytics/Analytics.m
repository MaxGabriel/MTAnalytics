//
//  Analytics.m
//  Analytics
//
//  Created by Maximilian Tagher on 12/1/12.
//  Copyright (c) 2012 Max. All rights reserved.
//

#import "Analytics.h"


@implementation Analytics


NSString * const kMTConfigKey = @"MTAnalyticsConfigKey";
NSString * const kMTTimeKey = @"MTAnalyticsTimeKey";
NSString * const kMTSourceKey = @"MTAnalyticsSourceKey";
NSString * const kMTNameKey = @"MTAnalyticsNameKey";

NSString * const kAnalyticsPrefix = @"com.Analytics:";

NSString * const kScreenshotOptionViewControllers = @"com.Analytics.ScreenshotOptionViewControllers";
NSString * const kScreenshotOptionActions = @"com.Analytics.ScreenshotOptionActions";

+ (id)sharedAnalytics
{
    static Analytics *sharedAnalytics = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedAnalytics = [[Analytics alloc] init];
    });
    return sharedAnalytics;
}

#pragma mark - Screenshots

- (BOOL)shouldScreenShotForName:(NSString *)name type:(MTAnalyticsType)type
{
    if ([self shouldScreenshotForType:type]) {
        if (![[NSUserDefaults standardUserDefaults] objectForKey:[[self class] screenshotKeyForName:name]]) {
            // Add it to NSUserDefaults so we don't screenshot it again.
            [[NSUserDefaults standardUserDefaults] setObject:[NSDate date]
                                                      forKey:[[self class] screenshotKeyForName:name]];
            return YES;
        }
    }
    return NO;
}

+ (NSString *)screenshotKeyForName:(NSString *)name
{
    return [kAnalyticsPrefix stringByAppendingString:name];
}

- (BOOL)shouldScreenshotForType:(MTAnalyticsType)type
{
    switch (type) {
        case MTAnalyticsTypeViewController: {
            return [self.screenshotOptions containsObject:kScreenshotOptionViewControllers];
            break;
        }
        case MTAnalyticsTypeAction: {
            return [self.screenshotOptions containsObject:kScreenshotOptionActions];
            break;
        }
        default: {
            NSLog(@"<%@:%@:%d",[self class],NSStringFromSelector(_cmd),__LINE__);
            NSLog(@"Warning -- unhandled MTAnalytics type");
            break;
        }
    }
}


@end
