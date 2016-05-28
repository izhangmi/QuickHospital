//
//  PayDetailsModel.h
//  支付明细
//
//  Created by 朱宁MacPro on 16/5/10.
//  Copyright © 2016年 朱宁MacPro. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PayDetailsModel : NSObject

@property (nonatomic,copy) NSString *money;
@property (nonatomic,copy) NSString *title;
@property (nonatomic,copy) NSString *payData;
@property (nonatomic,copy) NSString *payThing;

+(instancetype)PayDetailsModelWithDict:(NSDictionary *)dict;




@end
