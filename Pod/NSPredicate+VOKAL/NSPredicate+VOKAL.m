//
//  NSPredicate+VOKAL.m
//  VOKUtilities
//
//  Created by Carl Hill-Popper on 1/5/15.
//  Copyright (c) 2015 Vokal. All rights reserved.
//

#import "NSPredicate+VOKAL.h"

@implementation NSPredicate (VOKAL)

+ (instancetype)vok_predicateWithValue:(id)value forKeyPath:(NSString *)keyPath
{
    return [self predicateWithFormat:@"%K == %@", keyPath, value];
}

+ (instancetype)vok_predicateWithKeyPath:(NSString *)keyPath inCollection:(id)collection
{
    if (!([collection isKindOfClass:[NSArray class]]
          || [collection isKindOfClass:[NSSet class]]
          || [collection isKindOfClass:[NSDictionary class]])) {
        [NSException raise:NSInvalidArgumentException
                    format:@"%@ requires an NSArray, NSSet, or NSDictionary as a collection", NSStringFromSelector(_cmd)];
    }
    
    return [self predicateWithFormat:@"%K IN %@", keyPath, collection];
}

@end
