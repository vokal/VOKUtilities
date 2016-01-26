//
//  UIViewController+VOKKeyboard.h
//  VOKUtilities
//
//  Created by Ellen Shapiro (Vokal) on 5/1/15.
//  Copyright (c) 2015 Vokal. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (VOKKeyboard)

/**
 *  Adds a generic keyboard observer with the given notification handler.
 *
 *  @param notificationHandler The notification handling selector to use. 
 *                             NOTE: This should take a notification as a parameter.
 */
- (void)vok_addKeyboardObserverWithHandler:(SEL)notificationHandler;

/**
 *  Removes the generic keyboard observer. Should generally be called in dealloc/deinit
 */
- (void)vok_removeKeyboardObserver;

/**
 * Adjust the given constraint based on the passed-in keyboard notification. Note that this constraint
 * should normally be the bottom constraint of a scrollview or tableview to allow for proper scrolling.
 *
 * @param notification              The received keyboard change notification (Required - this method
 *                                  will throw an assertion failure if not present or if the method is not
 *                                  a keyboard notification)
 * @param constraintToAdjust        The NSLayoutConstraint to adjust based on the notification (Required -
 *                                  this method will throw an assertion failure if not present)
 */
- (void)vok_handleKeyboardNotification:(NSNotification *)notification
                withConstraintToAdjust:(NSLayoutConstraint *)constraintToAdjust;

/**
 * Helper method to account for the fact that certain keyboard notifications still return UIViewAnimationCurve 
 * values even though those have been deprecated for quite some time. 
 *
 * @param curve The incoming value of a deprecated UIViewAnimationCurve
 *
 * @return The combination of UIViewAnimationOptions which make up this curve.
 */
+ (UIViewAnimationOptions)vok_optionForCurve:(UIViewAnimationCurve)curve;

@end
