//
//  ChooseDisease.h
//  快医
//
//  Created by bear on 16/5/12.
//  Copyright © 2016年 bear. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <YYModel.h>

@interface ChooseDisease : NSObject


@property (nonatomic, strong) NSNumber *ci2_id;
@property (nonatomic, strong) NSNumber *ci3_id;
@property (nonatomic, copy) NSString * ci3_name;




-(instancetype)initWithDict:(NSDictionary *)dict;

+(instancetype)chooseDiseaseWithDict:(NSDictionary *)dict;

@end
