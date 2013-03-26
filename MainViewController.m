//
//  MainViewController.m
//  BContextContainer
//
//  Created by Rodrigo Aguilar on 3/25/13.
//  Copyright (c) 2013 bNapkin. All rights reserved.
//

#import "MainViewController.h"
#import <SWRevealViewController/SWRevealViewController.h>
#import "PushedViewController.h"
#import "BCXContainerViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	[self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
}

- (IBAction)pushViewController:(id)sender
{
    PushedViewController *pushedVC = [[PushedViewController alloc] init];
    [self.revealViewController.bContextContainer pushViewController:pushedVC];
}

@end
