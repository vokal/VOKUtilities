//
//  NSNumberFormatter+VOKAL.h
//  VOKUtilities
//
//  Created by Ellen Shapiro (Vokal) on 5/1/15.
//  Copyright (c) 2015 Vokal. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSNumberFormatter (VOKAL)

/**
 * @return A singleton instance of an NSNumberFormatter which uses the
 * autoUpdatingCurrentLocale to set the locale for currency formatting.
 */
+ (instancetype)vok_autoUpdatingCurrencyFormatter;

@end

NS_ASSUME_NONNULL_END
