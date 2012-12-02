//
//  AnalyticsViewControllerContainer.h
//  Analytics
//
//  Created by Maximilian Tagher on 12/1/12.
//  Copyright (c) 2012 Max. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol AnalyticsViewControllerContainer <NSObject>

- (UIViewController *)currentViewController;

@end
