//
//  MTImagePreviewViewController.h
//  Analytics
//
//  Created by Maximilian Tagher on 12/1/12.
//  Copyright (c) 2012 Max. All rights reserved.
//

#import <UIKit/UIKit.h>

/** Just a utility class to show an image (like the screenshots we take) within the app */
@interface MTImagePreviewViewController : UIViewController

/** The image to show */
@property (nonatomic, strong) UIImage *image;

@end
