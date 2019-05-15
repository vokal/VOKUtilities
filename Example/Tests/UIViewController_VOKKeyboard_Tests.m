//
//  UIViewController_VOKKeyboard_Tests.m
//  VOKUtilities
//
//  Created by Ellen Shapiro (Vokal) on 5/1/15.
//  Copyright (c) 2015 Vokal. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>

#import <UIViewController+VOKKeyboard.h>

@interface UIViewController_VOKKeyboard_Tests : XCTestCase
@property (nonatomic) UIViewController *viewController;

@end

@implementation UIViewController_VOKKeyboard_Tests

- (void)setUp
{
    [super setUp];
    
    self.viewController = [[UIApplication sharedApplication] delegate].window.rootViewController;
    XCTAssertNotNil(self.viewController);
}

- (void)tearDown
{
    self.viewController = nil;
    [super tearDown];
}

- (void)testsMethodsWhichShouldThrowAssertionFailuresDoAndAGoodOneDoesnt
{
    //Neither
    XCTAssertThrows([self.viewController vok_handleKeyboardNotification:nil
                                                 withConstraintToAdjust:nil]);
    
    //Notification but no constraint
    NSNotification *testNotificaiton = [NSNotification notificationWithName:UIKeyboardWillHideNotification object:nil];
    XCTAssertThrows([self.viewController vok_handleKeyboardNotification:testNotificaiton
                                                 withConstraintToAdjust:nil]);
    
    //Constraint but no notification
    NSLayoutConstraint *testConstraint = [NSLayoutConstraint constraintWithItem:self.viewController.view
                                                                      attribute:NSLayoutAttributeTop
                                                                      relatedBy:NSLayoutRelationEqual
                                                                         toItem:self.viewController.view.window
                                                                      attribute:NSLayoutAttributeTop
                                                                     multiplier:1
                                                                       constant:0];
    XCTAssertThrows([self.viewController vok_handleKeyboardNotification:nil
                                                 withConstraintToAdjust:testConstraint]);
    
    //Both!
    XCTAssertNoThrow([self.viewController vok_handleKeyboardNotification:testNotificaiton
                                                  withConstraintToAdjust:testConstraint]);
    
    //Non-keyboard notification
    NSNotification *notAKeyboard = [NSNotification notificationWithName:@"TEST" object:nil];
    XCTAssertThrows([self.viewController vok_handleKeyboardNotification:notAKeyboard
                                                 withConstraintToAdjust:testConstraint]);
}

@end
