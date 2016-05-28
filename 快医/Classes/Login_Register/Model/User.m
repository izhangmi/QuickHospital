//
//  User.m
//  快医
//
//  Created by bear on 16/5/11.
//  Copyright © 2016年 bear. All rights reserved.
//

#import "User.h"

@implementation User




- (void)encodeWithCoder:(NSCoder *)aCoder { [self yy_modelEncodeWithCoder:aCoder]; }
- (id)initWithCoder:(NSCoder *)aDecoder { self = [super init]; return [self yy_modelInitWithCoder:aDecoder]; }
- (id)copyWithZone:(NSZone *)zone { return [self yy_modelCopy]; }
- (NSUInteger)hash { return [self yy_modelHash]; }
- (BOOL)isEqual:(id)object { return [self yy_modelIsEqual:object]; }

- (NSString *)description { return [self yy_modelDescription]; }


@end
