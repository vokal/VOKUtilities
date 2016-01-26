//
//  UIView+VOKCircle.m
//  VOKUtilities
//
//  Created by Ellen Shapiro (Vokal) on 4/30/15.
//  Copyright (c) 2015 Vokal. All rights reserved.
//

#import "UIView+VOKCircle.h"

@implementation UIView (VOKCircle)

- (void)vok_circleify
{
    if (CGRectGetWidth(self.frame) != CGRectGetHeight(self.frame)) {
        NSAssert(NO, @"Trying to make a circle out of something that's not a square to start with!");
    }
    
    self.layer.cornerRadius = CGRectGetHeight(self.frame) / 2.0;
    self.clipsToBounds = YES;
}

@end
