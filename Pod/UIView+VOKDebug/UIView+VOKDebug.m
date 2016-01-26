//
//  UIView+VOKDebug.m
//  VOKUtilities
//
//  Created by Ellen Shapiro (Vokal) on 4/30/15.
//  Copyright (c) 2015 Vokal. All rights reserved.
//

#import "UIView+VOKDebug.h"

//Here be dragons!
#import <objc/runtime.h>
static const void *TestFingerKey = &TestFingerKey;

@implementation UIView (VOKDebug)

#pragma mark - Public methods

- (void)vok_addDebugBorderOfColor:(UIColor *)color
{
#ifdef DEBUG
    self.layer.borderColor = [color CGColor];
    self.layer.borderWidth = 1;
#endif
}

#pragma mark - Private methods

- (UIView *)vok_testFingerView
{
    if (NSClassFromString(@"XCTestCase") != Nil) {
        //We are testing - first see if we've already got an associated object
        UIView *finger = objc_getAssociatedObject(self, TestFingerKey);
        
        if (!finger) {
            //Finger has not yet been created. Give 'em the finger!
            finger = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
            finger.layer.cornerRadius = 10;
            finger.backgroundColor = [UIColor redColor];
            
            objc_setAssociatedObject(self, //Associate the finger with self
                                     TestFingerKey, //Using this key
                                     finger, //The view to associate
                                     OBJC_ASSOCIATION_RETAIN_NONATOMIC); //Retain the view.
        }
        
        return finger;        
    } else {
        //We are not testing!
        return nil;
    }
}

- (UIView *)vok_addGestureRecognizerWithTestFinger:(UIGestureRecognizer *)gestureRecognizer
{
    UIView *finger = [self vok_testFingerView];
    
    if (finger) {
        [gestureRecognizer addTarget:self action:@selector(vok_moveTestFinger:)];
        [self addGestureRecognizer:gestureRecognizer];
    }
    
    return finger;
}

#pragma mark - UIGestureRecognizer Handling

- (void)vok_moveTestFinger:(UIGestureRecognizer *)recognizer
{
    UIView *testFinger = [self vok_testFingerView];
    CGPoint touchPoint = [recognizer locationInView:self];
    testFinger.center = touchPoint;

    switch (recognizer.state) {
        case UIGestureRecognizerStateBegan:
            [self addSubview:testFinger];
            break;
        case UIGestureRecognizerStateEnded:
        case UIGestureRecognizerStateCancelled: //Intentional fall-through
        case UIGestureRecognizerStateFailed: //Intentional fall-through
            [testFinger removeFromSuperview];
            break;
        case UIGestureRecognizerStateChanged: //Intentional fall-through
        default:
            //Do nothing.
            break;
    }
}

@end
