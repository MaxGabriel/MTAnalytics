//
//  UINavigationController+NavigationStack.m
//  HeyZap
//
//  Created by Maximilian Tagher on 11/30/12.
//  Copyright (c) 2012 Smart Balloon, Inc. All rights reserved.
//

#import "UINavigationController+NavigationStack.h"

@implementation UINavigationController (NavigationStack)

- (UIViewController *)viewControllerPreviousTo:(UIViewController *)viewController
{
    NSArray *viewControllers = self.viewControllers;
    if (![viewControllers containsObject:viewController]) {
        return nil;
    } else if (self.rootViewController == viewController) {
        return nil;
    } else {
        return viewControllers[[viewControllers indexOfObjectIdenticalTo:viewController]-1];
    }
}

- (UIViewController *)rootViewController
{
    NSArray *viewControllers = self.viewControllers;
    
    if ([viewControllers count] > 0) {
        return viewControllers[0];
    } else {
        return nil;
    }
}

- (UIViewController *)currentViewController
{
    return [self.viewControllers lastObject];
}



@end
