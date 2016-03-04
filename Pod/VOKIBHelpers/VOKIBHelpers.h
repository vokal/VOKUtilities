//
//  VOKIBHelpers.h
//  VOKUtilities
//
//  Created by Bryan Luby on 4/6/15.
//  Copyright (c) 2015 Vokal. All rights reserved.
//

#ifndef Pods_VOKIBHelpers_h
#define Pods_VOKIBHelpers_h

#import <Foundation/Foundation.h>

/**
 *  This header file is for exposing existing framework properties to interface builder through IBInspectable.
 *  To expose a property, add the relevant class extension declaration if needed. Then, copy and paste the property
 *  declaration from the existing framework header file. Finally, add "IBInspectable" before the property's class name.
 *  Interface builder should now display the exposed property in the attributes inspector.
 */

NS_ASSUME_NONNULL_BEGIN

@interface UIView ()

@property (nullable, nonatomic, copy) IBInspectable NSString *accessibilityIdentifier;

@end

@interface NSLayoutConstraint ()

@property (nullable, copy) IBInspectable NSString *identifier;

@end

NS_ASSUME_NONNULL_END

#endif
