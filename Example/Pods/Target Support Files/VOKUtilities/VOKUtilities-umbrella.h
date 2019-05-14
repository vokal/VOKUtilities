#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "NSCalendar+VOKAL.h"
#import "NSNumberFormatter+VOKAL.h"
#import "NSPredicate+VOKAL.h"
#import "NSString+VOKValidation.h"
#import "UIColor+VOKAL.h"
#import "UIView+VOKCircle.h"
#import "UIView+VOKDebug.h"
#import "UIViewController+VOKKeyboard.h"
#import "VOKAlertAction.h"
#import "VOKAlertHelper.h"
#import "VOKEmailHelper.h"
#import "VOKIBHelpers.h"
#import "VOKKeyPathHelper.h"
#import "VOKNavigationHelper.h"

FOUNDATION_EXPORT double VOKUtilitiesVersionNumber;
FOUNDATION_EXPORT const unsigned char VOKUtilitiesVersionString[];

