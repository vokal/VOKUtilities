//
//  UIColor+VOKAL.h
//  VOKUtilities
//
//  Created by Isaac Greenspan on 11/10/14.
//  Copyright (c) 2014 Vokal. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (VOKAL)

/**
 *  Generate a UIColor * based on a six-digit hexadecimal color and an alpha component.
 *
 *  @param hexColor The hexadecimal color (i.e., web representation), expressed as an integer (e.g., 0xA4C53F)
 *  @param alpha    The alpha component, expressed as a floating-point number between 0 (transparent) and 1 (solid)
 *
 *  @return The generated color
 */
+ (instancetype)vok_colorWithHexInt:(NSUInteger)hexColor alpha:(CGFloat)alpha;

/**
 *  Generate a UIColor * based on a six-digit hexadecimal color, with alpha 1.0 (solid).
 *
 *  @param hexColor The hexadecimal color (i.e., web representation), expressed as an integer (e.g., 0xA4C53F)
 *
 *  @return The generated color
 */
+ (instancetype)vok_colorWithHexInt:(NSUInteger)hexColor;

/**
 *  Generate a UIColor * based on a color expressed as a hexadecimal string and an alpha component.
 *
 *  @param hexString The hexadecimal color (i.e., web representation), as a string; can be full six-digit, 
 *                   three-digit shorthand for repeated digits (i.e., XYZ means XXYYZZ), or one- or two-digit
 *                   for grayscale (i.e., X means XXXXXX and XY means XYXYXY)
 *  @param alpha     The alpha component, expressed as a floating-point number between 0 (transparent) and 1 (solid)
 *
 *  @return The generated color
 */
+ (instancetype)vok_colorWithHexString:(NSString *)hexString alpha:(CGFloat)alpha;

/**
 *  Generate a UIColor * based on a color expressed as a hexadecimal string, with alpha 1.0 (solid).
 *
 *  @param hexString The hexadecimal color (i.e., web representation), as a string; can be full six-digit,
 *                   three-digit shorthand for repeated digits (i.e., XYZ means XXYYZZ), or one- or two-digit
 *                   for grayscale (i.e., X means XXXXXX and XY means XYXYXY)
 *
 *  @return The generated color
 */
+ (instancetype)vok_colorWithHexString:(NSString *)hexString;

/**
 *  @return The six-digit hexadecimal string representation of the receiver with leading # (@"#RRGGBB")
 */
- (NSString *)vok_hexString;

@end

NS_ASSUME_NONNULL_END
