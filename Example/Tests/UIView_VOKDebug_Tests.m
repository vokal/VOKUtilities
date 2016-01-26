//
//  UIView_VOKDebug_Tests.m
//  VOKUtilities
//
//  Created by Ellen Shapiro (Vokal) on 4/30/15.
//  Copyright (c) 2015 Vokal. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <UIKit/UIKit.h>
#import "UIView+VOKDebug.h"

@interface UIView_VOKDebug_Tests : XCTestCase
@property (nonatomic) BOOL debugDefinitionChanged;

@end

@implementation UIView_VOKDebug_Tests

#pragma mark - Test Lifecycle

+ (void)setUp
{
    [super setUp];
#ifndef DEBUG
    XCTFail(@"Debug is not defined for your tests - this is definitely not going to work.");
#endif
}

#pragma mark - Tests

- (void)testAddsBorderToAViewOfAppropriateColor
{    
    UIView *testView = [[UIView alloc] init];
    [testView vok_addDebugBorderOfColor:[UIColor greenColor]];
    
    //Is the border width added?
    XCTAssertEqualWithAccuracy(testView.layer.borderWidth, 1, 0.00001);
    
    //Is it the correct color?
    XCTAssertTrue(CGColorEqualToColor(testView.layer.borderColor, [UIColor greenColor].CGColor));
    
    [testView vok_addDebugBorderOfColor:[UIColor blueColor]];
    XCTAssertTrue(CGColorEqualToColor(testView.layer.borderColor, [UIColor blueColor].CGColor));
}

@end
