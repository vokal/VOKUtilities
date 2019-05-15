//
//  UIView_VOKCircle_Tests.m
//  VOKUtilities
//
//  Created by Ellen Shapiro (Vokal) on 4/30/15.
//  Copyright (c) 2015 Vokal. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>

#import <UIView+VOKCircle.h>

@interface UIView_VOKCircle_Tests : XCTestCase

@end

@implementation UIView_VOKCircle_Tests

- (void)testMakesACircleOutOfASquareView
{
    UIView *square = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    
    [square vok_circleify];
    
    XCTAssertEqualWithAccuracy(square.layer.cornerRadius, 50, 0.0001);
}

- (void)testCreatesAHalfPointWithAnOddLength
{
    UIView *oddSquare = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 101, 101)];
    [oddSquare vok_circleify];
    XCTAssertEqualWithAccuracy(oddSquare.layer.cornerRadius, 50.5, 0.0001);
}

- (void)testThrowsAnAssertionIfYouTryToUseANonSquareView
{
    UIView *notQuiteSquare = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 101, 100)];
    
    XCTAssertThrows([notQuiteSquare vok_circleify]);
}


@end
