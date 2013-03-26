//
//  SwapedViewController.m
//  BContextContainer
//
//  Created by Rodrigo Aguilar on 3/26/13.
//  Copyright (c) 2013 bNapkin. All rights reserved.
//

#import "SwapedViewController.h"
#import "BCXContainerViewController.h"

@interface SwapedViewController ()

@end

@implementation SwapedViewController

- (IBAction)dismiss:(id)sender
{
    [self.bContextContainer dismissViewController];
}

@end
