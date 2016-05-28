//
//  THBookingDetailDisplayModel.m
//  快医
//
//  Created by litianhao on 16/5/11.
//  Copyright © 2016年 bear. All rights reserved.
//

#import "THBookingDetailDisplayModel.h"
#import "THBookingDetailInfoModel.h"

@implementation THBookingDetailDisplayModel

+ (instancetype)bookingDetailDisplayModelWithDict:(NSDictionary *)dict
{
    THBookingDetailDisplayModel *model  = [[THBookingDetailDisplayModel alloc] init];
    [model setValuesForKeysWithDictionary:dict];
    
    return model ;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    if ([key isEqualToString:@"bookingInfo"]) {
        _bookInfo = [THBookingDetailInfoModel bookDetailInfoModelWithDict:value];
    }
}
@end
