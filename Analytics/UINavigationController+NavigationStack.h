//
//  UINavigationController+NavigationStack.h
//  HeyZap
//
//  Created by Maximilian Tagher on 11/30/12.
//  Copyright (c) 2012 Smart Balloon, Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AnalyticsViewControllerContainer.h"

/**
Utility methods to navigation the navigation stack in a `UINavigationController`
 */
@interface UINavigationController (NavigationStack) <AnalyticsViewControllerContainer>

/** The `UIViewController` at the root of the navigation stack. If there is not a root view controller, returns `nil`.
 */
@property (nonatomic, readonly) UIViewController *rootViewController;

/** Returns the `UIViewController` in the navigation stack below the `viewController`. If the sender is not within the navigation stack, returns `nil`. If the `viewController` is the root view controller, returns nil.
 
 @param viewController The `UIViewController` whose previous view controller is being checked
 @return The `UIViewController` directly below the `viewController` in the navigation stack.
 */
- (UIViewController *)viewControllerPreviousTo:(UIViewController *)viewController;


- (UIViewController *)currentViewController;

@end
