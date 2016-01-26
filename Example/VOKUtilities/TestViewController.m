//
//  TestViewController.m
//  VOKUtilities
//
//  Created by Ellen Shapiro (Vokal) on 12/8/15.
//  Copyright © 2015 Vokal. All rights reserved.
//

#import "TestViewController.h"

#import "UIView+VOKDebug.h"
#import "UIViewController+VOKKeyboard.h"

NSString *const VOKTestViewAccessibilityLabel = @"TestView";

@interface TestViewController() <UITextFieldDelegate>
@property (nonatomic) NSLayoutConstraint *bottomOfViewConstraint;
@end

@implementation TestViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor blueColor];
    
    //Enable user interaction and set an Accessibility label to test the finger.
    self.view.userInteractionEnabled = YES;
    self.view.accessibilityLabel = VOKTestViewAccessibilityLabel;
    [self.view vok_addGestureRecognizerWithTestFinger:[[UIPanGestureRecognizer alloc] init]];

    //Add red view and listen for keyboard notifications to test the keyboard
    [self addRedView];
    
    [self vok_addKeyboardObserverWithHandler:@selector(handleKeyboardNotification:)];
}

- (void)dealloc
{
    [self vok_removeKeyboardObserver];
}

- (void)addRedView
{
    UITextField *redView = [[UITextField alloc] init];
    redView.delegate = self;
    redView.backgroundColor = [UIColor redColor];
    redView.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self.view addSubview:redView];
    
    //Bottom
    self.bottomOfViewConstraint = [NSLayoutConstraint constraintWithItem:self.bottomLayoutGuide
                                                               attribute:NSLayoutAttributeTop
                                                               relatedBy:NSLayoutRelationEqual
                                                                  toItem:redView
                                                               attribute:NSLayoutAttributeBottom
                                                              multiplier:1
                                                                constant:0];
    [self.view addConstraint:self.bottomOfViewConstraint];
    
    //Height
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:redView
                                                          attribute:NSLayoutAttributeHeight
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:nil
                                                          attribute:NSLayoutAttributeNotAnAttribute
                                                         multiplier:1
                                                           constant:50]];
    
    //Left
    [self.view addConstraint: [NSLayoutConstraint constraintWithItem:redView
                                                           attribute:NSLayoutAttributeLeft
                                                           relatedBy:NSLayoutRelationEqual
                                                              toItem:self.view
                                                           attribute:NSLayoutAttributeLeft
                                                          multiplier:1
                                                            constant:0]];
    
    //Right
    [self.view addConstraint: [NSLayoutConstraint constraintWithItem:redView
                                                           attribute:NSLayoutAttributeRight
                                                           relatedBy:NSLayoutRelationEqual
                                                              toItem:self.view
                                                           attribute:NSLayoutAttributeRight
                                                          multiplier:1
                                                            constant:0]];

}

- (void)handleKeyboardNotification:(NSNotification *)notificaton
{
    [self vok_handleKeyboardNotification:notificaton
                  withConstraintToAdjust:self.bottomOfViewConstraint];
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return NO;
}

@end
