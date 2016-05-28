//
//  HospitalData.h
//  快医
//
//  Created by 付凯琪 on 16/5/10.
//  Copyright © 2016年 bear. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HospitalData : NSObject

@property (nonatomic, copy) NSString *icon;//配图
@property (nonatomic, copy) NSString *name;//名称
@property (nonatomic, copy) NSString *rank;//等级
@property (nonatomic, copy) NSString *area;//地址

+ (instancetype)hospitalDataWithDict:(NSDictionary *)dict;
+ (NSArray *)loadHospitalDataWithPlistName:(NSString *)plistname;

@end
