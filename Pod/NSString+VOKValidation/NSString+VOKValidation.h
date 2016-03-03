//
//  NSString+VOKValidation.h
//  VOKUtilities
//
//  Created by Isaac Greenspan on 11/17/14.
//  Copyright (c) 2014 Vokal. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (VOKValidation)

/**
 *  Test if the receiver is a valid credit card number.  Strings with punctuation (e.g., hyphens) and whitespace will 
 *  not be considered valid.  Validates both overall structure and Luhn checksum.
 *
 *  @return YES if the receiver is a valid credit card number, otherwise NO
 */
- (BOOL)vok_isValidCreditCardNumber;

/**
 *  Test if the receiver is a valid credit card "CVV" code.
 *
 *  @return YES if the receiver is a 3- or 4-digit numeric string, otherwise NO
 */
- (BOOL)vok_isValidCreditCardCVV;

/**
 *  Test if the receiver matches a given regex.  Uses NSPredicate's MATCHES.
 *
 *  @param regex The regex to match
 *
 *  @return YES if the receiver matches the given regex, otherwise NO
 */
- (BOOL)vok_matchesRegexString:(NSString *)regex;

/**
 *  Test if the receiver might be a valid email address.  NOTE: You should not rely on client-side email validation.
 *  The only reliable way to test if an email address is valid is to send an email to it and validate that the email is received.
 *
 *  @return YES if the receiver might be a valid email address, NO if the receiver cannot possibly be a valid email address
 */
- (BOOL)vok_isValidEmailAddress __deprecated_msg("Email address validation should only be done by sending an email to the address");

/**
 *  Test if the receiver might be a valid email address by testing for the presence of an @.  NOTE: You should not rely
 *  on client-side email validation.  The only reliable way to test if an email address is valid is to send an email to
 *  it and validate that the email is received.
 *
 *  @return YES if the receiver might be a valid email address, NO if the receiver cannot possibly be a valid email address
 */
- (BOOL)vok_couldBeValidEmailAddress;

/**
 *  Test if the receiver is a valid email address per the W3C's recommended regex for email input.
 *  http://www.w3.org/TR/html-markup/input.email.html
 *
 *  @return YES if the receiver is a valid email address per W3C, NO if it is not.
 */
- (BOOL)vok_isValidEmailAddressPerW3C;

@end

NS_ASSUME_NONNULL_END
