//
//  Analytics.h
//  Analytics
//
//  Created by Maximilian Tagher on 12/1/12.
//  Copyright (c) 2012 Max. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Analytics : NSObject

@property (nonatomic) BOOL takeScreenshots;

+ (id)sharedAnalytics;

+ (void)logAnalyticWithType:(NSString *)type userInfo:(NSDictionary *)userInfo;

- (BOOL)shouldScreenShotForName:(NSString *)name;

@end
