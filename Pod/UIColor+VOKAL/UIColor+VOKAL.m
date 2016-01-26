//
//  UIColor+VOKAL.m
//  VOKUtilities
//
//  Created by Isaac Greenspan on 11/10/14.
//  Copyright (c) 2014 Vokal. All rights reserved.
//

#import "UIColor+VOKAL.h"

@implementation UIColor (VOKAL)

+ (instancetype)vok_colorWithHexInt:(NSUInteger)hexColor alpha:(CGFloat)alpha
{
    CGFloat red = ((CGFloat)(hexColor >> 16) / (CGFloat)0xFF);
    CGFloat green = ((CGFloat)((hexColor >> 8) & 0xFF) / (CGFloat)0xFF);
    CGFloat blue = ((CGFloat)(hexColor & 0xFF) / (CGFloat)0xFF);
    return [self colorWithRed:red green:green blue:blue alpha:alpha];
}

+ (instancetype)vok_colorWithHexInt:(NSUInteger)hexColor
{
    return [self vok_colorWithHexInt:hexColor alpha:1.0f];
}

+ (instancetype)vok_colorWithHexString:(NSString *)hexString alpha:(CGFloat)alpha
{
    // Remove any non-hexadecimal characters from the ends of the input string.
    NSCharacterSet *nonHexadecimalCharacterSet = [[NSCharacterSet characterSetWithCharactersInString:@"0123456789ABCDEFabcdef"] invertedSet];
    hexString = [hexString stringByTrimmingCharactersInSet:nonHexadecimalCharacterSet];
    
    unsigned int rgbValue = 0;
    
    NSScanner *scanner = [NSScanner scannerWithString:hexString];
    [scanner scanHexInt:&rgbValue];
    NSUInteger length = scanner.scanLocation;
    switch (length) {
        case 1:
            // If we only got a single hex digit, then it's shorthand for the equivalent with that digit repeated in all 6 places.
            return [self vok_colorWithHexInt:rgbValue * 0x111111 alpha:alpha];
            
        case 2:
            // If we got two hex digits, then it's shorthand for those same two digits used for each of the 3 color components.
            return [self vok_colorWithHexInt:rgbValue * 0x010101 alpha:alpha];
            
        case 3:
            // If we got three hex digits, then it's shorthand for using the first digit repeated twice as the red,
            // the second digit repeated twice as the green, and the third digit repeated twice as the blue.
            return [self vok_colorWithHexInt:((rgbValue >> 8) * 0x110000
                                              + ((rgbValue >> 4) & 0xF) * 0x001100
                                              + (rgbValue & 0xF) * 0x000011)
                                       alpha:alpha];
            
        default:
            // Otherwise, assume it's a full 6-digit color.
            return [self vok_colorWithHexInt:rgbValue alpha:alpha];
    }
}

+ (instancetype)vok_colorWithHexString:(NSString *)hexString
{
    return [self vok_colorWithHexString:hexString alpha:1.0f];
}

- (NSString *)vok_hexString
{
    CGFloat red;
    CGFloat green;
    CGFloat blue;
    CGFloat alpha;
    
    [self getRed:&red green:&green blue:&blue alpha:&alpha];
    
    return [NSString stringWithFormat:@"#%02X%02X%02X",
            (unsigned int)(red * 255.0), (unsigned int)(green * 255.0), (unsigned int)(blue * 255.0)];
}

@end
