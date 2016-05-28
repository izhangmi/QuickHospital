//
//  THBookingDetailInfoModel.m
//  快医
//
//  Created by litianhao on 16/5/11.
//  Copyright © 2016年 bear. All rights reserved.
//

#import "THBookingDetailInfoModel.h"

@implementation THBookingDetailInfoModel

+ (instancetype)bookDetailInfoModelWithDict:(NSDictionary *)dict
{
    THBookingDetailInfoModel *model = [[THBookingDetailInfoModel alloc] init];
    [model setValuesForKeysWithDictionary:dict];
    return model ;
}

- (void)setCost:(NSString *)cost
{
    _cost = [NSString stringWithFormat:@"¥ : %@" , cost];
}
@end
