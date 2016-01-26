//
//  NSNumberFormatter+VOKAL.m
//  VOKUtilities
//
//  Created by Ellen Shapiro (Vokal) on 5/1/15.
//  Copyright (c) 2015 Vokal. All rights reserved.
//

#import "NSNumberFormatter+VOKAL.h"

@implementation NSNumberFormatter (VOKAL)

+ (instancetype)vok_autoUpdatingCurrencyFormatter;
{
    static NSNumberFormatter *CostFormatter;
    static dispatch_once_t OnceToken;
    dispatch_once(&OnceToken, ^{
        CostFormatter = [[NSNumberFormatter alloc] init];
        [CostFormatter setNumberStyle:NSNumberFormatterCurrencyStyle];
        [CostFormatter setLocale:[NSLocale autoupdatingCurrentLocale]];
    });
    
    return CostFormatter;
}

@end
