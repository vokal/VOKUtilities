//
//  AnotherViewController.m
//  VOKUtilities
//
//  Created by Brock Boland on 1/24/17.
//  Copyright © 2017 Vokal. All rights reserved.
//

#import "AnotherViewController.h"

NSString *AnotherViewControllerLabelText = @"This is a label from code";

@implementation AnotherViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Add a dummy label to the view, for UI test
    UILabel *label = [[UILabel alloc] init];
    label.text = AnotherViewControllerLabelText;
    label.translatesAutoresizingMaskIntoConstraints = NO;
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:label];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:label
                                                          attribute:NSLayoutAttributeCenterX
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeCenterX
                                                         multiplier:1
                                                           constant:0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:label
                                                          attribute:NSLayoutAttributeCenterY
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeCenterY
                                                         multiplier:1
                                                           constant:0]];
}

@end
