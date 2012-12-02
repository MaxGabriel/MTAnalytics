//
//  UIViewController+NavigationStack.m
//  HeyZap
//
//  Created by Maximilian Tagher on 11/30/12.
//  Copyright (c) 2012 Smart Balloon, Inc. All rights reserved.
//

#import "UIViewController+NavigationStack.h"
#import "UINavigationController+NavigationStack.h"

@implementation UIViewController (NavigationStack)

- (UIViewController *)previousViewController
{
    return [self.navigationController viewControllerPreviousTo:self];
}

@end
