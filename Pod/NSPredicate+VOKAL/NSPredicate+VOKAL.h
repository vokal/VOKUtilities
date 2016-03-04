//
//  NSPredicate+VOKAL.h
//  VOKUtilities
//
//  Created by Carl Hill-Popper on 1/5/15.
//  Copyright (c) 2015 Vokal. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSPredicate (VOKAL)

/**
 Create and return a predicate with the given value and key path using
 
<pre>[NSPredicate predicateWithFormat:\@"%K == %\@", keypath, value];</pre>
 
 @param value The value to include in the predicate format
 @param keyPath The key path to include in the predicate format
 */
+ (instancetype)vok_predicateWithValue:(nullable id)value forKeyPath:(NSString *)keyPath;

/**
 Create and return a predicate to match the value for the given key path in the given collection using
 
 <pre>[NSPredicate predicateWithFormat:\@"%K in %\@", keyPath, collection];</pre>
 
 Collection must be either an NSArray, NSSet, NSDictionary, or of any of the corresponding mutable classes.
 
 @param keyPath The key path to include in the predicate format
 @param collection The collection of values to include in the predicate format.
 Any class other than NSArray, NSSet, NSDictionary, or any of the corresponding mutable classes will throw an exception.
 */
+ (instancetype)vok_predicateWithKeyPath:(NSString *)keyPath inCollection:(id)collection;

@end

NS_ASSUME_NONNULL_END
