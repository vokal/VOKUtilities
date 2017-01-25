//
//  VOKNavigationHelper.h
//  VOKUtilities
//
//  Created by brock Boland on 1/24/17.
//  Copyright (c) 2017 Vokal. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface VOKNavigationHelper : NSObject

/**
 * Replace the root view controller of the app delegate's window with the provided view controller,
 * using the provided animation options.
 * This method will make all subviews on the window remove themselves from their superview, and
 * dismiss any presented view controller, to ensure that the view stack is completely clear before
 * setting the rootViewController on the window.
 *
 * @param viewController  View controller to display
 * @param duration        Animation duration
 * @param options         Animation options
 * @param completion      Completion block to execute after the animation completes
 */
+ (void)clearExistingViewsAndAnimateToViewController:(UIViewController *)viewController
                                            duration:(NSTimeInterval)duration
                                             options:(UIViewAnimationOptions)options
                                          completion:(void (^ __nullable)(BOOL finished))completion;

/**
 * Replace the root view controller of the app delegate's window with the provided view controller.
 * Makes use of the clearExistingViewsAndAnimateToViewController:duration:options:completion method.
 *
 * @param viewController  View controller to display
 */
+ (void)clearExistingViewsAndSwitchToViewController:(UIViewController *)viewController;

/**
 * Replace the root view controller of the app delegate's window with the initial view controller in
 * the provided storyboard. Makes use of the clearExistingViewsAndSwitchToViewController: method.
 * If no initial view controller is available, no action is taken.
 *
 * @param storyboard  Storyboard from which to display the initial view controller
 */
+ (void)clearExistingViewsAndSwitchToStoryboard:(UIStoryboard *)storyboard;

/**
 * Replace the root view controller of the app delegate's window with the initial view controller in
 * the storyboard named, loaded from the main bundle. If the storyboard is not found, no action is
 * taken.
 *
 * @param storyboardName  Name of the storyboard (in the main bundle) from which to display the initial view controller
 */
+ (void)clearExistingViewsAndSwitchToStoryboardNamed:(NSString *)storyboardName;

@end

NS_ASSUME_NONNULL_END
