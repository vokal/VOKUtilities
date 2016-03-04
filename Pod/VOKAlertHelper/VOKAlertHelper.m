//
//  VOKAlertHelper.m
//  VOKUtilities
//
//  Created by Rachel Hyman on 6/15/15.
//  Copyright (c) 2015 Vokal. All rights reserved.
//

#import "VOKAlertHelper.h"

@interface VOKAlertHelper_ios7 : VOKAlertHelper <UIAlertViewDelegate>

///Array to store alert actions to carry out action blocks in iOS 7.
@property (nonatomic, copy) NSArray *alertActionsArray;

@end

@interface VOKAlertHelper_ios8 : VOKAlertHelper

@end

#pragma mark - VOKAlertHelper superclass

@implementation VOKAlertHelper

+ (void)showAlertFromViewController:(UIViewController *)viewController
                          withTitle:(NSString *)title
                            message:(NSString *)message
                            buttons:(NSArray *)buttons
{
#ifdef DEBUG
    [self validateButtonsArray:buttons];
#endif
    
    Class VOKAlertHelperSubclass;
    if ([UIAlertController class]) {
        VOKAlertHelperSubclass = [VOKAlertHelper_ios8 class];
    } else {
        VOKAlertHelperSubclass = [VOKAlertHelper_ios7 class];
    }
    
    [VOKAlertHelperSubclass showAlertFromViewController:viewController
                                              withTitle:title
                                                message:message
                                                buttons:buttons];
}

+ (void)validateButtonsArray:(NSArray *)buttons
{
#ifdef DEBUG
    NSAssert(buttons.count > 0, @"Buttons array cannot be nil or empty");
    for (NSObject *obj in buttons) {
        NSAssert([obj isKindOfClass:[VOKAlertAction class]], @"Buttons array must be composed of VOKAlertAction objects");
    }
#endif
}

@end

#pragma mark - VOKAlertHelper_ios7 subclass

@implementation VOKAlertHelper_ios7

//We must have a singleton in iOS 7 to serve as delegate in order to carry out any action blocks after the alert is dismissed.
+ (instancetype)sharedInstance
{
    static VOKAlertHelper_ios7 *sharedAlertHelper = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedAlertHelper = [[VOKAlertHelper_ios7 alloc] init];
    });
    return sharedAlertHelper;
}


+ (void)showAlertFromViewController:(UIViewController *)viewController
                          withTitle:(NSString *)title
                            message:(NSString *)message
                            buttons:(NSArray *)buttons
{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:title
                                                        message:message
                                                       delegate:[self sharedInstance]
                                              cancelButtonTitle:nil
                                              otherButtonTitles:nil];
    
    for (VOKAlertAction *alertAction in buttons) {
        [alertView addButtonWithTitle:alertAction.title];
    }
    ((VOKAlertHelper_ios7 *)[self sharedInstance]).alertActionsArray = buttons;
    
    [alertView show];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    VOKAlertHelper_ios7 *sharedInstance = [[self class] sharedInstance];
    VOKAlertAction *alertAction = sharedInstance.alertActionsArray[buttonIndex];
    if (alertAction.actionBlock) {
        //Run the action block for the corresponding button.
        alertAction.actionBlock();
    }
    //Nil out the array where we're keeping the action blocks.
    sharedInstance.alertActionsArray = nil;
}

@end

#pragma mark - VOKAlertHelper_ios8 subclass

@implementation VOKAlertHelper_ios8

+ (void)showAlertFromViewController:(UIViewController *)viewController
                          withTitle:(NSString *)title
                            message:(NSString *)message
                            buttons:(NSArray *)buttons
{
    NSAssert(viewController, @"View controller is required to present alert in iOS 8+");
    
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
