//
//  VOKAlertHelper_UITests.m
//  VOKUtilities
//
//  Created by Rachel Hyman on 6/19/15.
//  Copyright (c) 2015 Vokal. All rights reserved.
//

#import <KIF/KIF.h>
#import <UIKit/UIKit.h>

#import "VOKAlertHelper.h"

@interface VOKAlertHelper_UITests : KIFTestCase

@property (nonatomic, strong) UIViewController *rootVC;

@end

static NSString *const AlertTitle = @"Alert";
static NSString *const AlertMessage = @"This is an alert";
static NSString *const OK = @"OK";
static NSString *const Cancel = @"Cancel";

@implementation VOKAlertHelper_UITests

- (void)setUp
{
    [super setUp];
    
    if (!self.rootVC) {
        self.rootVC = [[UIApplication sharedApplication] delegate].window.rootViewController;
    }
    self.rootVC.view.backgroundColor = [UIColor blueColor];
}

- (void)tearDown
{
    self.rootVC = nil;
    
    [super tearDown];
}

#pragma mark - Helpers

- (VOKAlertAction *)cancelAlertActionNoBlock
{
    return [[VOKAlertAction alloc] initWithTitle:Cancel actionBlock:nil];
}

- (VOKAlertAction *)okAlertActionWithBlock
{
    typeof(self) __weak weakSelf = self;
    return [[VOKAlertAction alloc] initWithTitle:OK actionBlock:^{
        weakSelf.rootVC.view.backgroundColor = [UIColor yellowColor];
    }];
}

#pragma mark - Tests

- (void)testShowAlertWithOneButtonNoBlock
{
    [VOKAlertHelper showAlertFromViewController:self.rootVC
                                      withTitle:AlertTitle
                                        message:AlertMessage
                                        buttons:@[[self cancelAlertActionNoBlock]]];
    
    [tester waitForViewWithAccessibilityLabel:Cancel];
    [tester tapViewWithAccessibilityLabel:Cancel];
    [tester waitForAbsenceOfViewWithAccessibilityLabel:AlertTitle];
}

- (void)testShowAlertWithOneButtonActionBlock
{
    [VOKAlertHelper showAlertFromViewController:self.rootVC
                                      withTitle:AlertTitle
                                        message:AlertMessage
                                        buttons:@[[self okAlertActionWithBlock]]];
    
    [tester waitForViewWithAccessibilityLabel:OK];
    [tester tapViewWithAccessibilityLabel:OK];
    [tester waitForAbsenceOfViewWithAccessibilityLabel:AlertTitle];
    XCTAssertEqual(self.rootVC.view.backgroundColor, [UIColor yellowColor]);
}

- (void)testShowAlertWithTwoButtonsHitCancel
{
    [VOKAlertHelper showAlertFromViewController:self.rootVC
                                      withTitle:AlertTitle
                                        message:AlertMessage
                                        buttons:@[
                                                  [self cancelAlertActionNoBlock],
                                                  [self okAlertActionWithBlock],
                                                  ]];
    
    [tester waitForViewWithAccessibilityLabel:Cancel];
    [tester tapViewWithAccessibilityLabel:Cancel];
    [tester waitForAbsenceOfViewWithAccessibilityLabel:AlertTitle];
    XCTAssertNotEqual(self.rootVC.view.backgroundColor, [UIColor yellowColor]);
}

- (void)testShowAlertWithTwoButtonsHitOK
{
    [VOKAlertHelper showAlertFromViewController:self.rootVC
                                      withTitle:AlertTitle
                                        message:AlertMessage
                                        buttons:@[
                                                  [self cancelAlertActionNoBlock],
                                                  [self okAlertActionWithBlock],
                                                  ]];
    
    [tester waitForViewWithAccessibilityLabel:OK];
    [tester tapViewWithAccessibilityLabel:OK];
    [tester waitForAbsenceOfViewWithAccessibilityLabel:AlertTitle];
    XCTAssertEqual(self.rootVC.view.backgroundColor, [UIColor yellowColor]);
}

@end
