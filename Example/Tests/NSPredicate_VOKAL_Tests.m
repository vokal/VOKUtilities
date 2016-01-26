//
//  NSPredicate_VOKAL_Tests.m
//  VOKUtilities
//
//  Created by Carl Hill-Popper on 4/11/15.
//  Copyright (c) 2015 Vokal. All rights reserved.
//

#import <XCTest/XCTest.h>

#import <NSPredicate+VOKAL.h>

@interface NSPredicate_VOKAL_Tests : XCTestCase

@end

@implementation NSPredicate_VOKAL_Tests

- (NSArray *)arrayForTesting
{
    return @[
             @1,
             @"1",
             @2,
             @3,
             @3.0,
             @3.000001,
             @"3",
             @"three",
             @4,
             @5,
             @6,
             @6.0,
             @6.6,
             @"6",
             @"six",
             @"5+1",
             ];
}

- (NSSet *)setForTesting
{
    return [NSSet setWithArray:[self arrayForTesting]];
}

- (void)testPredicateWithValueForKey
{
    NSPredicate *sixesPredicate = [NSPredicate vok_predicateWithValue:@6
                                                           forKeyPath:@"integerValue"];
    
    NSArray *expectedArray = @[
                               @6,
                               @6.0,
                               @6.6,
                               @"6",
                               ];
    
    XCTAssertEqualObjects([[self arrayForTesting] filteredArrayUsingPredicate:sixesPredicate],
                          expectedArray);
    
    XCTAssertEqualObjects([[self setForTesting] filteredSetUsingPredicate:sixesPredicate],
                          [NSSet setWithArray:expectedArray]);
    
}

- (void)testPredicateWithValueForKeyPath
{
    NSPredicate *keyPathPredicate = [NSPredicate vok_predicateWithValue:@"3"
                                                             forKeyPath:@"integerValue.stringValue"];
    
    NSArray *expectedArray = @[
                               @3,
                               @3.0,
                               @3.000001,
                               @"3",
                               ];
    
    XCTAssertEqualObjects([[self arrayForTesting] filteredArrayUsingPredicate:keyPathPredicate],
                          expectedArray);
    
    XCTAssertEqualObjects([[self setForTesting] filteredSetUsingPredicate:keyPathPredicate],
                          [NSSet setWithArray:expectedArray]);
    
}

- (void)testPredicateWithKeyInCollectionDoesNotThrowExceptionForCollections
{
    NSString *key = @"keyname";
    XCTAssertNoThrow([NSPredicate vok_predicateWithKeyPath:key
                                              inCollection:@[]]);
    
    XCTAssertNoThrow([NSPredicate vok_predicateWithKeyPath:key
                                              inCollection:[NSSet set]]);
    
    XCTAssertNoThrow([NSPredicate vok_predicateWithKeyPath:key
                                              inCollection:@{}]);
    
    XCTAssertNoThrow([NSPredicate vok_predicateWithKeyPath:key
                                              inCollection:[NSMutableArray array]]);
    
    XCTAssertNoThrow([NSPredicate vok_predicateWithKeyPath:key
                                              inCollection:[NSMutableSet set]]);
    
    XCTAssertNoThrow([NSPredicate vok_predicateWithKeyPath:key
                                              inCollection:[NSMutableDictionary dictionary]]);
}

- (void)testPredicateWithKeyInCollectionThrowsExceptionForNonCollections
{
    NSString *notACollection = @"This is not a collection object";
    
    XCTAssertThrows([NSPredicate vok_predicateWithKeyPath:@"keyname"
                                             inCollection:notACollection]);
    
    XCTAssertThrows([NSPredicate vok_predicateWithKeyPath:@"keyname"
                                             inCollection:nil]);
}

- (void)testPredicateWithKeyInCollection
{
    NSArray *oneTwoThree = @[
                             @1,
                             @2,
                             @3,
                             ];
    NSPredicate *oneTwoThreePredicate = [NSPredicate vok_predicateWithKeyPath:@"integerValue"
                                                                 inCollection:oneTwoThree];
    
    NSArray *expectedArray = @[
                               @1,
                               @"1",
                               @2,
                               @3,
                               @3.0,
                               @3.000001,
                               @"3",
                               ];
    
    XCTAssertEqualObjects([[self arrayForTesting] filteredArrayUsingPredicate:oneTwoThreePredicate],
                          expectedArray);
    
    XCTAssertEqualObjects([[self setForTesting] filteredSetUsingPredicate:oneTwoThreePredicate],
                          [NSSet setWithArray:expectedArray]);
    
    NSDictionary *dictionaryOneTwoThree = @{
                                            @"one": @1,
                                            @"two": @2,
                                            @"three": @3,
                                            };
    
    NSPredicate *dictOneTwoThreePredicate = [NSPredicate vok_predicateWithKeyPath:@"integerValue"
                                                                     inCollection:dictionaryOneTwoThree];
    
    XCTAssertEqualObjects([[self arrayForTesting] filteredArrayUsingPredicate:dictOneTwoThreePredicate],
                          expectedArray);
    
    XCTAssertEqualObjects([[self setForTesting] filteredSetUsingPredicate:dictOneTwoThreePredicate],
                          [NSSet setWithArray:expectedArray]);
}

@end
