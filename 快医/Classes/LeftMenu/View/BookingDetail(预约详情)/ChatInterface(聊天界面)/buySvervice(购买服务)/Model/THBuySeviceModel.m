//
//  THBuySeviceModel.m
//  快医
//
//  Created by litianhao on 16/5/13.
//  Copyright © 2016年 bear. All rights reserved.
//

#import "THBuySeviceModel.h"

@implementation THBuySeviceModel

+(instancetype)modelWithDict:(NSDictionary *)dict{
    return [[self alloc] initWithDict:dict];
}

-(instancetype)initWithDict:(NSDictionary *)dict{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    
}

@end
