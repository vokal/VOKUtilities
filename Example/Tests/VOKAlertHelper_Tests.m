//
//  VOKAlertHelper_Tests.m
//  VOKUtilities
//
//  Created by Rachel Hyman on 6/19/15.
//  Copyright (c) 2015 Vokal. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>

#import "VOKAlertHelper.h"

@interface VOKAlertHelper_Tests : XCTestCase

@property (nonatomic, strong) UIViewController *vc;

@end

static NSString *const AlertTitle = @"Alert";
static NSString *const AlertMessage = @"This is an alert";
static NSString *const OK = @"OK";

@implementation VOKAlertHelper_Tests

- (void)setUp
{
    [super setUp];
    
    if (!self.vc) {
        self.vc = [[UIViewController alloc] init];
    }
}

- (void)tearDown
{
    self.vc = nil;
    
    [super tearDown];
}

- (void)testNilInputs
{
    VOKAlertAction *alertActionNoBlock = [[VOKAlertAction alloc] initWithTitle:OK actionBlock:nil];
    
    XCTAssertThrows([[VOKAlertAction alloc] initWithTitle:nil actionBlock:nil]);
    
    if ([UIAlertController class]) {
        //No VC (iOS 8+ only)
        XCTAssertThrows([VOKAlertHelper showAlertFromViewController:nil
                                                          withTitle:AlertTitle
                                                            message:AlertMessage
                                                            buttons:@[alertActionNoBlock]]);
    }
    
    //No title
    XCTAssertNoThrow([VOKAlertHelper showAlertFromViewController:self.vc
                                                       withTitle:nil
                                                         message:AlertMessage
                                                         buttons:@[alertActionNoBlock]]);
    
    //No message
    XCTAssertNoThrow([VOKAlertHelper showAlertFromViewController:self.vc
                                                       withTitle:AlertTitle
                                                         message:nil
                                                         buttons:@[alertActionNoBlock]]);
    
    //No buttons array.
    XCTAssertThrows([VOKAlertHelper showAlertFromViewController:self.vc
                                                      withTitle:AlertTitle
                                                        message:AlertMessage
                                                        buttons:nil]);
    
    //Empty buttons array.
    XCTAssertThrows([VOKAlertHelper showAlertFromViewController:self.vc
                                                      withTitle:AlertTitle
                                                        message:AlertMessage
                                                        buttons:@[]]);
}

- (void)testInvalidButtonsArray
{
    //Passing in non-VOKAlertAction items to the buttons parameter should throw an assertion.
    XCTAssertThrows([VOKAlertHelper showAlertFromViewController:self.vc
                                                      withTitle:AlertTitle
                                                        message:AlertMessage
                                                        buttons:@[@"Alert"]]);
    
    XCTAssertThrows([VOKAlertHelper showAlertFromViewController:self.vc
                                                      withTitle:AlertTitle
                                                        message:AlertMessage
                                                        buttons:@[[UIButton buttonWithType:UIButtonTypeSystem]]]);
    
    XCTAssertThrows([VOKAlertHelper showAlertFromViewController:self.vc
                                                      withTitle:AlertTitle
                                                        message:AlertMessage
                                                        buttons:@[[UIAlertAction actionWithTitle:OK
                                                                                           style:UIAlertActionStyleDefault
                                                                                         handler:nil]]]);
}

- (void)testValidButtonsArray
{
    //Alert action with no action block.
    VOKAlertAction *alertActionNoBlock = [[VOKAlertAction alloc] initWithTitle:OK actionBlock:nil];
    XCTAssertNoThrow([VOKAlertHelper showAlertFromViewController:self.vc
                                                       withTitle:AlertTitle
                                                         message:AlertMessage
                                                         buttons:@[alertActionNoBlock]]);
    
    //Alert action with action block.
    VOKAlertAction *alertActionWithBlock = [[VOKAlertAction alloc] initWithTitle:OK actionBlock:^{
        NSLog(@"Log when button is hit");
    }];
    XCTAssertNoThrow([VOKAlertHelper showAlertFromViewController:self.vc
                                                       withTitle:AlertTitle
                                                         message:AlertMessage
                                                         buttons:@[alertActionWithBlock]]);
}

@end
