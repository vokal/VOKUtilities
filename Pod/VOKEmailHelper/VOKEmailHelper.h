//
//  VOKEmailHelper.h
//  VOKUtilities
//
//  Created by Ellen Shapiro (Vokal) on 4/30/15.
//  Copyright (c) 2015 Vokal. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>

NS_ASSUME_NONNULL_BEGIN

@interface VOKEmailHelper : NSObject

/**
 *  Sets up a non-HTML email to send (or shows an alert if on the simulator)
 *
 *  @param subject         The subject of the email.
 *  @param recipientEmails An array of email addresseses of the recipients, or nil.
 *  @param body            The body of the email.
 *  @param presenter       The UIViewController to use to present the mail compose view controller (or alert)
 *  @param delegate        The MFMailComposeViewControllerDelegate to notify on dismissal
 * 
 *  @return YES if the device can send email, NO if it cannot (will return YES in the sim, alert handles that case). 
 */
+ (BOOL)sendEmailWithSubject:(NSString *)subject
                 receipients:(nullable NSArray<NSString *> *)recipientEmails
                        body:(NSString *)body
                      fromVC:(UIViewController *)presenter
         withComposeDelegate:(nullable id<MFMailComposeViewControllerDelegate>)delegate;

/**
 *  Sets up an HTML email to send (or shows an alert if on the simulator)
 *
 *  @param subject         The subject of the email.
 *  @param recipientEmails An array of email addresseses of the recipients, or nil.
 *  @param htmlBody        The HTML body of the email.
 *  @param presenter       The UIViewController to use to present the mail compose view controller (or alert)
 *  @param delegate        The MFMailComposeViewControllerDelegate to notify on dismissal
 *
 *  @return YES if the device can send email, NO if it cannot (will return YES in the sim, alert handles that case).
 */
+ (BOOL)sendHTMLEmailWithSubject:(NSString *)subject
                     receipients:(nullable NSArray<NSString *> *)recipientEmails
                            body:(NSString *)htmlBody
                          fromVC:(UIViewController *)presenter
             withComposeDelegate:(nullable id<MFMailComposeViewControllerDelegate>)delegate;

/**
 * @return The message that the simulator would return for a given 
 * subject, emails, and body. Useful for testing that email send methods 
 * work even when simulator mail is being dumb.
 */
+ (NSString *)simulatorBorkedMessageForSubject:(NSString *)subject
                                        emails:(nullable NSArray<NSString *> *)emails
                                          body:(NSString *)body;

/**
 *  @return The title of the simulator borked alert, exposed for UI testing.
 */
+ (NSString *)simulatorBorkedTitle;

/**
 *  @return The title of the button to dismiss the simulator borked alert, exposed for UI testing.
 */
+ (NSString *)simulatorBorkedButtonTitle;

@end

NS_ASSUME_NONNULL_END
