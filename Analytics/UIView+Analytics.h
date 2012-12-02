//
//  UIView+Analytics.h
//  Analytics
//
//  Created by Maximilian Tagher on 12/1/12.
//  Copyright (c) 2012 Max. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AnalyticsName.h"

@interface UIView (Analytics)

- (void)logActionNamed:(NSString *)actionName;
- (void)logActionNamed:(NSString *)actionName userInfo:(NSDictionary *)userInfo;

+ (void)logActionforConformingView:(UIView <AnalyticsName>*)view userInfo:(NSDictionary *)userInfo;
@end
