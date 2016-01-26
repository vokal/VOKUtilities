//
//  VOKAlertAction.m
//  VOKUtilities
//
//  Created by Rachel Hyman on 6/17/15.
//  Copyright (c) 2015 Vokal. All rights reserved.
//

#import "VOKAlertAction.h"

@interface VOKAlertAction ()

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) VOKAlertActionBlock actionBlock;

@end

@implementation VOKAlertAction

- (instancetype)initWithTitle:(NSString *)title actionBlock:(VOKAlertActionBlock)actionBlock
{
    NSAssert(title, @"VOKAlertAction title cannot be empty.");
    self = [super init];
    if (self) {
        _title = [title copy];
        _actionBlock = [actionBlock copy];
    }
    return self;
}

@end
