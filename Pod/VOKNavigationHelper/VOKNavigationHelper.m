//
//  VOKNavigationHelper.m
//  VOKUtilities
//
//  Created by Brock Boland on 1/24/17.
//  Copyright (c) 2017 Vokal. All rights reserved.
//

#import "VOKNavigationHelper.h"

@implementation VOKNavigationHelper

+ (void)clearExistingViewsAndAnimateToViewController:(UIViewController *)viewController
                                            duration:(NSTimeInterval)duration
                                             options:(UIViewAnimationOptions)options
                                          completion:(void (^ __nullable)(BOOL finished))completion
{
    // Enforce the non-null
    if (viewController == nil) {
        return;
    }
    
    id<UIApplicationDelegate> appDelegate = [UIApplication sharedApplication].delegate;
    
    if (!appDelegate.window) {
        appDelegate.window = [[UIWindow alloc] initWithFrame:UIScreen.mainScreen.bounds];
        appDelegate.window.screen = UIScreen.mainScreen;
        [appDelegate.window makeKeyAndVisible];
    }
    
    UIView *snapshot = [UIScreen.mainScreen snapshotViewAfterScreenUpdates:NO];
    
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
    
    if (duration > 0) {
        [appDelegate.window addSubview:snapshot];
        [UIView transitionFromView:snapshot
                            toView:viewController.view
                          duration:duration
                           options:options
                        completion:^(BOOL finished) {
                            [snapshot removeFromSuperview];
                            if (completion) {
                                completion(YES);
                            }
                        }];
    } else if (completion) {
        completion(YES);
    }
}

+ (void)clearExistingViewsAndSwitchToViewController:(UIViewController *)viewController
{
    [self clearExistingViewsAndAnimateToViewController:viewController
                                              duration:0
                                               options:0
                                            completion:nil];
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
