#ifdef __OBJC__
#import <Cocoa/Cocoa.h>
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
#import "VOKKeyPathHelper.h"

FOUNDATION_EXPORT double VOKUtilitiesVersionNumber;
FOUNDATION_EXPORT const unsigned char VOKUtilitiesVersionString[];

