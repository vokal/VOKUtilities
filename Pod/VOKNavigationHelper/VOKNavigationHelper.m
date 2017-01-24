//
//  VOKNavigationHelper.m
//  VOKUtilities
//
//  Created by Brock Boland on 1/24/17.
//  Copyright (c) 2017 Vokal. All rights reserved.
//

#import "VOKNavigationHelper.h"

@implementation VOKNavigationHelper

+ (void)clearExistingViewsAndSwitchToViewController:(UIViewController *)viewController
{
    // Enforce the non-null
    if (viewController == nil) {
        return;
    }

    id<UIApplicationDelegate> appDelegate = [UIApplication sharedApplication].delegate;
    
    // Get rid of old VC's and views
    [appDelegate.window.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    if (appDelegate.window.rootViewController.presentedViewController) {
        [appDelegate.window.rootViewController dismissViewControllerAnimated:NO
                                                                  completion:^{
                                                                      appDelegate.window.rootViewController = viewController;
                                                                  }];
    } else {
        appDelegate.window.rootViewController = viewController;
    }
}

+ (void)clearExistingViewsAndSwitchToStoryboard:(UIStoryboard *)storyboard
{
    UIViewController *viewController = [storyboard instantiateInitialViewController];
    if (viewController) {
        [self clearExistingViewsAndSwitchToViewController:viewController];
    }
}

+ (void)clearExistingViewsAndSwitchToStoryboardNamed:(NSString *)storyboardName
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:storyboardName bundle:nil];
    if (storyboard) {
        [self clearExistingViewsAndSwitchToStoryboard:storyboard];
    }
}

@end
