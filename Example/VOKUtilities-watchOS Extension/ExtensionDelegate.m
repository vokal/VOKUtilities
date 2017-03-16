//
//  ExtensionDelegate.m
//  VOKUtilities-watchOS Extension
//
//  Created by Ellen Shapiro (Work) on 3/15/17.
//  Copyright © 2017 Vokal. All rights reserved.
//

#import "ExtensionDelegate.h"

#import <VOKUtilities/VOKKeyPathHelper.h>
#import <VOKUtilities/NSCalendar+VOKAL.h>
#import <VOKUtilities/NSString+VOKValidation.h>
#import <VOKUtilities/NSPredicate+VOKAL.h>
#import <VOKUtilities/NSNumberFormatter+VOKAL.h>
#import <VOKUtilities/UIColor+VOKAL.h>

@implementation ExtensionDelegate

- (void)applicationDidFinishLaunching {
    
    //Make sure all core libs compile and can do stuff on a watch OS app
    NSLog(@"Hex string for red: %@", [[UIColor redColor] vok_hexString]);
    
    //VOKKeyPathHelper
    VOKKeyForSelf(self);

    //NSCalendar+Vokal
    NSLog(@"Last weekday: %@", [[NSCalendar currentCalendar] vok_lastWeekdayBeforeDate:[NSDate date]]);
    
    //NSString+VOKValidation
    [@"123" vok_isValidCreditCardCVV];

    //NSPredicate+Vokal
    [NSPredicate vok_predicateWithValue:@"something" forKeyPath:@"something.else"];
    
    //NSNumberFormatter+Vokal
    [NSNumberFormatter vok_autoUpdatingCurrencyFormatter];
}

@end
