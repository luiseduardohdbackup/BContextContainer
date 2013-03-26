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
    if (viewController) {
        [viewController willMoveToParentViewController:self];
        [self addChildViewController:viewController];
    }
}

- (UIViewController *)topMostViewController
{
    return [self.childViewControllers lastObject];
}

- (void)pushViewController:(UIViewController *)viewController
{
    if (viewController) {
        UIViewController *topVC = [self topMostViewController];
        viewController.view.transform = CGAffineTransformIdentity;
        [self addController:viewController];
        viewController.view.frame = self.view.bounds;
        [self.view addSubview:viewController.view];
        viewController.view.transform = CGAffineTransformMakeTranslation(self.view.bounds.size.width, 0);
        
        [UIView animateWithDuration:ANIMATION_DURATION animations:^{
            topVC.view.alpha = 0.5;
            topVC.view.transform = CGAffineTransformMakeScale(0.7, 0.7);
            viewController.view.transform = CGAffineTransformIdentity;
        } completion:^(BOOL finished) {
            [viewController didMoveToParentViewController:self];
        }];
        
    } else {
        NSLog(@"Warning!: No ViewController to push");
    }
}

- (void)popViewController
{
    int index = [self.childViewControllers count] - 2;
    
    if (index >= 0) {
        UIViewController *targetVC = self.childViewControllers[index];
        UIViewController *topVC = [self topMostViewController];
        
        [topVC willMoveToParentViewController:nil];
        
        
        CGAffineTransform previousTransform = targetVC.view.transform;
        targetVC.view.transform = CGAffineTransformIdentity;
        targetVC.view.frame = self.view.bounds;
        targetVC.view.transform = previousTransform;
        
        
        [UIView animateWithDuration:ANIMATION_DURATION animations:^{
            targetVC.view.alpha = 1.0;
            targetVC.view.transform = CGAffineTransformIdentity;
            topVC.view.transform = CGAffineTransformMakeTranslation(self.view.bounds.size.width, 0);
        } completion:^(BOOL finished) {
            [topVC.view removeFromSuperview];
            [topVC removeFromParentViewController];
        }];
    } else {
        NSLog(@"Warning!: Can't pop ViewController. Just One ViewControlelr on the stack");
    }
}

-(void)presentViewController:(UIViewController *)viewController
{
    if (viewController) {
        UIViewController * topVC = [self topMostViewController];
        [self addController:viewController];
        
        [self transitionFromViewController:topVC
                          toViewController:viewController
                                  duration:ANIMATION_DURATION
                                   options:PRESENT_ANIMATION
                                animations:nil
                                completion:^(BOOL finished) {
                                    [viewController didMoveToParentViewController:self];
        }];
        
    } else {
        NSLog(@"Warning!: No ViewController to present");
    }
}

- (void)dismissViewController
{
    int index = [self.childViewControllers count] - 2;
    
    if (index >= 0) {
        UIViewController *targetVC = self.childViewControllers[index];
        UIViewController *topVC = [self topMostViewController];
        
        [topVC willMoveToParentViewController:nil];
        
        [self transitionFromViewController:topVC
                          toViewController:targetVC
                                  duration:ANIMATION_DURATION
                                   options:DISMISS_ANIMATION
                                animations:nil
                                completion:^(BOOL finished) {
                                    [topVC removeFromParentViewController];
        }];

    } else {
        NSLog(@"Warning!: Can't pop ViewController. Just One ViewController on the stack");
    }
}

- (void)swapToViewController:(UIViewController *)viewController
{
    if (viewController) {
        int index = [self.childViewControllers count] - 2;
        
        if (index >= 0) {
            UIViewController * topVC = [self topMostViewController];
            [self addController:viewController];
            
            [topVC willMoveToParentViewController:nil];
            
            [self transitionFromViewController:topVC
                              toViewController:viewController
                                      duration:ANIMATION_DURATION
                                       options:SWAP_ANIMATION
                                    animations:nil
                                    completion:^(BOOL finished) {
                                        [viewController didMoveToParentViewController:self];
                                        [topVC removeFromParentViewController];
                                    }];
        } else {
            NSLog(@"Warning!: Can't swap to %@. Just One ViewController on the stack", viewController);
        }
    } else {
        NSLog(@"Warning!: No ViewController to swap to");
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    if (!self.rootViewController) {
        NSLog(@"Warning!: No rootViewController");
    }
    
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

@implementation UIViewController (BContextContainer)

- (BCXContainerViewController *)bContextContainer
{
    if ([self.parentViewController isKindOfClass:[BCXContainerViewController class]]) {
        return (BCXContainerViewController *)self.parentViewController;
    }
    NSLog(@"Warning!: Parent View Controller is not a BCXContainerViewController");
    return nil;
}

@end
