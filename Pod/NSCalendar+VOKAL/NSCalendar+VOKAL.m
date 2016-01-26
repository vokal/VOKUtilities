//
//  NSCalendar+VOKAL.m
//  VOKUtilities
//
//  Created by Isaac Greenspan on 11/12/14.
//  Copyright (c) 2014 Vokal. All rights reserved.
//

#import "NSCalendar+VOKAL.h"

@implementation NSCalendar (VOKAL)

- (NSDate *)vok_lastWeekdayBeforeDate:(NSDate *)date
{
    // Get the weekday component of the given date
    NSDateComponents *weekdayComponents = [self components:NSCalendarUnitWeekday fromDate:date];
    
    NSDateComponents *deltaComponents = [[NSDateComponents alloc] init];
    
    switch (weekdayComponents.weekday) {
        case VOKDateComponentsWeekdaySunday:
            // Sunday -> Friday is 2 days back
            deltaComponents.day = -2;
            break;
            
        case VOKDateComponentsWeekdayMonday:
            // Monday -> Friday is 3 days back
            deltaComponents.day = -3;
            break;
            
        default:
            // Otherwise, 1 day back should do it.
            deltaComponents.day = -1;
            break;
    }
    
    return [self dateByAddingComponents:deltaComponents
                                 toDate:date
                                options:0];
}



@end
