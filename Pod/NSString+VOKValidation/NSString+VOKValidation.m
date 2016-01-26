//
//  NSString+VOKValidation.m
//  VOKUtilities
//
//  Created by Isaac Greenspan on 11/17/14.
//  Copyright (c) 2014 Vokal. All rights reserved.
//

#import "NSString+VOKValidation.h"

static NSString *const CreditCardNumberRegex = @"^(?:4[0-9]{12}(?:[0-9]{3})?|5[1-5][0-9]{14}|6(?:011|5[0-9]{2})[0-9]{12}|3[47][0-9]{13}|3(?:0[0-5]|[68][0-9])[0-9]{11}|(?:2131|1800|35\\d{3})\\d{11})$";
static NSString *const CreditCardCVVRegex = @"^[0-9]{3,4}$";

//http://www.w3.org/TR/html-markup/input.email.html
static NSString *const W3CEmailRegex = @"^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\\.[a-zA-Z0-9-]+)*$";

@implementation NSString (VOKValidation)

- (BOOL)vok_isValidCreditCardNumber
{
    // Check broad format validity with a regex first.
    if (![self vok_matchesRegexString:CreditCardNumberRegex]) {
        return NO;
    }
    
    // Given that we have something that "looks" like a credit card number, apply the Luhn checksum test.
    BOOL isOdd = YES;
    NSUInteger sum = 0;
    
    for (NSInteger i = [self length] - 1; i >= 0; i--) {
        NSUInteger digit = [[self substringWithRange:NSMakeRange(i, 1)] integerValue];
        if (isOdd) {
            sum += digit;
        } else {
            sum += digit/5 + (2 * digit) % 10;
        }
        isOdd = !isOdd;
    }
    
    return (sum % 10 == 0);
}

- (BOOL)vok_isValidCreditCardCVV
{
    return [self vok_matchesRegexString:CreditCardCVVRegex];
}

- (BOOL)vok_matchesRegexString:(NSString *)regex
{
    return [[NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex] evaluateWithObject:self];
}

- (BOOL)vok_isValidEmailAddress
{
    NSAssert(NO, @"Email address validation should only be done by sending an email to the address.");
    return [self vok_couldBeValidEmailAddress];
}

- (BOOL)vok_couldBeValidEmailAddress
{
    NSRange atRange = [self rangeOfString:@"@"];
    return atRange.location != NSNotFound && atRange.location != 0;
}

- (BOOL)vok_isValidEmailAddressPerW3C
{
    if (![self vok_couldBeValidEmailAddress]) {
        //Don't even bother running the regex.
        return NO;
    }
    
    return [self vok_matchesRegexString:W3CEmailRegex];
}

@end
