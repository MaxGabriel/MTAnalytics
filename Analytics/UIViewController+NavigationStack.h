//
//  UIViewController+NavigationStack.h
//  HeyZap
//
//  Created by Maximilian Tagher on 11/30/12.
//  Copyright (c) 2012 Smart Balloon, Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

/** Simple category to access view controller on the navigation stack of a `UIViewController` */
@interface UIViewController (NavigationStack)

/** Returns the `UIViewController` in the navigation stack below the sender. If the sender does not have a `navigationController`, returns nil. If the sender is the root view controller, returns `nil`.
 
 @return The `UIViewController` directly below the sender in the navigation stack.
 */
- (UIViewController *)previousViewController;

@end
