//
//  MTImagePreviewViewController.m
//  Analytics
//
//  Created by Maximilian Tagher on 12/1/12.
//  Copyright (c) 2012 Max. All rights reserved.
//

#import "MTImagePreviewViewController.h"

@interface MTImagePreviewViewController ()

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIImageView *imageView;

@end

@implementation MTImagePreviewViewController

- (void)setImage:(UIImage *)image
{
    _image = image;
    [self updateImage];
}

- (void)updateImage
{
    self.scrollView.contentSize = self.image.size;
    self.imageView.image = self.image;
    self.imageView.frame = CGRectMake(0, 0, self.image.size.width, self.image.size.height);
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    self.scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    self.scrollView.contentSize = self.image.size;
    self.imageView = [[UIImageView alloc] init];
    [self.view addSubview:self.scrollView];
    [self.scrollView addSubview:self.imageView];
    [self updateImage];
}

@end
