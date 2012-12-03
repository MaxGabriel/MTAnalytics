//
//  MTParseAnalyticsNetworking.m
//  Analytics
//
//  Created by Maximilian Tagher on 12/2/12.
//  Copyright (c) 2012 Max. All rights reserved.
//

#import "MTParseAnalyticsNetworking.h"
#import <Parse/Parse.h>
#import "Analytics.h"

@implementation MTParseAnalyticsNetworking

+ (id)sharedNetworking
{
    static MTParseAnalyticsNetworking *sharedNetworking = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedNetworking = [[MTParseAnalyticsNetworking alloc] init];
    });
    
    return sharedNetworking;
}

- (void)saveImage:(UIImage *)image named:(NSString *)name userInfo:(NSDictionary *)userInfo
{
    NSData *imageData = UIImagePNGRepresentation(image);
    
    NSString *fileName = [self imageFileNameForName:name userInfo:userInfo];
    
    [[PFFile fileWithName:fileName data:imageData] saveInBackground];
}

- (NSString *)imageFileNameForName:(NSString *)name userInfo:(NSDictionary *)userInfo
{
    NSString *configName = [userInfo objectForKey:kMTConfigKey];
    if (!configName || [configName isEqualToString:@""]) {
        configName = @"default";
    }
    
    return [NSString stringWithFormat:@"VC-%@-%@.png",name,configName];
}

- (void)saveViewControllerImage:(UIImage *)image named:(NSString *)name userInfo:(NSDictionary *)userInfo
{
    NSData *imageData = UIImagePNGRepresentation(image);
    
    NSString *fileName = [self imageFileNameForName:name userInfo:userInfo];
    
//    [[PFFile fileWithName:fileName data:imageData] saveInBackground];
    
    PFFile *imageFile = [PFFile fileWithName:fileName data:imageData];
    [imageFile saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error){
        PFObject *object = [PFObject objectWithClassName:@"MTViewControllerScreenshot"];
        [object setObject:imageFile forKey:@"imageFileKey"];
        [object saveInBackground];
    }];
}

- (void)logViewControllerAnalyticUserInfo:(NSDictionary *)userInfo
{
    PFObject *analytic = [PFObject objectWithClassName:@"MTViewControllerAnalytic"];
    for (NSString * key in userInfo) {
        [analytic setObject:[userInfo objectForKey:key] forKey:key];
    }
    [analytic saveEventually];
    
}

@end
