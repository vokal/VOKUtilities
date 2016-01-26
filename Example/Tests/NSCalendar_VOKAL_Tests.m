//
//  NSCalendar_VOKAL_Tests.m
//  VOKUtilities
//
//  Created by Isaac Greenspan on 11/12/14.
//  Copyright (c) 2014 Vokal. All rights reserved.
//

#import <XCTest/XCTest.h>

#import <NSCalendar+VOKAL.h>

@interface NSCalendar_VOKAL_Tests : XCTestCase

@property (nonatomic, strong) NSCalendar *calendar;

@end

@implementation NSCalendar_VOKAL_Tests

- (void)setUp
{
    [super setUp];
    
    if (!self.calendar) {
        self.calendar = [NSCalendar calendarWithIdentifier:NSCalendarIdentifierGregorian];
    }
}

- (void)testLastWeekdayBeforeDate20141107
{
    NSDateComponents *components = [[NSDateComponents alloc] init];
    components.year = 2014;
    components.month = 11;
    components.day = 7;
    NSDate *fridayNovemberSeventh = [self.calendar dateFromComponents:components];
    
    NSDate *thursdayNovemberSixth = [self.calendar vok_lastWeekdayBeforeDate:fridayNovemberSeventh];
    
    XCTAssertEqual(   6, [self.calendar component:NSCalendarUnitDay fromDate:thursdayNovemberSixth]);
    XCTAssertEqual(  11, [self.calendar component:NSCalendarUnitMonth fromDate:thursdayNovemberSixth]);
    XCTAssertEqual(2014, [self.calendar component:NSCalendarUnitYear fromDate:thursdayNovemberSixth]);
    
    NSDate *wednesdayNovemberFifth = [self.calendar vok_lastWeekdayBeforeDate:thursdayNovemberSixth];
    
    XCTAssertEqual(   5, [self.calendar component:NSCalendarUnitDay fromDate:wednesdayNovemberFifth]);
    XCTAssertEqual(  11, [self.calendar component:NSCalendarUnitMonth fromDate:wednesdayNovemberFifth]);
    XCTAssertEqual(2014, [self.calendar component:NSCalendarUnitYear fromDate:wednesdayNovemberFifth]);
}

- (void)testLastWeekdayBeforeDate20141103
{
    NSDateComponents *components = [[NSDateComponents alloc] init];
    components.year = 2014;
    components.month = 11;
    components.day = 3;
    NSDate *mondayNovemberThird = [self.calendar dateFromComponents:components];
    NSDate *halloween = [self.calendar vok_lastWeekdayBeforeDate:mondayNovemberThird];
    
    XCTAssertEqual(  31, [self.calendar component:NSCalendarUnitDay fromDate:halloween]);
    XCTAssertEqual(  10, [self.calendar component:NSCalendarUnitMonth fromDate:halloween]);
    XCTAssertEqual(2014, [self.calendar component:NSCalendarUnitYear fromDate:halloween]);
}

- (void)testLastWeekdayBeforeDate20141102
{
    NSDateComponents *components = [[NSDateComponents alloc] init];
    components.year = 2014;
    components.month = 11;
    components.day = 2;
    NSDate *sundayNovemberSecond = [self.calendar dateFromComponents:components];
    NSDate *halloweenAgain = [self.calendar vok_lastWeekdayBeforeDate:sundayNovemberSecond];
    
    XCTAssertEqual(  31, [self.calendar component:NSCalendarUnitDay fromDate:halloweenAgain]);
    XCTAssertEqual(  10, [self.calendar component:NSCalendarUnitMonth fromDate:halloweenAgain]);
    XCTAssertEqual(2014, [self.calendar component:NSCalendarUnitYear fromDate:halloweenAgain]);
}

- (void)testLastWeekdayBeforeDate20141101
{
    NSDateComponents *components = [[NSDateComponents alloc] init];
    components.year = 2014;
    components.month = 11;
    components.day = 1;
    NSDate *saturdayNovemberFirst = [self.calendar dateFromComponents:components];
    NSDate *halloweenForever = [self.calendar vok_lastWeekdayBeforeDate:saturdayNovemberFirst];
    
    XCTAssertEqual(  31, [self.calendar component:NSCalendarUnitDay fromDate:halloweenForever]);
    XCTAssertEqual(  10, [self.calendar component:NSCalendarUnitMonth fromDate:halloweenForever]);
    XCTAssertEqual(2014, [self.calendar component:NSCalendarUnitYear fromDate:halloweenForever]);
}

- (void)testLastWeekdayBeforeDateLeapDay
{
    NSDateComponents *components = [[NSDateComponents alloc] init];
    components.year = 2004;
    components.month = 2;
    components.day = 29;
    NSDate *leapSunday = [self.calendar dateFromComponents:components];
    NSDate *weekdayBefore = [self.calendar vok_lastWeekdayBeforeDate:leapSunday];
    
    XCTAssertEqual(  27, [self.calendar component:NSCalendarUnitDay fromDate:weekdayBefore]);
    XCTAssertEqual(   2, [self.calendar component:NSCalendarUnitMonth fromDate:weekdayBefore]);
    XCTAssertEqual(2004, [self.calendar component:NSCalendarUnitYear fromDate:weekdayBefore]);
    
    components.month = 3;
    components.day = 1;
    NSDate *pulaskiDay = [self.calendar dateFromComponents:components];
    weekdayBefore = [self.calendar vok_lastWeekdayBeforeDate:pulaskiDay];
    
    XCTAssertEqual(  27, [self.calendar component:NSCalendarUnitDay fromDate:weekdayBefore]);
    XCTAssertEqual(   2, [self.calendar component:NSCalendarUnitMonth fromDate:weekdayBefore]);
    XCTAssertEqual(2004, [self.calendar component:NSCalendarUnitYear fromDate:weekdayBefore]);
}

@end
