//
//  VOKEmailHelper_UITests.m
//  VOKUtilities
//
//  Created by Ellen Shapiro (Vokal) on 4/30/15.
//  Copyright (c) 2015 Vokal. All rights reserved.
//

#import <KIF/KIF.h>
#import "VOKAppDelegate.h"
#import "VOKEmailHelper.h"
#import <MessageUI/MessageUI.h>

@interface VOKEmailHelper_UITests : KIFTestCase
@property (nonatomic) NSArray *recipients;
@property (nonatomic) NSString *subject;
@property (nonatomic) NSString *body;
@property (nonatomic) BOOL expectCanSend;
@end

@implementation VOKEmailHelper_UITests

- (void)beforeEach
{
    [super beforeEach];
    
    self.recipients = nil;
    self.subject = nil;
    self.body = nil;
    self.expectCanSend = NO;
}

#pragma mark - Test lifecycle

- (void)sendEmailWithProperties
{
    UIViewController *root = [[UIApplication sharedApplication] delegate].window.rootViewController;
    XCTAssertNotNil(root);
    
    BOOL canSendEmail = [VOKEmailHelper sendEmailWithSubject:self.subject
                                                 receipients:self.recipients
                                                        body:self.body
                                                      fromVC:root
                                         withComposeDelegate:nil];
    
    XCTAssertEqual(canSendEmail, self.expectCanSend);
}

- (void)sendHTMLEmailWithProperties
{
    UIViewController *root = [[UIApplication sharedApplication] delegate].window.rootViewController;
    XCTAssertNotNil(root);
    
    BOOL canSendEmail = [VOKEmailHelper sendHTMLEmailWithSubject:self.subject
                                                     receipients:self.recipients
                                                            body:self.body
                                                          fromVC:root
                                             withComposeDelegate:nil];
    
    XCTAssertEqual(canSendEmail, self.expectCanSend);
}

- (void)setupSimpsons
{
    self.subject = @"HappyDude";
    self.recipients = @[
                        @"marge@listenlady.org",
                        @"wiggum@springfield.gov",
                        ];
    self.body = @"Greetings, friends. Do you wish to look as happy as me? Well, you've got the power inside you right now.\n\nSo, use it, and send one dollar to:\n\nHappy Dude\n742 Evergreen Terrace\nSpringfield.\n\nDon't delay, eternal happiness is just a dollar away.";
}

- (void)setupSimpsonsHTML
{
    self.subject = @"HappyDude";
    self.recipients = @[
                        @"marge@listenlady.org",
                        @"wiggum@springfield.gov",
                        ];
    self.body = @"<p>Greetings, friends. Do you wish to look as happy as me? Well, you've got the power inside you right now.</p><p>So, use it, and send one dollar to:</p><p>Happy Dude<br/>742 Evergreen Terrace<br/>Springfield.</p><p>Don't delay, eternal happiness is just a dollar away.</p>";
}

#pragma mark - Tests!

#pragma mark Simulator only

#if TARGET_IPHONE_SIMULATOR

/*
 * In the iOS 10 simulator, [MFMailComposeViewController canSendMail] returns NO, which means
 * the mail compose view won't be shown and these two tests can't actually check the "borked" alert.
 * These tests are retained for checks on iOS 9 and earlier.
 */

- (void)testSimulatorShowsBorkedMethodAlert
{
    if ([MFMailComposeViewController canSendMail]) {
        self.expectCanSend = YES;
        
        [self setupSimpsons];
        [self sendEmailWithProperties];
        
        NSString *expectedAlertText = [VOKEmailHelper simulatorBorkedMessageForSubject:self.subject
                                                                                emails:self.recipients
                                                                                  body:self.body];
        [tester waitForViewWithAccessibilityLabel:expectedAlertText];
    }
}

- (void)testSimulatorShowsBorkedMethodAlertWithHTML
{
    if ([MFMailComposeViewController canSendMail]) {
        self.expectCanSend = YES;
        
        [self setupSimpsons];
        [self sendHTMLEmailWithProperties];
        
        NSString *expectedAlertText = [VOKEmailHelper simulatorBorkedMessageForSubject:self.subject
                                                                                emails:self.recipients
                                                                                  body:self.body];
        [tester waitForViewWithAccessibilityLabel:expectedAlertText];
    }
}

#else

#pragma mark Device only

- (void)testNullEverythingDoesntCauseACrash
{
    self.expectCanSend = YES;
    XCTAssertNoThrow([self sendEmailWithProperties]);
}

- (void)testNullEverythingDoesntCauseACrashHTML
{
    self.expectCanSend = YES;
    XCTAssertNoThrow([self sendHTMLEmailWithProperties]);
}

- (void)testNonNullThingsWorks
{
    self.expectCanSend = [MFMailComposeViewController canSendMail];
    [self setupSimpsons];
    XCTAssertNoThrow([self sendEmailWithProperties]);
    
    if (self.expectCanSend) {
        //Cancel button on the mail compose VC - back out
        [tester tapViewWithAccessibilityLabel:@"Cancel"];
        
        //Delete the draft why don't ya
        [tester tapViewWithAccessibilityLabel:@"Delete Draft"];
        
        //Make sure the mail view goes away.
        [tester waitForViewWithAccessibilityLabel:@"Cancel"];
    }
}

- (void)testNonNullThingsWorksWithHTML
{
    self.expectCanSend = [MFMailComposeViewController canSendMail];
    [self setupSimpsonsHTML];
    XCTAssertNoThrow([self sendHTMLEmailWithProperties]);
    
    if (self.expectCanSend) {
        //Cancel button on the mail compose VC - back out
        [tester tapViewWithAccessibilityLabel:@"Cancel"];
        
        //Delete the draft why don't ya
        [tester tapViewWithAccessibilityLabel:@"Delete Draft"];
        
        //Make sure the mail view goes away.
        [tester waitForViewWithAccessibilityLabel:@"Cancel"];
    }
}

#endif

@end
