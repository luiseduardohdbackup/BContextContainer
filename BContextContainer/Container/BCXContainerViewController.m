//
//  BCXContainerViewController.m
//  BContextContainerController
//
//  Created by Rodrigo Aguilar on 3/25/13.
//  Copyright (c) 2013 bNapkin. All rights reserved.
//

#import "BCXContainerViewController.h"

@interface BCXContainerViewController ()

@property (nonatomic,strong) UIViewController *rootViewController;

@end

@implementation BCXContainerViewController

- (id)initWithRootViewController:(UIViewController *)rootViewController
{
    self = [super init];
    
    if (self) {
        _rootViewController = rootViewController;
    }
    return self;
}

- (void)addController:(UIViewController *)viewController
{
    [viewController willMoveToParentViewController:self];
    [self addChildViewController:viewController];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.autoresizesSubviews = YES;
    
    if ([self.childViewControllers count] == 0) {
        [self addController:self.rootViewController];
        UIView *rootView = self.rootViewController.view;
        rootView.frame = self.view.bounds;
        [self.view addSubview:rootView];
        [self.rootViewController didMoveToParentViewController:self];
    }
}

@end
