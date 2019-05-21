//
//  VOKEmailHelper.m
//  VOKUtilities
//
//  Created by Ellen Shapiro (Vokal) on 4/30/15.
//  Copyright (c) 2015 Vokal. All rights reserved.
//

#import "VOKEmailHelper.h"

@implementation VOKEmailHelper

+ (BOOL)sendHTMLEmailWithSubject:(NSString *)subject
                     receipients:(NSArray *)recipientEmails
                            body:(NSString *)htmlBody
                          fromVC:(UIViewController *)presenter
             withComposeDelegate:(id<MFMailComposeViewControllerDelegate>)delegate
{
    return [self sendEmailWithSubject:subject
                          receipients:recipientEmails
                                 body:htmlBody
                               isHTML:YES
                               fromVC:presenter
                  withComposeDelegate:delegate];
}

+ (BOOL)sendEmailWithSubject:(NSString *)subject
                 receipients:(NSArray *)recipientEmails
                        body:(NSString *)body
                      fromVC:(UIViewController *)presenter
         withComposeDelegate:(id<MFMailComposeViewControllerDelegate>)delegate
{
    return [self sendEmailWithSubject:subject
                          receipients:recipientEmails
                                 body:body
                               isHTML:NO
                               fromVC:presenter
                  withComposeDelegate:delegate];
}


+ (BOOL)sendEmailWithSubject:(NSString *)subject
                 receipients:(NSArray *)recipientEmails
                        body:(NSString *)body
                      isHTML:(BOOL)isHTML
                      fromVC:(UIViewController *)presenter
         withComposeDelegate:(id<MFMailComposeViewControllerDelegate>)delegate
{
    if ([MFMailComposeViewController canSendMail]) {
#if TARGET_IPHONE_SIMULATOR
        NSString *borkedMessage = [self simulatorBorkedMessageForSubject:subject
                                                                  emails:recipientEmails
                                                                    body:body];
        [self showSimulatorMailIsBorked:presenter message:borkedMessage];
#else
        //Wouldn't you know, it actually works just fine on device!
        MFMailComposeViewController *mailCompose = [[MFMailComposeViewController alloc] init];
        [mailCompose setToRecipients:recipientEmails];
        [mailCompose setSubject:subject];
        [mailCompose setMailComposeDelegate:delegate];
        [mailCompose setMessageBody:body isHTML:isHTML];
    
        [presenter presentViewController:mailCompose
                                animated:YES
                              completion:nil];
#endif
        return YES;
    } else {
        return NO;
    }
}

+ (void)showSimulatorMailIsBorked:(UIViewController *)presenter message:(NSString *)messageString
{
    //ಠ_ಠ: http://stackoverflow.com/questions/25604552/i-have-real-misunderstanding-with-mfmailcomposeviewcontroller-in-swift-ios8-in/25864182#25864182
    NSString *title = [self simulatorBorkedTitle];
    NSString *cancelButtonTitle = [self simulatorBorkedButtonTitle];
    
    UIAlertController *simulatorSucksAlert = [UIAlertController alertControllerWithTitle:title
                                                                                 message:messageString
                                                                          preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *closeAction = [UIAlertAction actionWithTitle:cancelButtonTitle
                                                          style:UIAlertActionStyleDefault
                                                        handler:^(UIAlertAction *action) {
                                                            [simulatorSucksAlert dismissViewControllerAnimated:YES completion:nil];
                                                        }];
    [simulatorSucksAlert addAction:closeAction];
    
    [presenter presentViewController:simulatorSucksAlert animated:NO completion:nil];
}

+ (NSString *)simulatorBorkedMessageForSubject:(NSString *)subject
                                        emails:(NSArray *)emails
                                          body:(NSString *)body
{
    return [NSString stringWithFormat:@"Apple broke MFMailComposeViewController on the simulator. But you're trying to send:\n\nSubject: %@\
            nEmails: %@\nBody:%@", subject, emails, body];
}

+ (NSString *)simulatorBorkedTitle
{
    return @"Dammit, Apple";
}

+ (NSString *)simulatorBorkedButtonTitle
{
    return @"apple you're the best";
}

@end
