//
//  NSNumberFormatter_VOKAL_Tests.m
//  VOKUtilities
//
//  Created by Ellen Shapiro (Vokal) on 5/1/15.
//  Copyright (c) 2015 Vokal. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <XCTest/XCTest.h>

#import <NSNumberFormatter+VOKAL.h>

@interface NSNumberFormatter_VOKAL_Tests : XCTestCase

@end

@implementation NSNumberFormatter_VOKAL_Tests

- (void)testFormatterIsASingleton
{
    NSNumberFormatter *one = [NSNumberFormatter vok_autoUpdatingCurrencyFormatter];
    NSNumberFormatter *two = [NSNumberFormatter vok_autoUpdatingCurrencyFormatter];
    
    XCTAssertEqual(one, two);
}

- (void)testIfInUSFormatsProperly
{
    if ([[NSLocale autoupdatingCurrentLocale].localeIdentifier isEqualToString:@"en-US"]) {
        NSNumberFormatter *formatter = [NSNumberFormatter vok_autoUpdatingCurrencyFormatter];
        NSString *threeNinetyNine = [formatter stringFromNumber:@3.99];
        XCTAssertEqual(threeNinetyNine, @"$3.99");
    } //else nothing to test...for now.
    
    //TODO: Add more schemes testing in different locales if possible.
}


@end
