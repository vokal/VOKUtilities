//
//  UIColor_VOKAL_Tests.m
//  VOKUtilitiesTests
//
//  Created by Isaac Greenspan on 11/10/2014.
//  Copyright (c) 2014 Vokal. All rights reserved.
//

#import <XCTest/XCTest.h>

#import <UIColor+VOKAL.h>

@interface UIColor_VOKAL_Tests : XCTestCase

@end

static NSString *const VokalColorString = @"#A4C53F";

@implementation UIColor_VOKAL_Tests

- (void)testColorWithHexIntWhite
{
    UIColor *white = [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0];
    XCTAssertEqualObjects([UIColor vok_colorWithHexInt:0xFFFFFF alpha:1.0], white);
    XCTAssertEqualObjects([UIColor vok_colorWithHexInt:0xFFFFFF], white);
}

- (void)testColorWithHexIntBlack
{
    UIColor *black = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:1.0];
    XCTAssertEqualObjects([UIColor vok_colorWithHexInt:0x000000 alpha:1.0], black);
    XCTAssertEqualObjects([UIColor vok_colorWithHexInt:0x000000], black);
    XCTAssertEqualObjects([UIColor vok_colorWithHexInt:0x0], black);
}

- (void)testColorWithHexIntVokalColor
{
    UIColor *vokalColor = [UIColor colorWithRed:164.0/255.0 green:197.0/255.0 blue:63.0/255.0 alpha:1.0];
    XCTAssertEqualObjects([UIColor vok_colorWithHexInt:0xA4C53F alpha:1.0], vokalColor);
    XCTAssertEqualObjects([UIColor vok_colorWithHexInt:0xA4C53F], vokalColor);
}

- (void)testColorWithHexIntAlpha
{
    UIColor *vokalColor = [UIColor colorWithRed:164.0/255.0 green:197.0/255.0 blue:63.0/255.0 alpha:1.0];
    XCTAssertEqualObjects([UIColor vok_colorWithHexInt:0xA4C53F alpha:1.00f], vokalColor);
    XCTAssertEqualObjects([UIColor vok_colorWithHexInt:0xA4C53F alpha:0.75f], [vokalColor colorWithAlphaComponent:0.75f]);
    XCTAssertEqualObjects([UIColor vok_colorWithHexInt:0xA4C53F alpha:0.50f], [vokalColor colorWithAlphaComponent:0.50f]);
    XCTAssertEqualObjects([UIColor vok_colorWithHexInt:0xA4C53F alpha:0.25f], [vokalColor colorWithAlphaComponent:0.25f]);
    XCTAssertEqualObjects([UIColor vok_colorWithHexInt:0xA4C53F alpha:0.00f], [vokalColor colorWithAlphaComponent:0.00f]);
}

- (void)testColorWithHexStringWhite
{
    UIColor *white = [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0];
    XCTAssertEqualObjects([UIColor vok_colorWithHexString:@"FFFFFF" alpha:1.0], white);
    XCTAssertEqualObjects([UIColor vok_colorWithHexString:@"FFF"], white);
    XCTAssertEqualObjects([UIColor vok_colorWithHexString:@"FF"], white);
    XCTAssertEqualObjects([UIColor vok_colorWithHexString:@"F"], white);
    XCTAssertEqualObjects([UIColor vok_colorWithHexString:@"#FFFFFF" alpha:1.0], white);
    XCTAssertEqualObjects([UIColor vok_colorWithHexString:@" #FF  "], white);
}

- (void)testColorWithHexStringBlack
{
    UIColor *black = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:1.0];
    XCTAssertEqualObjects([UIColor vok_colorWithHexString:@"000000" alpha:1.0], black);
    XCTAssertEqualObjects([UIColor vok_colorWithHexString:@"000"], black);
    XCTAssertEqualObjects([UIColor vok_colorWithHexString:@"00"], black);
    XCTAssertEqualObjects([UIColor vok_colorWithHexString:@"0"], black);
}

- (void)testColorWithHexStringVokalColor
{
    UIColor *vokalColor = [UIColor colorWithRed:164.0/255.0 green:197.0/255.0 blue:63.0/255.0 alpha:1.0];
    XCTAssertEqualObjects([UIColor vok_colorWithHexString:VokalColorString alpha:1.0], vokalColor);
}

- (void)testColorWithHexStringAlpha
{
    UIColor *vokalColor = [UIColor colorWithRed:164.0/255.0 green:197.0/255.0 blue:63.0/255.0 alpha:1.0];
    XCTAssertEqualObjects([UIColor vok_colorWithHexString:VokalColorString alpha:1.00f], vokalColor);
    XCTAssertEqualObjects([UIColor vok_colorWithHexString:VokalColorString alpha:0.75f], [vokalColor colorWithAlphaComponent:0.75f]);
    XCTAssertEqualObjects([UIColor vok_colorWithHexString:VokalColorString alpha:0.50f], [vokalColor colorWithAlphaComponent:0.50f]);
    XCTAssertEqualObjects([UIColor vok_colorWithHexString:VokalColorString alpha:0.25f], [vokalColor colorWithAlphaComponent:0.25f]);
    XCTAssertEqualObjects([UIColor vok_colorWithHexString:VokalColorString alpha:0.00f], [vokalColor colorWithAlphaComponent:0.00f]);
}

- (void)testColorWithHexStringBlueShades
{
    UIColor *blue1 = [UIColor colorWithRed:0.0/255.0 green:0.0/255.0 blue:255.0/255.0 alpha:1.0];
    XCTAssertEqualObjects([UIColor vok_colorWithHexString:@"0000FF" alpha:1.0], blue1);
    XCTAssertEqualObjects([UIColor vok_colorWithHexString:@"00F" alpha:1.0], blue1);
    UIColor *blue2 = [UIColor colorWithRed:0.0/255.0 green:0.0/255.0 blue:153.0/255.0 alpha:1.0];
    XCTAssertEqualObjects([UIColor vok_colorWithHexString:@"000099" alpha:1.0], blue2);
    XCTAssertEqualObjects([UIColor vok_colorWithHexString:@"009" alpha:1.0], blue2);
    UIColor *blue3 = [UIColor colorWithRed:0.0/255.0 green:0.0/255.0 blue:34.0/255.0 alpha:1.0];
    XCTAssertEqualObjects([UIColor vok_colorWithHexString:@"000022" alpha:1.0], blue3);
    XCTAssertEqualObjects([UIColor vok_colorWithHexString:@"002" alpha:1.0], blue3);
}

- (void)testColorWithHexStringMiscColors
{
    UIColor *color1 = [UIColor colorWithRed:34.0/255.0 green:153.0/255.0 blue:255.0/255.0 alpha:1.0];
    XCTAssertEqualObjects([UIColor vok_colorWithHexString:@"2299FF" alpha:1.0], color1);
    XCTAssertEqualObjects([UIColor vok_colorWithHexString:@"29F" alpha:1.0], color1);
    UIColor *color2 = [UIColor colorWithRed:255.0/255.0 green:34.0/255.0 blue:153.0/255.0 alpha:1.0];
    XCTAssertEqualObjects([UIColor vok_colorWithHexString:@"FF2299" alpha:1.0], color2);
    XCTAssertEqualObjects([UIColor vok_colorWithHexString:@"F29" alpha:1.0], color2);
    UIColor *color3 = [UIColor colorWithRed:153.0/255.0 green:255.0/255.0 blue:34.0/255.0 alpha:1.0];
    XCTAssertEqualObjects([UIColor vok_colorWithHexString:@"99FF22" alpha:1.0], color3);
    XCTAssertEqualObjects([UIColor vok_colorWithHexString:@"9F2" alpha:1.0], color3);
}

- (void)testColorWithHexStringMiscGrays
{
    UIColor *gray1 = [UIColor colorWithRed:234.0/255.0 green:234.0/255.0 blue:234.0/255.0 alpha:1.0];
    XCTAssertEqualObjects([UIColor vok_colorWithHexString:@"EAEAEA" alpha:1.0], gray1);
    XCTAssertEqualObjects([UIColor vok_colorWithHexString:@"EA" alpha:1.0], gray1);
    UIColor *gray2 = [UIColor colorWithRed:204.0/255.0 green:204.0/255.0 blue:204.0/255.0 alpha:1.0];
    XCTAssertEqualObjects([UIColor vok_colorWithHexString:@"CCCCCC" alpha:1.0], gray2);
    XCTAssertEqualObjects([UIColor vok_colorWithHexString:@"CCC" alpha:1.0], gray2);
    XCTAssertEqualObjects([UIColor vok_colorWithHexString:@"CC" alpha:1.0], gray2);
    XCTAssertEqualObjects([UIColor vok_colorWithHexString:@"C" alpha:1.0], gray2);
    UIColor *gray3 = [UIColor colorWithRed:102.0/255.0 green:102.0/255.0 blue:102.0/255.0 alpha:1.0];
    XCTAssertEqualObjects([UIColor vok_colorWithHexString:@"666666" alpha:1.0], gray3);
    XCTAssertEqualObjects([UIColor vok_colorWithHexString:@"666" alpha:1.0], gray3);
    XCTAssertEqualObjects([UIColor vok_colorWithHexString:@"66" alpha:1.0], gray3);
    XCTAssertEqualObjects([UIColor vok_colorWithHexString:@"6" alpha:1.0], gray3);
}

- (void)testHexString
{
    XCTAssertEqualObjects(VokalColorString, [[UIColor vok_colorWithHexString:VokalColorString] vok_hexString]);
    XCTAssertEqualObjects(@"#FFFFFF", [[UIColor vok_colorWithHexString:@"F"] vok_hexString]);
    XCTAssertEqualObjects(@"#2299FF", [[UIColor vok_colorWithHexString:@"29F"] vok_hexString]);
    XCTAssertEqualObjects(@"#CCCCCC", [[UIColor vok_colorWithHexString:@"CC"] vok_hexString]);
}

@end