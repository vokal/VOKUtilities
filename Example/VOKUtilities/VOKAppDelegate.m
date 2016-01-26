//
//  VOKAppDelegate.m
//  VOKUtilities
//
//  Created by CocoaPods on 11/10/2014.
//  Copyright (c) 2014 Vokal. All rights reserved.
//

#import "VOKAppDelegate.h"

#import "TestViewController.h"

@implementation VOKAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] init];
    self.window.rootViewController = [[TestViewController alloc] init];
    [self.window makeKeyAndVisible];
    self.window.frame = [[UIScreen mainScreen] bounds];

    return YES;
}

@end
