//
//  UIView+Analytics.m
//  Analytics
//
//  Created by Maximilian Tagher on 12/1/12.
//  Copyright (c) 2012 Max. All rights reserved.
//

#import "UIView+Analytics.h"
#import "AnalyticsViewControllerContainer.h"

@implementation UIView (Analytics)

- (void)logActionNamed:(NSString *)actionName
{
    [self logActionNamed:actionName userInfo:nil];
}

+ (void)logActionforConformingView:(UIView <AnalyticsName>*)view userInfo:(NSDictionary *)userInfo
{
    
}

- (void)logActionNamed:(NSString *)actionName userInfo:(NSDictionary *)userInfo
{
    
}

- (id)getSource
{
    UIViewController *source = [self getActiveController];
    if ([source conformsToProtocol:@protocol(AnalyticsViewControllerContainer)]) {
        return [(id <AnalyticsViewControllerContainer>)source currentViewController];
    }
    return source;
}

- (UIViewController *)getActiveController{
    for (UIView* next = [self superview]; next; next = next.superview) {
        UIResponder* nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController*)nextResponder;
        }
    }
    return nil;
}




@end
