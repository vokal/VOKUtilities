//
//  NSString_VOKValidation_Tests.m
//  VOKUtilities
//
//  Created by Isaac Greenspan on 11/17/14.
//  Copyright (c) 2014 Vokal. All rights reserved.
//

#import <XCTest/XCTest.h>

#import <NSString+VOKValidation.h>

@interface NSString_VOKValidation_Tests : XCTestCase

@end

@implementation NSString_VOKValidation_Tests

#pragma mark - Credit Cards

- (void)testCreditCardNumberValidationInvalid
{
    // Outright invalid.
    XCTAssertFalse([@"" vok_isValidCreditCardNumber]);
    XCTAssertFalse([@"foo" vok_isValidCreditCardNumber]);
    XCTAssertFalse([@"*%^&(*&^(&%$(%üåiø" vok_isValidCreditCardNumber]);
    XCTAssertFalse([@"111111111111111" vok_isValidCreditCardNumber]);
    XCTAssertFalse([@"1111111111111111" vok_isValidCreditCardNumber]);
    
    // "Invalid" because of punctuation/spaces (otherwise valid samples from Paypal).
    XCTAssertFalse([@"3782 822463 10005" vok_isValidCreditCardNumber]);
    XCTAssertFalse([@"3714-496353-98431" vok_isValidCreditCardNumber]);
    XCTAssertFalse([@"6011-1111-1111-1117" vok_isValidCreditCardNumber]);
    XCTAssertFalse([@"6011 0009 9013 9424" vok_isValidCreditCardNumber]);
    XCTAssertFalse([@"3530 1113 3330 0000" vok_isValidCreditCardNumber]);
    XCTAssertFalse([@"3566-0020-2036-0505" vok_isValidCreditCardNumber]);
    XCTAssertFalse([@"5555-5555 5555.4444" vok_isValidCreditCardNumber]);
    XCTAssertFalse([@"5105.1051.0510.5100" vok_isValidCreditCardNumber]);
    XCTAssertFalse([@"4111.1111.1111.1111" vok_isValidCreditCardNumber]);
    XCTAssertFalse([@"4012 8888 8888 1881" vok_isValidCreditCardNumber]);
    XCTAssertFalse([@"4222-22222-2222" vok_isValidCreditCardNumber]);
    
    // Invalid because of Luhn checksum (changed 1 digit from Paypal samples).
    XCTAssertFalse([@"378282246310004" vok_isValidCreditCardNumber]);
    XCTAssertFalse([@"371449635398421" vok_isValidCreditCardNumber]);
    XCTAssertFalse([@"378734493671100" vok_isValidCreditCardNumber]);
    XCTAssertFalse([@"30569309026904" vok_isValidCreditCardNumber]);
    XCTAssertFalse([@"38520000033237" vok_isValidCreditCardNumber]);
    XCTAssertFalse([@"6011111112111117" vok_isValidCreditCardNumber]);
    XCTAssertFalse([@"6011000980139424" vok_isValidCreditCardNumber]);
    XCTAssertFalse([@"3530111233300000" vok_isValidCreditCardNumber]);
    XCTAssertFalse([@"3566001020360505" vok_isValidCreditCardNumber]);
    XCTAssertFalse([@"5555545555554444" vok_isValidCreditCardNumber]);
    XCTAssertFalse([@"5105205105105100" vok_isValidCreditCardNumber]);
    XCTAssertFalse([@"4112111111111111" vok_isValidCreditCardNumber]);
    XCTAssertFalse([@"4022888888881881" vok_isValidCreditCardNumber]);
    XCTAssertFalse([@"4322222222222" vok_isValidCreditCardNumber]);
}

- (void)testCreditCardNumberValidationPaypalSamples
{
    // From http://www.paypalobjects.com/en_US/vhelp/paypalmanager_help/credit_card_numbers.htm with some removed
    XCTAssertTrue([@"378282246310005" vok_isValidCreditCardNumber]);
    XCTAssertTrue([@"371449635398431" vok_isValidCreditCardNumber]);
    XCTAssertTrue([@"378734493671000" vok_isValidCreditCardNumber]);
    XCTAssertTrue([@"30569309025904" vok_isValidCreditCardNumber]);
    XCTAssertTrue([@"38520000023237" vok_isValidCreditCardNumber]);
    XCTAssertTrue([@"6011111111111117" vok_isValidCreditCardNumber]);
    XCTAssertTrue([@"6011000990139424" vok_isValidCreditCardNumber]);
    XCTAssertTrue([@"3530111333300000" vok_isValidCreditCardNumber]);
    XCTAssertTrue([@"3566002020360505" vok_isValidCreditCardNumber]);
    XCTAssertTrue([@"5555555555554444" vok_isValidCreditCardNumber]);
    XCTAssertTrue([@"5105105105105100" vok_isValidCreditCardNumber]);
    XCTAssertTrue([@"4111111111111111" vok_isValidCreditCardNumber]);
    XCTAssertTrue([@"4012888888881881" vok_isValidCreditCardNumber]);
    XCTAssertTrue([@"4222222222222" vok_isValidCreditCardNumber]);
}

- (void)testCreditCardNumberValidationStripeSamples
{
    // From https://stripe.com/docs/testing
    XCTAssertTrue([@"4242424242424242" vok_isValidCreditCardNumber]);
    XCTAssertTrue([@"4012888888881881" vok_isValidCreditCardNumber]);
    XCTAssertTrue([@"4000056655665556" vok_isValidCreditCardNumber]);
    XCTAssertTrue([@"5555555555554444" vok_isValidCreditCardNumber]);
    XCTAssertTrue([@"5200828282828210" vok_isValidCreditCardNumber]);
    XCTAssertTrue([@"5105105105105100" vok_isValidCreditCardNumber]);
    XCTAssertTrue([@"378282246310005" vok_isValidCreditCardNumber]);
    XCTAssertTrue([@"371449635398431" vok_isValidCreditCardNumber]);
    XCTAssertTrue([@"6011111111111117" vok_isValidCreditCardNumber]);
    XCTAssertTrue([@"6011000990139424" vok_isValidCreditCardNumber]);
    XCTAssertTrue([@"30569309025904" vok_isValidCreditCardNumber]);
    XCTAssertTrue([@"38520000023237" vok_isValidCreditCardNumber]);
    XCTAssertTrue([@"3530111333300000" vok_isValidCreditCardNumber]);
    XCTAssertTrue([@"3566002020360505" vok_isValidCreditCardNumber]);
}

- (void)testCreditCardNumberValidationGetCreditCardNumbersDotComSamples
{
    // A batch from http://www.getcreditcardnumbers.com/ (which generates new numbers on each page load)
    XCTAssertTrue([@"4916134787520099" vok_isValidCreditCardNumber]);
    XCTAssertTrue([@"4929117871430015" vok_isValidCreditCardNumber]);
    XCTAssertTrue([@"4532562020729917" vok_isValidCreditCardNumber]);
    XCTAssertTrue([@"4485131274505170" vok_isValidCreditCardNumber]);
    XCTAssertTrue([@"4024007101613924" vok_isValidCreditCardNumber]);
    XCTAssertTrue([@"5138819116561470" vok_isValidCreditCardNumber]);
    XCTAssertTrue([@"5159972584485203" vok_isValidCreditCardNumber]);
    XCTAssertTrue([@"5306246758305444" vok_isValidCreditCardNumber]);
    XCTAssertTrue([@"5121964660718545" vok_isValidCreditCardNumber]);
    XCTAssertTrue([@"5491932041646950" vok_isValidCreditCardNumber]);
    XCTAssertTrue([@"6011103963241613" vok_isValidCreditCardNumber]);
    XCTAssertTrue([@"6011621059722774" vok_isValidCreditCardNumber]);
    XCTAssertTrue([@"6011953019726235" vok_isValidCreditCardNumber]);
    XCTAssertTrue([@"6011411005832038" vok_isValidCreditCardNumber]);
    XCTAssertTrue([@"6011372616308182" vok_isValidCreditCardNumber]);
    XCTAssertTrue([@"370997002914686" vok_isValidCreditCardNumber]);
    XCTAssertTrue([@"374687338887468" vok_isValidCreditCardNumber]);
    XCTAssertTrue([@"346495257060108" vok_isValidCreditCardNumber]);
    XCTAssertTrue([@"370365220772585" vok_isValidCreditCardNumber]);
    XCTAssertTrue([@"349310992111313" vok_isValidCreditCardNumber]);
}

- (void)testCreditCardCVVValidation
{
    XCTAssertFalse([@"" vok_isValidCreditCardCVV]);
    XCTAssertFalse([@"12" vok_isValidCreditCardCVV]);
    XCTAssertFalse([@"xxx" vok_isValidCreditCardCVV]);
    XCTAssertFalse([@"zzzz" vok_isValidCreditCardCVV]);
    XCTAssertFalse([@"12345" vok_isValidCreditCardCVV]);
    
    XCTAssertTrue([@"123" vok_isValidCreditCardCVV]);
    XCTAssertTrue([@"1234" vok_isValidCreditCardCVV]);
}

#pragma mark - Emails

- (void)testCouldBeEmailRejectsSomeInvalidEmails
{
    // Test cases and numbering from http://isemail.info/
    // Commented-out cases are invalid email addresses that are known NOT to be rejected by vok_couldBeValidEmailAddress.
    
    XCTAssertFalse([@"" vok_couldBeValidEmailAddress], @"Test case 1 returned valid.");
    XCTAssertFalse([@"test" vok_couldBeValidEmailAddress], @"Test case 2 returned valid.");
    XCTAssertFalse([@"test..iana.org" vok_couldBeValidEmailAddress], @"Test case 17 returned valid.");
    XCTAssertFalse([@"test_exa-mple.com" vok_couldBeValidEmailAddress], @"Test case 18 returned valid.");
    XCTAssertFalse([@"@" vok_couldBeValidEmailAddress], @"Test case 3 returned valid.");
    XCTAssertFalse([@"@iana.org" vok_couldBeValidEmailAddress], @"Test case 7 returned valid.");
    XCTAssertFalse([@"@io" vok_couldBeValidEmailAddress], @"Test case 6 returned valid.");
//    XCTAssertFalse([@" ␍␊ ␍␊test@iana.org" vok_couldBeValidEmailAddress], @"Test case 145 returned valid.");
//    XCTAssertFalse([@" ␍␊test@iana.org" vok_couldBeValidEmailAddress], @"Test case 143 returned valid.");
//    XCTAssertFalse([@" ␍␊␍␊ test@iana.org" vok_couldBeValidEmailAddress], @"Test case 147 returned valid.");
//    XCTAssertFalse([@" ␍␊␍␊test@iana.org" vok_couldBeValidEmailAddress], @"Test case 146 returned valid.");
//    XCTAssertFalse([@"((comment)test@iana.org" vok_couldBeValidEmailAddress], @"Test case 91 returned valid.");
//    XCTAssertFalse([@"(comment\\)test@iana.org" vok_couldBeValidEmailAddress], @"Test case 108 returned valid.");
//    XCTAssertFalse([@"(test@iana.org" vok_couldBeValidEmailAddress], @"Test case 104 returned valid.");
//    XCTAssertFalse([@"(␊)test@iana.org" vok_couldBeValidEmailAddress], @"Test case 135 returned valid.");
//    XCTAssertFalse([@"(␍)test@iana.org" vok_couldBeValidEmailAddress], @"Test case 130 returned valid.");
//    XCTAssertFalse([@".test@iana.org" vok_couldBeValidEmailAddress], @"Test case 15 returned valid.");
//    XCTAssertFalse([@"\"\"\"@iana.org" vok_couldBeValidEmailAddress], @"Test case 44 returned valid.");
//    XCTAssertFalse([@"\"\\\"@iana.org" vok_couldBeValidEmailAddress], @"Test case 47 returned valid.");
//    XCTAssertFalse([@"\"test@iana.org" vok_couldBeValidEmailAddress], @"Test case 103 returned valid.");
//    XCTAssertFalse([@"\"test@iana.org" vok_couldBeValidEmailAddress], @"Test case 50 returned valid.");
//    XCTAssertFalse([@"\"test\"\"test\"@iana.org" vok_couldBeValidEmailAddress], @"Test case 53 returned valid.");
//    XCTAssertFalse([@"\"test\"test@iana.org" vok_couldBeValidEmailAddress], @"Test case 51 returned valid.");
//    XCTAssertFalse([@"\"test\\\"@iana.org" vok_couldBeValidEmailAddress], @"Test case 107 returned valid.");
//    XCTAssertFalse([@"\"test\\©\"@iana.org" vok_couldBeValidEmailAddress], @"Test case 160 returned valid.");
//    XCTAssertFalse([@"\"test␀\"@iana.org" vok_couldBeValidEmailAddress], @"Test case 57 returned valid.");
//    XCTAssertFalse([@"\"␊\"@iana.org" vok_couldBeValidEmailAddress], @"Test case 133 returned valid.");
//    XCTAssertFalse([@"\"␍test\"@iana.org" vok_couldBeValidEmailAddress], @"Test case 129 returned valid.");
//    XCTAssertFalse([@"test(comment)test@iana.org" vok_couldBeValidEmailAddress], @"Test case 94 returned valid.");
//    XCTAssertFalse([@"test.@iana.org" vok_couldBeValidEmailAddress], @"Test case 16 returned valid.");
//    XCTAssertFalse([@"test@" vok_couldBeValidEmailAddress], @"Test case 4 returned valid.");
//    XCTAssertFalse([@"test@(iana.org" vok_couldBeValidEmailAddress], @"Test case 105 returned valid.");
//    XCTAssertFalse([@"test@-iana.org" vok_couldBeValidEmailAddress], @"Test case 30 returned valid.");
//    XCTAssertFalse([@"test@.iana.org" vok_couldBeValidEmailAddress], @"Test case 34 returned valid.");
//    XCTAssertFalse([@"test@[1.2.3.4" vok_couldBeValidEmailAddress], @"Test case 106 returned valid.");
//    XCTAssertFalse([@"test@[RFC-5322-[domain-literal]" vok_couldBeValidEmailAddress], @"Test case 114 returned valid.");
//    XCTAssertFalse([@"test@[RFC-5322-domain-literal\\" vok_couldBeValidEmailAddress], @"Test case 119 returned valid.");
//    XCTAssertFalse([@"test@[RFC-5322-domain-literal\\]" vok_couldBeValidEmailAddress], @"Test case 118 returned valid.");
//    XCTAssertFalse([@"test@[RFC-5322]-domain-literal]" vok_couldBeValidEmailAddress], @"Test case 113 returned valid.");
//    XCTAssertFalse([@"test@a[255.255.255.255]" vok_couldBeValidEmailAddress], @"Test case 62 returned valid.");
//    XCTAssertFalse([@"test@iana-.com" vok_couldBeValidEmailAddress], @"Test case 31 returned valid.");
//    XCTAssertFalse([@"test@iana..com" vok_couldBeValidEmailAddress], @"Test case 36 returned valid.");
//    XCTAssertFalse([@"test@iana.org ␍␊ ␍␊" vok_couldBeValidEmailAddress], @"Test case 154 returned valid.");
//    XCTAssertFalse([@"test@iana.org ␍␊" vok_couldBeValidEmailAddress], @"Test case 152 returned valid.");
//    XCTAssertFalse([@"test@iana.org ␍␊␍␊ " vok_couldBeValidEmailAddress], @"Test case 156 returned valid.");
//    XCTAssertFalse([@"test@iana.org ␍␊␍␊" vok_couldBeValidEmailAddress], @"Test case 155 returned valid.");
//    XCTAssertFalse([@"test@iana.org(comment\\" vok_couldBeValidEmailAddress], @"Test case 110 returned valid.");
//    XCTAssertFalse([@"test@iana.org(comment\\)" vok_couldBeValidEmailAddress], @"Test case 109 returned valid.");
//    XCTAssertFalse([@"test@iana.org(␍)" vok_couldBeValidEmailAddress], @"Test case 131 returned valid.");
//    XCTAssertFalse([@"test@iana.org-" vok_couldBeValidEmailAddress], @"Test case 102 returned valid.");
//    XCTAssertFalse([@"test@iana.org." vok_couldBeValidEmailAddress], @"Test case 35 returned valid.");
//    XCTAssertFalse([@"test@iana.org␊" vok_couldBeValidEmailAddress], @"Test case 99 returned valid.");
//    XCTAssertFalse([@"test@iana.org␍" vok_couldBeValidEmailAddress], @"Test case 127 returned valid.");
//    XCTAssertFalse([@"test@iana.org␍␊ ␍␊" vok_couldBeValidEmailAddress], @"Test case 151 returned valid.");
//    XCTAssertFalse([@"test@iana.org␍␊" vok_couldBeValidEmailAddress], @"Test case 150 returned valid.");
//    XCTAssertFalse([@"test@.org" vok_couldBeValidEmailAddress], @"Test case 123 returned valid.");
//    XCTAssertFalse([@"test@␇.org" vok_couldBeValidEmailAddress], @"Test case 137 returned valid.");
//    XCTAssertFalse([@"test\"@iana.org" vok_couldBeValidEmailAddress], @"Test case 49 returned valid.");
//    XCTAssertFalse([@"test\"text\"@iana.org" vok_couldBeValidEmailAddress], @"Test case 52 returned valid.");
//    XCTAssertFalse([@"test\\@test@iana.org" vok_couldBeValidEmailAddress], @"Test case 20 returned valid.");
//    XCTAssertFalse([@"@iana.org" vok_couldBeValidEmailAddress], @"Test case 122 returned valid.");
//    XCTAssertFalse([@"␇@iana.org" vok_couldBeValidEmailAddress], @"Test case 136 returned valid.");
//    XCTAssertFalse([@"␊test@iana.org" vok_couldBeValidEmailAddress], @"Test case 132 returned valid.");
//    XCTAssertFalse([@"␍test@iana.org" vok_couldBeValidEmailAddress], @"Test case 128 returned valid.");
//    XCTAssertFalse([@"␍␊ ␍␊test@iana.org" vok_couldBeValidEmailAddress], @"Test case 142 returned valid.");
//    XCTAssertFalse([@"␍␊test@iana.org" vok_couldBeValidEmailAddress], @"Test case 141 returned valid.");
}

- (void)testCouldBeEmailDoesntRejectValidEmails
{
    // Test cases and numbering from http://isemail.info/
    
    XCTAssertTrue([@" test @iana.org" vok_couldBeValidEmailAddress], @"Test case 85 returned invalid (ISEMAIL_DEPREC).");
    XCTAssertTrue([@" test@iana.org" vok_couldBeValidEmailAddress], @"Test case 157 returned invalid (ISEMAIL_CFWS).");
    XCTAssertTrue([@" ␍␊ test@iana.org" vok_couldBeValidEmailAddress], @"Test case 144 returned invalid (ISEMAIL_CFWS).");
    XCTAssertTrue([@"!#$%&`*+/=?^`{|}~@iana.org" vok_couldBeValidEmailAddress], @"Test case 19 returned invalid (ISEMAIL_VALID_CATEGORY).");
    XCTAssertTrue([@"(comment(comment))test@iana.org" vok_couldBeValidEmailAddress], @"Test case 92 returned invalid (ISEMAIL_CFWS).");
    XCTAssertTrue([@"(comment)abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghiklm@iana.org" vok_couldBeValidEmailAddress], @"Test case 96 returned invalid (ISEMAIL_CFWS).");
    XCTAssertTrue([@"(comment)test@abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghik.abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghik.abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijk.abcdefghijklmnopqrstuvwxyzabcdefghijk.abcdefghijklmnopqrstu" vok_couldBeValidEmailAddress], @"Test case 98 returned invalid (ISEMAIL_CFWS).");
    XCTAssertTrue([@"(comment)test@iana.org" vok_couldBeValidEmailAddress], @"Test case 90 returned invalid (ISEMAIL_CFWS).");
    XCTAssertTrue([@"()test@iana.org" vok_couldBeValidEmailAddress], @"Test case 126 returned invalid (ISEMAIL_DEPREC).");
    XCTAssertTrue([@"(␇)test@iana.org" vok_couldBeValidEmailAddress], @"Test case 140 returned invalid (ISEMAIL_DEPREC).");
    XCTAssertTrue([@"123@iana.org" vok_couldBeValidEmailAddress], @"Test case 21 returned invalid (ISEMAIL_VALID_CATEGORY).");
    XCTAssertTrue([@"\"\"@iana.org" vok_couldBeValidEmailAddress], @"Test case 43 returned invalid (ISEMAIL_RFC5321).");
    XCTAssertTrue([@"\"\\\"\"@iana.org" vok_couldBeValidEmailAddress], @"Test case 46 returned invalid (ISEMAIL_RFC5321).");
    XCTAssertTrue([@"\"\\\\\"@iana.org" vok_couldBeValidEmailAddress], @"Test case 48 returned invalid (ISEMAIL_RFC5321).");
    XCTAssertTrue([@"\"\\a\"@iana.org" vok_couldBeValidEmailAddress], @"Test case 45 returned invalid (ISEMAIL_RFC5321).");
    XCTAssertTrue([@"\"\\\"@iana.org" vok_couldBeValidEmailAddress], @"Test case 125 returned invalid (ISEMAIL_DEPREC).");
    XCTAssertTrue([@"\"\\␇\"@iana.org" vok_couldBeValidEmailAddress], @"Test case 139 returned invalid (ISEMAIL_DEPREC).");
    XCTAssertTrue([@"\"\\␊\"@iana.org" vok_couldBeValidEmailAddress], @"Test case 134 returned invalid (ISEMAIL_DEPREC).");
    XCTAssertTrue([@"\"abcdefghijklmnopqrstuvwxyz abcdefghijklmnopqrstuvwxyz abcdefg\\h\"@iana.org" vok_couldBeValidEmailAddress], @"Test case 60 returned invalid (ISEMAIL_RFC5322).");
    XCTAssertTrue([@"\"abcdefghijklmnopqrstuvwxyz abcdefghijklmnopqrstuvwxyz abcdefghj\"@iana.org" vok_couldBeValidEmailAddress], @"Test case 59 returned invalid (ISEMAIL_RFC5322).");
    XCTAssertTrue([@"\"test\".\"test\"@iana.org" vok_couldBeValidEmailAddress], @"Test case 54 returned invalid (ISEMAIL_DEPREC).");
    XCTAssertTrue([@"\"test\".test@iana.org" vok_couldBeValidEmailAddress], @"Test case 56 returned invalid (ISEMAIL_DEPREC).");
    XCTAssertTrue([@"\"test\"@iana.org" vok_couldBeValidEmailAddress], @"Test case 42 returned invalid (ISEMAIL_RFC5321).");
    XCTAssertTrue([@"\"test\\ test\"@iana.org" vok_couldBeValidEmailAddress], @"Test case 55 returned invalid (ISEMAIL_RFC5321).");
    XCTAssertTrue([@"\"test\\␀\"@iana.org" vok_couldBeValidEmailAddress], @"Test case 58 returned invalid (ISEMAIL_DEPREC).");
    XCTAssertTrue([@"\"\"@iana.org" vok_couldBeValidEmailAddress], @"Test case 124 returned invalid (ISEMAIL_DEPREC).");
    XCTAssertTrue([@"\"␇\"@iana.org" vok_couldBeValidEmailAddress], @"Test case 138 returned invalid (ISEMAIL_DEPREC).");
    XCTAssertTrue([@"a@a.b.c.d.e.f.g.h.i.j.k.l.m.n.o.p.q.r.s.t.u.v.w.x.y.z.a.b.c.d.e.f.g.h.i.j.k.l.m.n.o.p.q.r.s.t.u.v.w.x.y.z.a.b.c.d.e.f.g.h.i.j.k.l.m.n.o.p.q.r.s.t.u.v.w.x.y.z.a.b.c.d.e.f.g.h.i.j.k.l.m.n.o.p.q.r.s.t.u.v.w.x.y.z.a.b.c.d.e.f.g.h.i.j.k.l.m.n.o.p.q.r.s.t.u.v" vok_couldBeValidEmailAddress], @"Test case 37 returned invalid (ISEMAIL_DNSWARN).");
    XCTAssertTrue([@"a@abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghikl.abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghikl.abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghikl.abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefg.hij" vok_couldBeValidEmailAddress], @"Test case 40 returned invalid (ISEMAIL_RFC5322).");
    XCTAssertTrue([@"a@abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghikl.abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghikl.abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghikl.abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefg.hijk" vok_couldBeValidEmailAddress], @"Test case 41 returned invalid (ISEMAIL_RFC5322).");
    XCTAssertTrue([@"a@iana.org" vok_couldBeValidEmailAddress], @"Test case 11 returned invalid (ISEMAIL_VALID_CATEGORY).");
    XCTAssertTrue([@"abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghiklm@abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghikl.abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghikl.abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghi" vok_couldBeValidEmailAddress], @"Test case 38 returned invalid (ISEMAIL_DNSWARN).");
    XCTAssertTrue([@"abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghiklm@abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghikl.abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghikl.abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghij" vok_couldBeValidEmailAddress], @"Test case 39 returned invalid (ISEMAIL_RFC5322).");
    XCTAssertTrue([@"abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghiklm@iana.org" vok_couldBeValidEmailAddress], @"Test case 25 returned invalid (ISEMAIL_VALID_CATEGORY).");
    XCTAssertTrue([@"abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghiklmn@iana.org" vok_couldBeValidEmailAddress], @"Test case 26 returned invalid (ISEMAIL_RFC5322).");
    XCTAssertTrue([@"test . test@iana.org" vok_couldBeValidEmailAddress], @"Test case 87 returned invalid (ISEMAIL_DEPREC).");
    XCTAssertTrue([@"test.(comment)test@iana.org" vok_couldBeValidEmailAddress], @"Test case 165 returned invalid (ISEMAIL_DEPREC).");
    XCTAssertTrue([@"test.test@iana.org" vok_couldBeValidEmailAddress], @"Test case 14 returned invalid (ISEMAIL_VALID_CATEGORY).");
    XCTAssertTrue([@"test@ iana .com" vok_couldBeValidEmailAddress], @"Test case 86 returned invalid (ISEMAIL_DEPREC).");
    XCTAssertTrue([@"test@(comment)[255.255.255.255]" vok_couldBeValidEmailAddress], @"Test case 95 returned invalid (ISEMAIL_DEPREC).");
    XCTAssertTrue([@"test@(comment)abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghikl.com" vok_couldBeValidEmailAddress], @"Test case 97 returned invalid (ISEMAIL_DEPREC).");
    XCTAssertTrue([@"test@(comment)iana.org" vok_couldBeValidEmailAddress], @"Test case 93 returned invalid (ISEMAIL_DEPREC).");
    XCTAssertTrue([@"test@123.com" vok_couldBeValidEmailAddress], @"Test case 22 returned invalid (ISEMAIL_VALID_CATEGORY).");
    XCTAssertTrue([@"test@255.255.255.255" vok_couldBeValidEmailAddress], @"Test case 24 returned invalid (ISEMAIL_RFC5321).");
    XCTAssertTrue([@"test@[1111:2222:3333:4444:5555:6666:7777:8888]" vok_couldBeValidEmailAddress], @"Test case 66 returned invalid (ISEMAIL_RFC5322).");
    XCTAssertTrue([@"test@[255.255.255.255.255]" vok_couldBeValidEmailAddress], @"Test case 64 returned invalid (ISEMAIL_RFC5322).");
    XCTAssertTrue([@"test@[255.255.255.255]" vok_couldBeValidEmailAddress], @"Test case 61 returned invalid (ISEMAIL_RFC5321).");
    XCTAssertTrue([@"test@[255.255.255.256]" vok_couldBeValidEmailAddress], @"Test case 65 returned invalid (ISEMAIL_RFC5322).");
    XCTAssertTrue([@"test@[255.255.255]" vok_couldBeValidEmailAddress], @"Test case 63 returned invalid (ISEMAIL_RFC5322).");
    XCTAssertTrue([@"test@[IPv6:1111:2222:3333:4444:5555:255.255.255.255]" vok_couldBeValidEmailAddress], @"Test case 78 returned invalid (ISEMAIL_RFC5322).");
    XCTAssertTrue([@"test@[IPv6:1111:2222:3333:4444:5555:6666:255.255.255.255]" vok_couldBeValidEmailAddress], @"Test case 79 returned invalid (ISEMAIL_RFC5321).");
    XCTAssertTrue([@"test@[IPv6:1111:2222:3333:4444:5555:6666:7777:255.255.255.255]" vok_couldBeValidEmailAddress], @"Test case 80 returned invalid (ISEMAIL_RFC5322).");
    XCTAssertTrue([@"test@[IPv6:1111:2222:3333:4444:5555:6666:7777:8888:9999]" vok_couldBeValidEmailAddress], @"Test case 69 returned invalid (ISEMAIL_RFC5322).");
    XCTAssertTrue([@"test@[IPv6:1111:2222:3333:4444:5555:6666:7777:8888]" vok_couldBeValidEmailAddress], @"Test case 68 returned invalid (ISEMAIL_RFC5321).");
    XCTAssertTrue([@"test@[IPv6:1111:2222:3333:4444:5555:6666:7777:888G]" vok_couldBeValidEmailAddress], @"Test case 70 returned invalid (ISEMAIL_RFC5322).");
    XCTAssertTrue([@"test@[IPv6:1111:2222:3333:4444:5555:6666:7777]" vok_couldBeValidEmailAddress], @"Test case 67 returned invalid (ISEMAIL_RFC5322).");
    XCTAssertTrue([@"test@[IPv6:1111:2222:3333:4444:5555:6666::255.255.255.255]" vok_couldBeValidEmailAddress], @"Test case 82 returned invalid (ISEMAIL_RFC5322).");
    XCTAssertTrue([@"test@[IPv6:1111:2222:3333:4444:5555:6666::7777:8888]" vok_couldBeValidEmailAddress], @"Test case 73 returned invalid (ISEMAIL_RFC5322).");
    XCTAssertTrue([@"test@[IPv6:1111:2222:3333:4444:5555:6666::8888]" vok_couldBeValidEmailAddress], @"Test case 71 returned invalid (ISEMAIL_DEPREC).");
    XCTAssertTrue([@"test@[IPv6:1111:2222:3333:4444:5555::8888]" vok_couldBeValidEmailAddress], @"Test case 72 returned invalid (ISEMAIL_RFC5321).");
    XCTAssertTrue([@"test@[IPv6:1111:2222:3333:4444::255.255.255.255]" vok_couldBeValidEmailAddress], @"Test case 81 returned invalid (ISEMAIL_RFC5321).");
    XCTAssertTrue([@"test@[IPv6:1111:2222:3333:4444:::255.255.255.255]" vok_couldBeValidEmailAddress], @"Test case 83 returned invalid (ISEMAIL_RFC5322).");
    XCTAssertTrue([@"test@[IPv6:1111::4444:5555::8888]" vok_couldBeValidEmailAddress], @"Test case 76 returned invalid (ISEMAIL_RFC5322).");
    XCTAssertTrue([@"test@[IPv6:1::2:]" vok_couldBeValidEmailAddress], @"Test case 159 returned invalid (ISEMAIL_RFC5322).");
    XCTAssertTrue([@"test@[IPv6::255.255.255.255]" vok_couldBeValidEmailAddress], @"Test case 84 returned invalid (ISEMAIL_RFC5322).");
    XCTAssertTrue([@"test@[IPv6::3333:4444:5555:6666:7777:8888]" vok_couldBeValidEmailAddress], @"Test case 74 returned invalid (ISEMAIL_RFC5322).");
    XCTAssertTrue([@"test@[IPv6:::3333:4444:5555:6666:7777:8888]" vok_couldBeValidEmailAddress], @"Test case 75 returned invalid (ISEMAIL_RFC5321).");
    XCTAssertTrue([@"test@[IPv6:::]" vok_couldBeValidEmailAddress], @"Test case 77 returned invalid (ISEMAIL_RFC5321).");
    XCTAssertTrue([@"test@[RFC 5322 domain literal]" vok_couldBeValidEmailAddress], @"Test case 120 returned invalid (ISEMAIL_RFC5322).");
    XCTAssertTrue([@"test@[RFC-5322-\\]-domain-literal]" vok_couldBeValidEmailAddress], @"Test case 117 returned invalid (ISEMAIL_RFC5322).");
    XCTAssertTrue([@"test@[RFC-5322-\\␇-domain-literal]" vok_couldBeValidEmailAddress], @"Test case 115 returned invalid (ISEMAIL_RFC5322).");
    XCTAssertTrue([@"test@[RFC-5322-\\␉-domain-literal]" vok_couldBeValidEmailAddress], @"Test case 116 returned invalid (ISEMAIL_RFC5322).");
    XCTAssertTrue([@"test@[RFC-5322-domain-literal] (comment)" vok_couldBeValidEmailAddress], @"Test case 121 returned invalid (ISEMAIL_RFC5322).");
    XCTAssertTrue([@"test@[RFC-5322-domain-literal]" vok_couldBeValidEmailAddress], @"Test case 112 returned invalid (ISEMAIL_RFC5322).");
    XCTAssertTrue([@"test@abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghikl.com" vok_couldBeValidEmailAddress], @"Test case 27 returned invalid (ISEMAIL_DNSWARN).");
    XCTAssertTrue([@"test@abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghiklm.com" vok_couldBeValidEmailAddress], @"Test case 28 returned invalid (ISEMAIL_RFC5322).");
    XCTAssertTrue([@"test@about.museum" vok_couldBeValidEmailAddress], @"Test case 10 returned invalid (ISEMAIL_VALID_CATEGORY).");
    XCTAssertTrue([@"test@c--n.com" vok_couldBeValidEmailAddress], @"Test case 32 returned invalid (ISEMAIL_VALID_CATEGORY).");
    XCTAssertTrue([@"test@e.com" vok_couldBeValidEmailAddress], @"Test case 12 returned invalid (ISEMAIL_DNSWARN).");
    XCTAssertTrue([@"test@iana.123" vok_couldBeValidEmailAddress], @"Test case 23 returned invalid (ISEMAIL_RFC5321).");
    XCTAssertTrue([@"test@iana.a" vok_couldBeValidEmailAddress], @"Test case 13 returned invalid (ISEMAIL_DNSWARN).");
    XCTAssertTrue([@"test@iana.co-uk" vok_couldBeValidEmailAddress], @"Test case 33 returned invalid (ISEMAIL_DNSWARN).");
    XCTAssertTrue([@"test@iana.org " vok_couldBeValidEmailAddress], @"Test case 158 returned invalid (ISEMAIL_CFWS).");
    XCTAssertTrue([@"test@iana.org ␍␊ " vok_couldBeValidEmailAddress], @"Test case 153 returned invalid (ISEMAIL_CFWS).");
    XCTAssertTrue([@"test@iana.org" vok_couldBeValidEmailAddress], @"Test case 8 returned invalid (ISEMAIL_VALID_CATEGORY).");
    XCTAssertTrue([@"test@iana.org␍␊ " vok_couldBeValidEmailAddress], @"Test case 148 returned invalid (ISEMAIL_CFWS).");
    XCTAssertTrue([@"test@iana.org␍␊ ␍␊ " vok_couldBeValidEmailAddress], @"Test case 149 returned invalid (ISEMAIL_DEPREC).");
    XCTAssertTrue([@"test@iana/icann.org" vok_couldBeValidEmailAddress], @"Test case 161 returned invalid (ISEMAIL_RFC5322).");
    XCTAssertTrue([@"test@io" vok_couldBeValidEmailAddress], @"Test case 5 returned invalid (ISEMAIL_VALID_CATEGORY).");
    XCTAssertTrue([@"test@mason-dixon.com" vok_couldBeValidEmailAddress], @"Test case 29 returned invalid (ISEMAIL_VALID_CATEGORY).");
    XCTAssertTrue([@"test@nic.no" vok_couldBeValidEmailAddress], @"Test case 168 returned invalid (ISEMAIL_DNSWARN).");
    XCTAssertTrue([@"test@nominet.org.uk" vok_couldBeValidEmailAddress], @"Test case 9 returned invalid (ISEMAIL_VALID_CATEGORY).");
    XCTAssertTrue([@"test@org" vok_couldBeValidEmailAddress], @"Test case 166 returned invalid (ISEMAIL_RFC5321).");
    XCTAssertTrue([@"test@test.com" vok_couldBeValidEmailAddress], @"Test case 167 returned invalid (ISEMAIL_DNSWARN).");
    XCTAssertTrue([@"test@xn--hxajbheg2az3al.xn--jxalpdlp" vok_couldBeValidEmailAddress], @"Test case 100 returned invalid (ISEMAIL_VALID_CATEGORY).");
    XCTAssertTrue([@"xn--test@iana.org" vok_couldBeValidEmailAddress], @"Test case 101 returned invalid (ISEMAIL_VALID_CATEGORY).");
    XCTAssertTrue([@"␍␊ test@iana.org" vok_couldBeValidEmailAddress], @"Test case 88 returned invalid (ISEMAIL_CFWS).");
    XCTAssertTrue([@"␍␊ ␍␊ test@iana.org" vok_couldBeValidEmailAddress], @"Test case 89 returned invalid (ISEMAIL_DEPREC).");
}

#pragma mark - W3C

- (void)testW3CEmailValidation
{
    
#pragma mark - Passing isemail.info cases
    
    XCTAssertTrue([@"!#$%&`*+/=?^`{|}~@iana.org" vok_isValidEmailAddressPerW3C], @"Test case 19 returned invalid (ISEMAIL_VALID_CATEGORY).");
    XCTAssertTrue([@"a@a.b.c.d.e.f.g.h.i.j.k.l.m.n.o.p.q.r.s.t.u.v.w.x.y.z.a.b.c.d.e.f.g.h.i.j.k.l.m.n.o.p.q.r.s.t.u.v.w.x.y.z.a.b.c.d.e.f.g.h.i.j.k.l.m.n.o.p.q.r.s.t.u.v.w.x.y.z.a.b.c.d.e.f.g.h.i.j.k.l.m.n.o.p.q.r.s.t.u.v.w.x.y.z.a.b.c.d.e.f.g.h.i.j.k.l.m.n.o.p.q.r.s.t.u.v" vok_isValidEmailAddressPerW3C], @"Test case 37 returned invalid (ISEMAIL_DNSWARN).");
    XCTAssertTrue([@"a@abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghikl.abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghikl.abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghikl.abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefg.hij" vok_isValidEmailAddressPerW3C], @"Test case 40 returned invalid (ISEMAIL_RFC5322).");
    XCTAssertTrue([@"a@abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghikl.abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghikl.abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghikl.abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefg.hijk" vok_isValidEmailAddressPerW3C], @"Test case 41 returned invalid (ISEMAIL_RFC5322).");
    XCTAssertTrue([@"a@iana.org" vok_isValidEmailAddressPerW3C], @"Test case 11 returned invalid (ISEMAIL_VALID_CATEGORY).");
    XCTAssertTrue([@"abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghiklm@abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghikl.abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghikl.abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghi" vok_isValidEmailAddressPerW3C], @"Test case 38 returned invalid (ISEMAIL_DNSWARN).");
    XCTAssertTrue([@"abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghiklm@abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghikl.abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghikl.abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghij" vok_isValidEmailAddressPerW3C], @"Test case 39 returned invalid (ISEMAIL_RFC5322).");
    XCTAssertTrue([@"abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghiklm@iana.org" vok_isValidEmailAddressPerW3C], @"Test case 25 returned invalid (ISEMAIL_VALID_CATEGORY).");
    XCTAssertTrue([@"abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghiklmn@iana.org" vok_isValidEmailAddressPerW3C], @"Test case 26 returned invalid (ISEMAIL_RFC5322).");
    XCTAssertTrue([@"test.test@iana.org" vok_isValidEmailAddressPerW3C], @"Test case 14 returned invalid (ISEMAIL_VALID_CATEGORY).");
    XCTAssertTrue([@"test@123.com" vok_isValidEmailAddressPerW3C], @"Test case 22 returned invalid (ISEMAIL_VALID_CATEGORY).");
    XCTAssertTrue([@"test@255.255.255.255" vok_isValidEmailAddressPerW3C], @"Test case 24 returned invalid (ISEMAIL_RFC5321).");
    XCTAssertTrue([@"test@abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghikl.com" vok_isValidEmailAddressPerW3C], @"Test case 27 returned invalid (ISEMAIL_DNSWARN).");
    XCTAssertTrue([@"test@abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghiklm.com" vok_isValidEmailAddressPerW3C], @"Test case 28 returned invalid (ISEMAIL_RFC5322).");
    XCTAssertTrue([@"test@about.museum" vok_isValidEmailAddressPerW3C], @"Test case 10 returned invalid (ISEMAIL_VALID_CATEGORY).");
    XCTAssertTrue([@"test@c--n.com" vok_isValidEmailAddressPerW3C], @"Test case 32 returned invalid (ISEMAIL_VALID_CATEGORY).");
    XCTAssertTrue([@"test@e.com" vok_isValidEmailAddressPerW3C], @"Test case 12 returned invalid (ISEMAIL_DNSWARN).");
    XCTAssertTrue([@"test@iana.123" vok_isValidEmailAddressPerW3C], @"Test case 23 returned invalid (ISEMAIL_RFC5321).");
    XCTAssertTrue([@"test@iana.a" vok_isValidEmailAddressPerW3C], @"Test case 13 returned invalid (ISEMAIL_DNSWARN).");
    XCTAssertTrue([@"test@iana.co-uk" vok_isValidEmailAddressPerW3C], @"Test case 33 returned invalid (ISEMAIL_DNSWARN).");
    XCTAssertTrue([@"test@iana.org" vok_isValidEmailAddressPerW3C], @"Test case 8 returned invalid (ISEMAIL_VALID_CATEGORY).");
    XCTAssertTrue([@"test@io" vok_isValidEmailAddressPerW3C], @"Test case 5 returned invalid (ISEMAIL_VALID_CATEGORY).");
    XCTAssertTrue([@"test@mason-dixon.com" vok_isValidEmailAddressPerW3C], @"Test case 29 returned invalid (ISEMAIL_VALID_CATEGORY).");
    XCTAssertTrue([@"test@nic.no" vok_isValidEmailAddressPerW3C], @"Test case 168 returned invalid (ISEMAIL_DNSWARN).");
    XCTAssertTrue([@"test@nominet.org.uk" vok_isValidEmailAddressPerW3C], @"Test case 9 returned invalid (ISEMAIL_VALID_CATEGORY).");
    XCTAssertTrue([@"test@org" vok_isValidEmailAddressPerW3C], @"Test case 166 returned invalid (ISEMAIL_RFC5321).");
    XCTAssertTrue([@"test@test.com" vok_isValidEmailAddressPerW3C], @"Test case 167 returned invalid (ISEMAIL_DNSWARN).");
    XCTAssertTrue([@"test@xn--hxajbheg2az3al.xn--jxalpdlp" vok_isValidEmailAddressPerW3C], @"Test case 100 returned invalid (ISEMAIL_VALID_CATEGORY).");
    XCTAssertTrue([@"xn--test@iana.org" vok_isValidEmailAddressPerW3C], @"Test case 101 returned invalid (ISEMAIL_VALID_CATEGORY).");
    XCTAssertTrue([@"123@iana.org" vok_isValidEmailAddressPerW3C], @"Test case 21 returned invalid (ISEMAIL_VALID_CATEGORY).");
    
#pragma mark - Tests that fail on the W3C Regex which pass with vok_couldBeValidEmailAddress
    
#pragma mark Emails which were valid under various non-specific deprecated standards per isemail.info, but are now invalid.
    
    XCTAssertFalse([@"␍␊ ␍␊ test@iana.org" vok_isValidEmailAddressPerW3C], @"Test case 89 returned valid (ISEMAIL_DEPREC).");
    XCTAssertFalse([@"test@iana.org␍␊ ␍␊ " vok_isValidEmailAddressPerW3C], @"Test case 149 returned valid (ISEMAIL_DEPREC).");
    XCTAssertFalse([@"test@[IPv6:1111:2222:3333:4444:5555:6666::8888]" vok_isValidEmailAddressPerW3C], @"Test case 71 returned valid (ISEMAIL_DEPREC).");
    XCTAssertFalse([@"test@ iana .com" vok_isValidEmailAddressPerW3C], @"Test case 86 returned valid (ISEMAIL_DEPREC).");
    XCTAssertFalse([@"test@(comment)[255.255.255.255]" vok_isValidEmailAddressPerW3C], @"Test case 95 returned valid (ISEMAIL_DEPREC).");
    XCTAssertFalse([@"test@(comment)abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghikl.com" vok_isValidEmailAddressPerW3C], @"Test case 97 returned valid (ISEMAIL_DEPREC).");
    XCTAssertFalse([@"test@(comment)iana.org" vok_isValidEmailAddressPerW3C], @"Test case 93 returned valid (ISEMAIL_DEPREC).");
    XCTAssertFalse([@"test . test@iana.org" vok_isValidEmailAddressPerW3C], @"Test case 87 returned valid (ISEMAIL_DEPREC).");
    XCTAssertFalse([@"test.(comment)test@iana.org" vok_isValidEmailAddressPerW3C], @"Test case 165 returned valid (ISEMAIL_DEPREC).");
    XCTAssertFalse([@"\"\\\"@iana.org" vok_isValidEmailAddressPerW3C], @"Test case 125 returned valid (ISEMAIL_DEPREC).");
    XCTAssertFalse([@"\"\\␇\"@iana.org" vok_isValidEmailAddressPerW3C], @"Test case 139 returned valid (ISEMAIL_DEPREC).");
    XCTAssertFalse([@"\"\\␊\"@iana.org" vok_isValidEmailAddressPerW3C], @"Test case 134 returned valid (ISEMAIL_DEPREC).");
    XCTAssertFalse([@"\"test\\␀\"@iana.org" vok_isValidEmailAddressPerW3C], @"Test case 58 returned valid (ISEMAIL_DEPREC).");
    XCTAssertFalse([@"\"\"@iana.org" vok_isValidEmailAddressPerW3C], @"Test case 124 returned valid (ISEMAIL_DEPREC).");
    XCTAssertFalse([@"\"␇\"@iana.org" vok_isValidEmailAddressPerW3C], @"Test case 138 returned valid (ISEMAIL_DEPREC).");
    XCTAssertFalse([@" test @iana.org" vok_isValidEmailAddressPerW3C], @"Test case 85 returned valid (ISEMAIL_DEPREC).");
    XCTAssertFalse([@"\"test\".\"test\"@iana.org" vok_isValidEmailAddressPerW3C], @"Test case 54 returned valid (ISEMAIL_DEPREC).");
    XCTAssertFalse([@"\"test\".test@iana.org" vok_isValidEmailAddressPerW3C], @"Test case 56 returned valid (ISEMAIL_DEPREC).");
    XCTAssertFalse([@"()test@iana.org" vok_isValidEmailAddressPerW3C], @"Test case 126 returned valid (ISEMAIL_DEPREC).");
    XCTAssertFalse([@"(␇)test@iana.org" vok_isValidEmailAddressPerW3C], @"Test case 140 returned valid (ISEMAIL_DEPREC).");
    
#pragma mark Emails with Comment Folding White Space
    
    XCTAssertFalse([@"␍␊ test@iana.org" vok_isValidEmailAddressPerW3C], @"Test case 88 returned valid (ISEMAIL_CFWS).");
    XCTAssertFalse([@"test@iana.org␍␊ " vok_isValidEmailAddressPerW3C], @"Test case 148 returned valid (ISEMAIL_CFWS).");
    XCTAssertFalse([@"test@iana.org " vok_isValidEmailAddressPerW3C], @"Test case 158 returned valid (ISEMAIL_CFWS).");
    XCTAssertFalse([@"test@iana.org ␍␊ " vok_isValidEmailAddressPerW3C], @"Test case 153 returned valid (ISEMAIL_CFWS).");
    XCTAssertFalse([@"(comment)test@abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghik.abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghik.abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijk.abcdefghijklmnopqrstuvwxyzabcdefghijk.abcdefghijklmnopqrstu" vok_isValidEmailAddressPerW3C], @"Test case 98 returned valid (ISEMAIL_CFWS).");
    XCTAssertFalse([@" test@iana.org" vok_isValidEmailAddressPerW3C], @"Test case 157 returned valid (ISEMAIL_CFWS).");
    XCTAssertFalse([@" ␍␊ test@iana.org" vok_isValidEmailAddressPerW3C], @"Test case 144 returned valid (ISEMAIL_CFWS).");
    XCTAssertFalse([@"(comment(comment))test@iana.org" vok_isValidEmailAddressPerW3C], @"Test case 92 returned valid (ISEMAIL_CFWS).");
    XCTAssertFalse([@"(comment)test@iana.org" vok_isValidEmailAddressPerW3C], @"Test case 90 returned valid (ISEMAIL_CFWS).");
    XCTAssertFalse([@"(comment)abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghiklm@iana.org" vok_isValidEmailAddressPerW3C], @"Test case 96 returned valid (ISEMAIL_CFWS).");
    
#pragma mark Emails valid under RFC-5321 (SMTP standard), but with unusual elements.
    
    XCTAssertFalse([@"test@[255.255.255.255]" vok_isValidEmailAddressPerW3C], @"Test case 61 returned valid (ISEMAIL_RFC5321).");
    XCTAssertFalse([@"test@[IPv6:1111:2222:3333:4444:5555:6666:255.255.255.255]" vok_isValidEmailAddressPerW3C], @"Test case 79 returned valid (ISEMAIL_RFC5321).");
    XCTAssertFalse([@"test@[IPv6:1111:2222:3333:4444:5555:6666:7777:8888]" vok_isValidEmailAddressPerW3C], @"Test case 68 returned valid (ISEMAIL_RFC5321).");
    XCTAssertFalse([@"\"test\"@iana.org" vok_isValidEmailAddressPerW3C], @"Test case 42 returned valid (ISEMAIL_RFC5321).");
    XCTAssertFalse([@"\"test\\ test\"@iana.org" vok_isValidEmailAddressPerW3C], @"Test case 55 returned valid (ISEMAIL_RFC5321).");
    XCTAssertFalse([@"\"\"@iana.org" vok_isValidEmailAddressPerW3C], @"Test case 43 returned valid (ISEMAIL_RFC5321).");
    XCTAssertFalse([@"\"\\\"\"@iana.org" vok_isValidEmailAddressPerW3C], @"Test case 46 returned valid (ISEMAIL_RFC5321).");
    XCTAssertFalse([@"\"\\\\\"@iana.org" vok_isValidEmailAddressPerW3C], @"Test case 48 returned valid (ISEMAIL_RFC5321).");
    XCTAssertFalse([@"\"\\a\"@iana.org" vok_isValidEmailAddressPerW3C], @"Test case 45 returned valid (ISEMAIL_RFC5321).");
    XCTAssertFalse([@"test@[IPv6:::3333:4444:5555:6666:7777:8888]" vok_isValidEmailAddressPerW3C], @"Test case 75 returned valid (ISEMAIL_RFC5321).");
    XCTAssertFalse([@"test@[IPv6:::]" vok_isValidEmailAddressPerW3C], @"Test case 77 returned valid (ISEMAIL_RFC5321).");
    
#pragma mark Emails only valid under the broadest readings of RFC-5322 (IMF standard).
    
    XCTAssertFalse([@"\"abcdefghijklmnopqrstuvwxyz abcdefghijklmnopqrstuvwxyz abcdefg\\h\"@iana.org" vok_isValidEmailAddressPerW3C], @"Test case 60 returned valid (ISEMAIL_RFC5322).");
    XCTAssertFalse([@"\"abcdefghijklmnopqrstuvwxyz abcdefghijklmnopqrstuvwxyz abcdefghj\"@iana.org" vok_isValidEmailAddressPerW3C], @"Test case 59 returned valid (ISEMAIL_RFC5322).");
    XCTAssertFalse([@"test@iana/icann.org" vok_isValidEmailAddressPerW3C], @"Test case 161 returned valid (ISEMAIL_RFC5322).");
    XCTAssertFalse([@"test@[255.255.255.256]" vok_isValidEmailAddressPerW3C], @"Test case 65 returned valid (ISEMAIL_RFC5322).");
    XCTAssertFalse([@"test@[255.255.255]" vok_isValidEmailAddressPerW3C], @"Test case 63 returned valid (ISEMAIL_RFC5322).");
    XCTAssertFalse([@"test@[1111:2222:3333:4444:5555:6666:7777:8888]" vok_isValidEmailAddressPerW3C], @"Test case 66 returned valid (ISEMAIL_RFC5322).");
    XCTAssertFalse([@"test@[255.255.255.255.255]" vok_isValidEmailAddressPerW3C], @"Test case 64 returned valid (ISEMAIL_RFC5322).");
    XCTAssertFalse([@"test@[IPv6:1111:2222:3333:4444:5555:255.255.255.255]" vok_isValidEmailAddressPerW3C], @"Test case 78 returned valid (ISEMAIL_RFC5322).");
    XCTAssertFalse([@"test@[IPv6:1111:2222:3333:4444:5555:6666:7777:255.255.255.255]" vok_isValidEmailAddressPerW3C], @"Test case 80 returned valid (ISEMAIL_RFC5322).");
    XCTAssertFalse([@"test@[IPv6:1111:2222:3333:4444:5555:6666:7777:8888:9999]" vok_isValidEmailAddressPerW3C], @"Test case 69 returned valid (ISEMAIL_RFC5322).");
    XCTAssertFalse([@"test@[IPv6:1111:2222:3333:4444:5555:6666:7777:888G]" vok_isValidEmailAddressPerW3C], @"Test case 70 returned valid (ISEMAIL_RFC5322).");
    XCTAssertFalse([@"test@[IPv6:1111:2222:3333:4444:5555:6666:7777]" vok_isValidEmailAddressPerW3C], @"Test case 67 returned valid (ISEMAIL_RFC5322).");
    XCTAssertFalse([@"test@[IPv6:1111:2222:3333:4444:5555:6666::255.255.255.255]" vok_isValidEmailAddressPerW3C], @"Test case 82 returned valid (ISEMAIL_RFC5322).");
    XCTAssertFalse([@"test@[IPv6:1111:2222:3333:4444:5555:6666::7777:8888]" vok_isValidEmailAddressPerW3C], @"Test case 73 returned valid (ISEMAIL_RFC5322).");
    XCTAssertFalse([@"test@[IPv6:1111:2222:3333:4444:5555::8888]" vok_isValidEmailAddressPerW3C], @"Test case 72 returned valid (ISEMAIL_RFC5321).");
    XCTAssertFalse([@"test@[IPv6:1111:2222:3333:4444::255.255.255.255]" vok_isValidEmailAddressPerW3C], @"Test case 81 returned valid (ISEMAIL_RFC5321).");
    XCTAssertFalse([@"test@[IPv6:1111:2222:3333:4444:::255.255.255.255]" vok_isValidEmailAddressPerW3C], @"Test case 83 returned valid (ISEMAIL_RFC5322).");
    XCTAssertFalse([@"test@[IPv6:1111::4444:5555::8888]" vok_isValidEmailAddressPerW3C], @"Test case 76 returned valid (ISEMAIL_RFC5322).");
    XCTAssertFalse([@"test@[IPv6:1::2:]" vok_isValidEmailAddressPerW3C], @"Test case 159 returned valid (ISEMAIL_RFC5322).");
    XCTAssertFalse([@"test@[IPv6::255.255.255.255]" vok_isValidEmailAddressPerW3C], @"Test case 84 returned valid (ISEMAIL_RFC5322).");
    XCTAssertFalse([@"test@[IPv6::3333:4444:5555:6666:7777:8888]" vok_isValidEmailAddressPerW3C], @"Test case 74 returned valid (ISEMAIL_RFC5322).");
    XCTAssertFalse([@"test@[RFC 5322 domain literal]" vok_isValidEmailAddressPerW3C], @"Test case 120 returned valid (ISEMAIL_RFC5322).");
    XCTAssertFalse([@"test@[RFC-5322-\\]-domain-literal]" vok_isValidEmailAddressPerW3C], @"Test case 117 returned valid (ISEMAIL_RFC5322).");
    XCTAssertFalse([@"test@[RFC-5322-\\␇-domain-literal]" vok_isValidEmailAddressPerW3C], @"Test case 115 returned valid (ISEMAIL_RFC5322).");
    XCTAssertFalse([@"test@[RFC-5322-\\␉-domain-literal]" vok_isValidEmailAddressPerW3C], @"Test case 116 returned valid (ISEMAIL_RFC5322).");
    XCTAssertFalse([@"test@[RFC-5322-domain-literal] (comment)" vok_isValidEmailAddressPerW3C], @"Test case 121 returned valid (ISEMAIL_RFC5322).");
    XCTAssertFalse([@"test@[RFC-5322-domain-literal]" vok_isValidEmailAddressPerW3C], @"Test case 112 returned valid (ISEMAIL_RFC5322).");
}

- (void)testW3CRejectsMostInvalidEmails
{
    XCTAssertFalse([@"" vok_isValidEmailAddressPerW3C], @"Test case 1 returned valid.");
    XCTAssertFalse([@"test" vok_isValidEmailAddressPerW3C], @"Test case 2 returned valid.");
    XCTAssertFalse([@"test..iana.org" vok_isValidEmailAddressPerW3C], @"Test case 17 returned valid.");
    XCTAssertFalse([@"test_exa-mple.com" vok_isValidEmailAddressPerW3C], @"Test case 18 returned valid.");
    XCTAssertFalse([@"@" vok_isValidEmailAddressPerW3C], @"Test case 3 returned valid.");
    XCTAssertFalse([@"@iana.org" vok_isValidEmailAddressPerW3C], @"Test case 7 returned valid.");
    XCTAssertFalse([@"@io" vok_isValidEmailAddressPerW3C], @"Test case 6 returned valid.");
    XCTAssertFalse([@" ␍␊ ␍␊test@iana.org" vok_isValidEmailAddressPerW3C], @"Test case 145 returned valid.");
    XCTAssertFalse([@" ␍␊test@iana.org" vok_isValidEmailAddressPerW3C], @"Test case 143 returned valid.");
    XCTAssertFalse([@" ␍␊␍␊ test@iana.org" vok_isValidEmailAddressPerW3C], @"Test case 147 returned valid.");
    XCTAssertFalse([@" ␍␊␍␊test@iana.org" vok_isValidEmailAddressPerW3C], @"Test case 146 returned valid.");
    XCTAssertFalse([@"((comment)test@iana.org" vok_isValidEmailAddressPerW3C], @"Test case 91 returned valid.");
    XCTAssertFalse([@"(comment\\)test@iana.org" vok_isValidEmailAddressPerW3C], @"Test case 108 returned valid.");
    XCTAssertFalse([@"(test@iana.org" vok_isValidEmailAddressPerW3C], @"Test case 104 returned valid.");
    XCTAssertFalse([@"(␊)test@iana.org" vok_isValidEmailAddressPerW3C], @"Test case 135 returned valid.");
    XCTAssertFalse([@"(␍)test@iana.org" vok_isValidEmailAddressPerW3C], @"Test case 130 returned valid.");
    XCTAssertFalse([@"\"\"\"@iana.org" vok_isValidEmailAddressPerW3C], @"Test case 44 returned valid.");
    XCTAssertFalse([@"\"\\\"@iana.org" vok_isValidEmailAddressPerW3C], @"Test case 47 returned valid.");
    XCTAssertFalse([@"\"test@iana.org" vok_isValidEmailAddressPerW3C], @"Test case 103 returned valid.");
    XCTAssertFalse([@"\"test@iana.org" vok_isValidEmailAddressPerW3C], @"Test case 50 returned valid.");
    XCTAssertFalse([@"\"test\"\"test\"@iana.org" vok_isValidEmailAddressPerW3C], @"Test case 53 returned valid.");
    XCTAssertFalse([@"\"test\"test@iana.org" vok_isValidEmailAddressPerW3C], @"Test case 51 returned valid.");
    XCTAssertFalse([@"\"test\\\"@iana.org" vok_isValidEmailAddressPerW3C], @"Test case 107 returned valid.");
    XCTAssertFalse([@"\"test\\©\"@iana.org" vok_isValidEmailAddressPerW3C], @"Test case 160 returned valid.");
    XCTAssertFalse([@"\"test␀\"@iana.org" vok_isValidEmailAddressPerW3C], @"Test case 57 returned valid.");
    XCTAssertFalse([@"\"␊\"@iana.org" vok_isValidEmailAddressPerW3C], @"Test case 133 returned valid.");
    XCTAssertFalse([@"\"␍test\"@iana.org" vok_isValidEmailAddressPerW3C], @"Test case 129 returned valid.");
    XCTAssertFalse([@"test(comment)test@iana.org" vok_isValidEmailAddressPerW3C], @"Test case 94 returned valid.");
    XCTAssertFalse([@"test@" vok_isValidEmailAddressPerW3C], @"Test case 4 returned valid.");
    XCTAssertFalse([@"test@(iana.org" vok_isValidEmailAddressPerW3C], @"Test case 105 returned valid.");
    XCTAssertFalse([@"test@.iana.org" vok_isValidEmailAddressPerW3C], @"Test case 34 returned valid.");
    XCTAssertFalse([@"test@[1.2.3.4" vok_isValidEmailAddressPerW3C], @"Test case 106 returned valid.");
    XCTAssertFalse([@"test@[RFC-5322-[domain-literal]" vok_isValidEmailAddressPerW3C], @"Test case 114 returned valid.");
    XCTAssertFalse([@"test@[RFC-5322-domain-literal\\" vok_isValidEmailAddressPerW3C], @"Test case 119 returned valid.");
    XCTAssertFalse([@"test@[RFC-5322-domain-literal\\]" vok_isValidEmailAddressPerW3C], @"Test case 118 returned valid.");
    XCTAssertFalse([@"test@[RFC-5322]-domain-literal]" vok_isValidEmailAddressPerW3C], @"Test case 113 returned valid.");
    XCTAssertFalse([@"test@a[255.255.255.255]" vok_isValidEmailAddressPerW3C], @"Test case 62 returned valid.");
    XCTAssertFalse([@"test@iana..com" vok_isValidEmailAddressPerW3C], @"Test case 36 returned valid.");
    XCTAssertFalse([@"test@iana.org ␍␊ ␍␊" vok_isValidEmailAddressPerW3C], @"Test case 154 returned valid.");
    XCTAssertFalse([@"test@iana.org ␍␊" vok_isValidEmailAddressPerW3C], @"Test case 152 returned valid.");
    XCTAssertFalse([@"test@iana.org ␍␊␍␊ " vok_isValidEmailAddressPerW3C], @"Test case 156 returned valid.");
    XCTAssertFalse([@"test@iana.org ␍␊␍␊" vok_isValidEmailAddressPerW3C], @"Test case 155 returned valid.");
    XCTAssertFalse([@"test@iana.org(comment\\" vok_isValidEmailAddressPerW3C], @"Test case 110 returned valid.");
    XCTAssertFalse([@"test@iana.org(comment\\)" vok_isValidEmailAddressPerW3C], @"Test case 109 returned valid.");
    XCTAssertFalse([@"test@iana.org(␍)" vok_isValidEmailAddressPerW3C], @"Test case 131 returned valid.");
    XCTAssertFalse([@"test@iana.org." vok_isValidEmailAddressPerW3C], @"Test case 35 returned valid.");
    XCTAssertFalse([@"test@iana.org␊" vok_isValidEmailAddressPerW3C], @"Test case 99 returned valid.");
    XCTAssertFalse([@"test@iana.org␍" vok_isValidEmailAddressPerW3C], @"Test case 127 returned valid.");
    XCTAssertFalse([@"test@iana.org␍␊ ␍␊" vok_isValidEmailAddressPerW3C], @"Test case 151 returned valid.");
    XCTAssertFalse([@"test@iana.org␍␊" vok_isValidEmailAddressPerW3C], @"Test case 150 returned valid.");
    XCTAssertFalse([@"test@.org" vok_isValidEmailAddressPerW3C], @"Test case 123 returned valid.");
    XCTAssertFalse([@"test@␇.org" vok_isValidEmailAddressPerW3C], @"Test case 137 returned valid.");
    XCTAssertFalse([@"test\"@iana.org" vok_isValidEmailAddressPerW3C], @"Test case 49 returned valid.");
    XCTAssertFalse([@"test\"text\"@iana.org" vok_isValidEmailAddressPerW3C], @"Test case 52 returned valid.");
    XCTAssertFalse([@"test\\@test@iana.org" vok_isValidEmailAddressPerW3C], @"Test case 20 returned valid.");
    XCTAssertFalse([@"@iana.org" vok_isValidEmailAddressPerW3C], @"Test case 122 returned valid.");
    XCTAssertFalse([@"␇@iana.org" vok_isValidEmailAddressPerW3C], @"Test case 136 returned valid.");
    XCTAssertFalse([@"␊test@iana.org" vok_isValidEmailAddressPerW3C], @"Test case 132 returned valid.");
    XCTAssertFalse([@"␍test@iana.org" vok_isValidEmailAddressPerW3C], @"Test case 128 returned valid.");
    XCTAssertFalse([@"␍␊ ␍␊test@iana.org" vok_isValidEmailAddressPerW3C], @"Test case 142 returned valid.");
    XCTAssertFalse([@"␍␊test@iana.org" vok_isValidEmailAddressPerW3C], @"Test case 141 returned valid.");
    
    //Invalid emails the W3C validator lets through
    
    XCTAssertTrue([@"test@-iana.org" vok_isValidEmailAddressPerW3C], @"Test case 30 returned invalid.");
    XCTAssertTrue([@".test@iana.org" vok_isValidEmailAddressPerW3C], @"Test case 15 returned invalid.");
    XCTAssertTrue([@"test.@iana.org" vok_isValidEmailAddressPerW3C], @"Test case 16 returned invalid.");
    XCTAssertTrue([@"test@iana-.com" vok_isValidEmailAddressPerW3C], @"Test case 31 returned invalid.");
    XCTAssertTrue([@"test@iana.org-" vok_isValidEmailAddressPerW3C], @"Test case 102 returned invalid.");
}

@end
