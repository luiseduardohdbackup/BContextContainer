//
//  PushedViewController.m
//  BContextContainer
//
//  Created by Rodrigo Aguilar on 3/25/13.
//  Copyright (c) 2013 bNapkin. All rights reserved.
//

#import "PushedViewController.h"
#import "BCXContainerViewController.h"
#import "PresentedViewController.h"

@interface PushedViewController ()

@end

@implementation PushedViewController

- (IBAction)popViewController:(id)sender
{
    [self.bContextContainer popViewController];
}

- (IBAction)presentViewController:(id)sender
{
    PresentedViewController *presentVC = [[PresentedViewController alloc] init];
    [self.bContextContainer presentViewController:presentVC];
}

@end
