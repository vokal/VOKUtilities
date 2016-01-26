//
//  UIView+VOKCircle.h
//  VOKUtilities
//
//  Created by Ellen Shapiro (Vokal) on 4/30/15.
//  Copyright (c) 2015 Vokal. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (VOKCircle)

/**
 *  Takes a square view and turns it into a circle. 
 * 
 *  NOTE: In debug mode, will throw an assertion failure if you try to 
 *        use a non-square view.
 */
- (void)vok_circleify;

@end
