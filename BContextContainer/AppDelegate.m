//
//  AppDelegate.m
//  BContextContainer
//
//  Created by Rodrigo Aguilar on 3/25/13.
//  Copyright (c) 2013 bNapkin. All rights reserved.
//

#import "AppDelegate.h"
#import "BCXContainerViewController.h"
#import <SWRevealViewController/SWRevealViewController.h>

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
        
    UIStoryboard *gridStoryboard = [UIStoryboard storyboardWithName:@"Grid" bundle:nil];
    SWRevealViewController *revealVC = [gridStoryboard instantiateInitialViewController];
    
    BCXContainerViewController *container = [[BCXContainerViewController alloc] initWithRootViewController:revealVC];
    
    self.window.rootViewController = container;
    [self.window makeKeyAndVisible];
    return YES;
}

@end
