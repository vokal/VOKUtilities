//
//  VOKAlertHelper.m
//  VOKUtilities
//
//  Created by Rachel Hyman on 6/15/15.
//  Copyright (c) 2015 Vokal. All rights reserved.
//

#import "VOKAlertHelper.h"

@implementation VOKAlertHelper

+ (void)showAlertFromViewController:(UIViewController *)viewController
                          withTitle:(NSString *)title
                            message:(NSString *)message
                            buttons:(NSArray *)buttons
{
     NSAssert(viewController, @"View controller is required to present alert.");
    
#ifdef DEBUG
    [self validateButtonsArray:buttons];
#endif
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title
                                                                             message:message
                                                                      preferredStyle:UIAlertControllerStyleAlert];
    
    for (VOKAlertAction *vokAlertAction in buttons) {
        [alertController addAction:[self systemAlertActionFromVOKAlertAction:vokAlertAction]];
    }
    
    [viewController presentViewController:alertController
                                 animated:YES
                               completion:nil];
}

#pragma mark - Helpers

+ (void)validateButtonsArray:(NSArray *)buttons
{
#ifdef DEBUG
    NSAssert(buttons.count > 0, @"Buttons array cannot be nil or empty");
    for (NSObject *obj in buttons) {
        NSAssert([obj isKindOfClass:[VOKAlertAction class]], @"Buttons array must be composed of VOKAlertAction objects");
    }
#endif
}

+ (UIAlertAction *)systemAlertActionFromVOKAlertAction:(VOKAlertAction *)vokAlertAction
{
    void(^systemActionBlock)(UIAlertAction *) = nil;
    if (vokAlertAction.actionBlock) {
        //We have to make our VOKAlertAction conform to the signature of the handler for a UIAlertAction.
        systemActionBlock = ^(UIAlertAction *alertAction) {
            vokAlertAction.actionBlock();
        };
    }
    
    return [UIAlertAction actionWithTitle:vokAlertAction.title
                                    style:UIAlertActionStyleDefault
                                  handler:systemActionBlock];
}

@end
