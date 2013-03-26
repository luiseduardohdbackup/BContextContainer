//
//  BCXContainerViewController.h
//  BContextContainerController
//
//  Created by Rodrigo Aguilar on 3/25/13.
//  Copyright (c) 2013 bNapkin. All rights reserved.
//

#import <UIKit/UIKit.h>

#define ANIMATION_DURATION 0.75
#define PRESENT_ANIMATION UIViewAnimationOptionTransitionCrossDissolve
#define DISMISS_ANIMATION UIViewAnimationOptionTransitionCrossDissolve
#define SWAP_ANIMATION UIViewAnimationOptionTransitionCrossDissolve

@interface BCXContainerViewController : UIViewController

- (id)initWithRootViewController:(UIViewController *)rootViewController;

- (void)pushViewController:(UIViewController *)viewController;
- (void)popViewController;

- (void)presentViewController:(UIViewController *)viewController;
- (void)swapToViewController:(UIViewController *)viewController;
- (void)dismissViewController;

@end

@interface UIViewController (BContextContainer)

@property (nonatomic, readonly) BCXContainerViewController *bContextContainer;

@end
