//
//  UIViewController+VOKKeyboard.m
//  VOKUtilities
//
//  Created by Ellen Shapiro (Vokal) on 5/1/15.
//  Copyright (c) 2015 Vokal. All rights reserved.
//

#import "UIViewController+VOKKeyboard.h"

@implementation UIViewController (VOKKeyboard)


- (void)vok_addKeyboardObserverWithHandler:(SEL)notificationHandler
{
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:notificationHandler
                                                 name:UIKeyboardWillChangeFrameNotification
                                               object:nil];
}

- (void)vok_removeKeyboardObserver
{
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIKeyboardWillChangeFrameNotification
                                                  object:nil];
}

- (void)vok_handleKeyboardNotification:(NSNotification *)notification
                withConstraintToAdjust:(NSLayoutConstraint *)constraintToAdjust
{
    NSParameterAssert(notification);
    NSParameterAssert(constraintToAdjust);
    
    if (!notification || !constraintToAdjust) {
        //bail out in production.
        return;
    }
    
    NSString *name = notification.name;
    if (![name isEqualToString:UIKeyboardWillShowNotification]
        && ![name isEqualToString:UIKeyboardDidShowNotification]
        && ![name isEqualToString:UIKeyboardWillChangeFrameNotification]
        && ![name isEqualToString:UIKeyboardDidChangeFrameNotification]
        && ![name isEqualToString:UIKeyboardWillHideNotification]
        && ![name isEqualToString:UIKeyboardDidHideNotification]) {
        NSAssert(NO, @"This is trying to handle a non-keyboard notification!");
        //Bail in production.
        return;
    }
    
    NSDictionary *info = notification.userInfo;
    
    //Get info from dictionary.
    CGRect endFrame = [info[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    CGRect startFrame = [info[UIKeyboardFrameBeginUserInfoKey] CGRectValue];
    UIViewAnimationCurve curve = [info[UIKeyboardAnimationCurveUserInfoKey] integerValue];
    NSTimeInterval duration = [info[UIKeyboardAnimationDurationUserInfoKey] floatValue];
    
    //Change the height of the scrollView to accomodate the keyboard.
    CGFloat deltaHeight = CGRectGetMinY(startFrame) - CGRectGetMinY(endFrame);
    
    //Account for the bottom layout guide (ie, tab bars).
    
        CGFloat adjustment = 0;
        if (self.navigationController) {
            adjustment = self.navigationController.bottomLayoutGuide.length;
        } else {
            adjustment = self.bottomLayoutGuide.length;
        }
        
        //Only account for the adjustment if the delta height is bigger than the adjustment.
        if (fabs(deltaHeight) > adjustment) {
            if (deltaHeight < 0) {
                deltaHeight += adjustment;
            } else {
                deltaHeight -= adjustment;
            }
    }
    
    CGFloat currentConstant = constraintToAdjust.constant;
    //Make sure the new constant is less than the full size of the frame, so it doesn't get shoved off the top of the screen
    CGFloat newConstant = MIN(CGRectGetHeight(self.view.frame), (currentConstant + deltaHeight));
    //Make sure the new constant is greater than 0.
    newConstant = MAX(0, newConstant);
    
    constraintToAdjust.constant = newConstant;
    
    //Animate the constraint adjustment along with the view. 
    //Translate the curve into a UIViewAnimationOption because ಠ_ಠ.
    UIViewAnimationOptions curveOption = [[self class] vok_optionForCurve:curve];
    [UIView animateWithDuration:duration
                          delay:0
                        options:curveOption
                     animations:^{
                         [self.view layoutIfNeeded];
                     } completion:nil];
}

+ (UIViewAnimationOptions)vok_optionForCurve:(UIViewAnimationCurve)curve
{
    switch (curve) {
        case UIViewAnimationCurveEaseInOut:
            return UIViewAnimationOptionCurveEaseInOut;
        case UIViewAnimationCurveEaseIn:
            return UIViewAnimationOptionCurveEaseIn;
        case UIViewAnimationCurveEaseOut:
            return UIViewAnimationOptionCurveEaseOut;
        case UIViewAnimationCurveLinear:
            return UIViewAnimationOptionCurveLinear;
        default:
            NSLog(@"Unknown curve, probably a private value!");
            return UIViewAnimationOptionCurveEaseInOut;
    }
}

@end
