//
//  Analytics.h
//  Analytics
//
//  Created by Maximilian Tagher on 12/1/12.
//  Copyright (c) 2012 Max. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AnalyticsNetworking.h"

@interface Analytics : NSObject <AnalyticsNetworking>

extern NSString * const kMTConfigKey;
extern NSString * const kMTTimeKey;
extern NSString * const kMTSourceKey;
extern NSString * const kMTNameKey;


typedef NS_ENUM(NSInteger, MTAnalyticsType) {
    MTAnalyticsTypeViewController,
    MTAnalyticsTypeAction
};

+ (Analytics *)sharedAnalytics;

extern NSString * const kScreenshotOptionViewControllers;
extern NSString * const kScreenshotOptionActions;
@property (nonatomic, strong) NSSet *screenshotOptions;

@property (nonatomic, strong) id <AnalyticsNetworking> analyticsNetworking;

- (BOOL)shouldScreenShotForName:(NSString *)name type:(MTAnalyticsType)type;


@end
