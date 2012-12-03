//
//  ArtViewController.m
//  Analytics
//
//  Created by Maximilian Tagher on 12/2/12.
//  Copyright (c) 2012 Max. All rights reserved.
//

#import "ArtViewController.h"
#import "UIViewController+Analytics.h"

@interface ArtViewController ()

@end

@implementation ArtViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self logPageView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
