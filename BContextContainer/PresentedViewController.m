//
//  PresentedViewController.m
//  BContextContainer
//
//  Created by Rodrigo Aguilar on 3/26/13.
//  Copyright (c) 2013 bNapkin. All rights reserved.
//

#import "PresentedViewController.h"
#import "BCXContainerViewController.h"
#import "SwapedViewController.h"

@interface PresentedViewController ()

@end

@implementation PresentedViewController

- (IBAction)dismiss:(id)sender
{
    [self.bContextContainer dismissViewController];
}

- (IBAction)swapViewController:(id)sender
{
    SwapedViewController *swapedVC = [[SwapedViewController alloc] init];
    [self.bContextContainer swapToViewController:swapedVC];
}

@end
