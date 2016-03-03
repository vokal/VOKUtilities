//
//  UIView+VOKDebug.h
//  VOKUtilities
//
//  Created by Ellen Shapiro (Vokal) on 4/30/15.
//  Copyright (c) 2015 Vokal. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (VOKDebug)

/**
 *  Adds a border of 1pt of the given color to the receiver if DEBUG is 
 *  defined. If DEBUG is not defined, nothing happens.
 *
 *  @param color The color for the border.
 */
- (void)vok_addDebugBorderOfColor:(UIColor *)color;

/**
 *  Adds a red "Test finger" which follows the gesture recognizer on screen
 *  when tests are underway, and which does nothing when not testing. 
 *
 *  NOTE: This will add a single "finger" no matter what type the gesture recognizer is - for
 *          recognizers with more than one touch, it will use locationInView: of the receiver
 *          to center the "finger."
 *
 *  @param gestureRecognizer The gesture recognizer you wish to add
 *
 *  @return The test finger view, or nil if that view was not added. 
 */
- (nullable UIView *)vok_addGestureRecognizerWithTestFinger:(UIGestureRecognizer *)gestureRecognizer;

@end

NS_ASSUME_NONNULL_END
