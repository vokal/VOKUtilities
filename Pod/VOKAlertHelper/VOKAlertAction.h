//
//  VOKAlertAction.h
//  VOKUtilities
//
//  Created by Rachel Hyman on 6/17/15.
//  Copyright (c) 2015 Vokal. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^VOKAlertActionBlock)(void);

NS_ASSUME_NONNULL_BEGIN

@interface VOKAlertAction : NSObject

@property (nonatomic, copy, readonly) NSString *title;
@property (nonatomic, copy, readonly, nullable) VOKAlertActionBlock actionBlock;

/**
 *  Designated initializer for VOKAlertAction class.
 *
 *  @param title       Corresponds to a button title.
 *  @param actionBlock An optional action block, returning nothing and taking no parameters, to be run when the button is tapped.
 *
 *  @return An instance of the VOKAlertAction class.
 */
- (instancetype)initWithTitle:(NSString *)title actionBlock:(nullable VOKAlertActionBlock)actionBlock;

@end

NS_ASSUME_NONNULL_END
