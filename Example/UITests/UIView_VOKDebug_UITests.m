//
//  UITests.m
//  UITests
//
//  Created by Ellen Shapiro (Vokal) on 4/30/15.
//  Copyright (c) 2015 Vokal. All rights reserved.
//

#import <KIF/KIF.h>

#import "TestViewController.h"

@interface UIView_VOKDebug_UITests : KIFTestCase
@property (nonatomic) BOOL dragging;
@property (nonatomic) BOOL fingerViewsVerified;
@property (nonatomic) NSUInteger expectedFingers;
@property (nonatomic) NSUInteger expectedNonFingerViews;
@end

@implementation UIView_VOKDebug_UITests

- (void)setUp
{
    [super setUp];
    
    self.dragging = NO;
    self.fingerViewsVerified = NO;
    self.expectedFingers = 0;
    self.expectedNonFingerViews = 1;
}

- (NSString *)sublayersKey
{
    return NSStringFromSelector(@selector(sublayers));
}

- (NSUInteger)expectedViewsPlusFingers
{
    return self.expectedNonFingerViews + self.expectedFingers;
}

- (void)testPanGestureRecognizerShowsFingerAndRemovesIt
{
    self.expectedFingers = 1;
    
    UIView *testView = [tester waitForViewWithAccessibilityLabel:VOKTestViewAccessibilityLabel];
    XCTAssertEqual(testView.subviews.count, self.expectedNonFingerViews);
    
    CGPoint start = CGPointMake(CGRectGetMinX(testView.frame) + 20, 200);
    CGPoint end = CGPointMake(CGRectGetMaxX(testView.frame) - 20, 200);
    
    //Observe the sublayers since they're actually KVO compliant, unlike subviews.
    [testView.layer addObserver:self
                     forKeyPath:[self sublayersKey]
                        options:0
                        context:NULL];
    
    self.dragging = YES;
    [testView dragFromPoint:start
                    toPoint:end
                      steps:100];
    self.dragging = NO;
    
    //Did this actually fire?
    XCTAssertTrue(self.fingerViewsVerified);
    
    //Did it come back out? 
    XCTAssertEqual(testView.subviews.count, self.expectedNonFingerViews);
}

//TODO: Add handling and tests for multi-finger gestures.

#pragma mark - KVOOOOOOO

- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary *)change
                       context:(void *)context
{
    if ([keyPath isEqualToString:[self sublayersKey]]) {
        if (self.dragging && !self.fingerViewsVerified) {
            //Even though we're observing the sublayers, we should verify the subviews.
            UIView *testView = [tester waitForViewWithAccessibilityLabel:VOKTestViewAccessibilityLabel];
            XCTAssertEqual(testView.subviews.count, [self expectedViewsPlusFingers]);
            self.fingerViewsVerified = YES;
        } else {
            if (!self.dragging) {
                UIView *testView = [tester waitForViewWithAccessibilityLabel:VOKTestViewAccessibilityLabel];
                XCTAssertEqual(testView.subviews.count, self.expectedNonFingerViews);
            } //else do nothing.
        }
    } else {
        [super observeValueForKeyPath:keyPath
                             ofObject:object
                               change:change
                              context:context];
    }
}

@end
