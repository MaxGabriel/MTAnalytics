//
//  UIViewController+Analytics.m
//  Analytics
//
//  Created by Maximilian Tagher on 12/1/12.
//  Copyright (c) 2012 Max. All rights reserved.
//

#import "UIViewController+Analytics.h"
#import "UIViewController+NavigationStack.h"
#import "UINavigationController+NavigationStack.h"
#import "AnalyticsViewControllerContainer.h"
#import "Analytics.h"
#import <QuartzCore/QuartzCore.h>
#import "MTImagePreviewViewController.h"
#import "NSObject+AnalyticsName.h"

@implementation UIViewController (Analytics)

NSString * const kAnalyticsPageViewType = @"com.Analytics:PageView";


NSString * const kAnalyticsSourceKey = @"com.Analytics:SourceKey";

- (NSString *)sourceName
{
    UIViewController *source = [self previousViewController];
    
    if (!source) {
        source = self.presentingViewController;
    }
    
    if ([source conformsToProtocol:@protocol(AnalyticsViewControllerContainer)]) {
        source = [(id <AnalyticsViewControllerContainer>)source currentViewController];
    }
    
    return [[source class] analyticsName];
}

- (void)logPageView
{
    [self logPageViewInfo:nil];
}
- (void)logPageViewInfo:(NSDictionary *)userInfo
{
    NSString *name = [[self class] analyticsName];
    NSString *source = [self sourceName];
    NSDate *time = [NSDate date];
    NSLog(@"<%@:%@:%d",[self class],NSStringFromSelector(_cmd),__LINE__);
    UIGraphicsBeginImageContext(self.view.bounds.size);
    
    UIImage *screenshot = [self screenshot];
    [self performSelector:@selector(previewImage:) withObject:screenshot afterDelay:2.0f];
    
    // Copy userInfo dictionary and add the properties we're finding to it. 
    
    // Log analytic with 'page view type' and with the information we've gathered.
}

- (void)previewImage:(UIImage *)image
{
    NSLog(@"<%@:%@:%d",[self class],NSStringFromSelector(_cmd),__LINE__);
    MTImagePreviewViewController *imagePreview = [[MTImagePreviewViewController alloc] init];
    imagePreview.image = image;
    [self.navigationController pushViewController:imagePreview animated:YES];
}

//http://developer.apple.com/library/ios/#qa/qa1703/_index.html
- (UIImage*)screenshot
{
    // Create a graphics context with the target size
    // On iOS 4 and later, use UIGraphicsBeginImageContextWithOptions to take the scale into consideration
    // On iOS prior to 4, fall back to use UIGraphicsBeginImageContext
    CGSize imageSize = [[UIScreen mainScreen] bounds].size;
    if (NULL != UIGraphicsBeginImageContextWithOptions)
        UIGraphicsBeginImageContextWithOptions(imageSize, NO, 0);
    else
        UIGraphicsBeginImageContext(imageSize);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    // Iterate over every window from back to front
    for (UIWindow *window in [[UIApplication sharedApplication] windows])
    {
        if (![window respondsToSelector:@selector(screen)] || [window screen] == [UIScreen mainScreen])
        {
            // -renderInContext: renders in the coordinate space of the layer,
            // so we must first apply the layer's geometry to the graphics context
            CGContextSaveGState(context);
            // Center the context around the window's anchor point
            CGContextTranslateCTM(context, [window center].x, [window center].y);
            // Apply the window's transform about the anchor point
            CGContextConcatCTM(context, [window transform]);
            // Offset by the portion of the bounds left of and above the anchor point
            CGContextTranslateCTM(context,
                                  -[window bounds].size.width * [[window layer] anchorPoint].x,
                                  -[window bounds].size.height * [[window layer] anchorPoint].y);
            
            // Render the layer hierarchy to the current context
            [[window layer] renderInContext:context];
            
            // Restore the context
            CGContextRestoreGState(context);
        }
    }
    
    // Retrieve the screenshot image
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return image;
}

@end
