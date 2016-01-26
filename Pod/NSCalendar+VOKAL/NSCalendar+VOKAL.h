//
//  NSCalendar+VOKAL.h
//  VOKUtilities
//
//  Created by Isaac Greenspan on 11/12/14.
//  Copyright (c) 2014 Vokal. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, VOKDateComponentsWeekday) {
    VOKDateComponentsWeekdaySunday = 1,
    VOKDateComponentsWeekdayMonday = 2,
    VOKDateComponentsWeekdayTuesday = 3,
    VOKDateComponentsWeekdayWednesday = 4,
    VOKDateComponentsWeekdayThursday = 5,
    VOKDateComponentsWeekdayFriday = 6,
    VOKDateComponentsWeekdaySaturday = 7,
};

@interface NSCalendar (VOKAL)

/**
 *  Create a date that is the most recent weekday before the given date.
 *
 *  @param date The given date
 *
 *  @return The most recent weekday before the given date
 */
- (NSDate *)vok_lastWeekdayBeforeDate:(NSDate *)date;

@end
