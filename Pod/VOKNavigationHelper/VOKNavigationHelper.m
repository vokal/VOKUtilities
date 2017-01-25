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
    NSParameterAssert(viewController != nil);
    if (viewController == nil) {
        return;
    }
    
    id<UIApplicationDelegate> appDelegate = UIApplication.sharedApplication.delegate;
    
    if (!appDelegate.window) {
        appDelegate.window = [[UIWindow alloc] initWithFrame:UIScreen.mainScreen.bounds];
        appDelegate.window.screen = UIScreen.mainScreen;
        [appDelegate.window makeKeyAndVisible];
    }
    UIWindow *appWindow = appDelegate.window;
    
    UIView *snapshot = [UIScreen.mainScreen snapshotViewAfterScreenUpdates:NO];
    
    // Get rid of old VC's and views
    [appWindow.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    if (appWindow.rootViewController.presentedViewController) {
        [appWindow.rootViewController dismissViewControllerAnimated:NO
                                                         completion:^{
                                                             appWindow.rootViewController = viewController;
                                                         }];
    } else {
        appWindow.rootViewController = viewController;
    }
    
    if (duration > 0) {
        [appWindow addSubview:snapshot];
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
    NSParameterAssert(viewController);
    [self clearExistingViewsAndAnimateToViewController:viewController
                                              duration:0
                                               options:0
                                            completion:nil];
}

+ (void)clearExistingViewsAndSwitchToStoryboard:(UIStoryboard *)storyboard
{
    NSParameterAssert(storyboard);
    UIViewController *viewController = [storyboard instantiateInitialViewController];
    if (viewController) {
        [self clearExistingViewsAndSwitchToViewController:viewController];
    }
}

+ (void)clearExistingViewsAndSwitchToStoryboardNamed:(NSString *)storyboardName
{
    NSParameterAssert(storyboardName);
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:storyboardName bundle:nil];
    if (storyboard) {
        [self clearExistingViewsAndSwitchToStoryboard:storyboard];
    }
}

@end
