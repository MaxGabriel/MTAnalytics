//
//  MTParseAnalyticsNetworking.h
//  Analytics
//
//  Created by Maximilian Tagher on 12/2/12.
//  Copyright (c) 2012 Max. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AnalyticsNetworking.h"

@interface MTParseAnalyticsNetworking : NSObject <AnalyticsNetworking>

+ (id)sharedNetworking;

- (void)saveImage:(UIImage *)image named:(NSString *)name userInfo:(NSDictionary *)userInfo;

- (void)saveViewControllerImage:(UIImage *)image named:(NSString *)name userInfo:(NSDictionary *)userInfo;

- (void)logViewControllerAnalyticUserInfo:(NSDictionary *)userInfo;

@end
