//
//  VOKNavigationHelper_UITests.m
//  VOKUtilities
//
//  Created by Brock Boland on 1/24/17.
//  Copyright © 2017 Vokal. All rights reserved.
//

#import <KIF/KIF.h>
#import "VOKNavigationHelper.h"
#import "AnotherViewController.h"
#import "TestViewController.h"

static NSString *FirstStoryboardLabelText = @"This is in the first storyboard";
static NSString *SecondStoryboardLabelText = @"This is in the second storyboard";

@interface VOKNavigationHelper_UITests : KIFTestCase

@end

@implementation VOKNavigationHelper_UITests

- (void)afterAll
{
    // Reset back to the default view controller
    [VOKNavigationHelper clearExistingViewsAndSwitchToViewController:[[TestViewController alloc] init]];
    [super afterAll];
}

- (void)testStoryboardJumping
{
    [VOKNavigationHelper clearExistingViewsAndSwitchToStoryboardNamed:@"First"];
    [tester waitForViewWithAccessibilityLabel:FirstStoryboardLabelText];
    [VOKNavigationHelper clearExistingViewsAndSwitchToStoryboardNamed:@"Second"];
    [tester waitForViewWithAccessibilityLabel:SecondStoryboardLabelText];
}

- (void)testViewControllerJumping
{
    UIViewController *viewController = [[AnotherViewController alloc] init];
    [VOKNavigationHelper clearExistingViewsAndSwitchToViewController:viewController];
    [tester waitForViewWithAccessibilityLabel:AnotherViewControllerLabelText];
}

@end
