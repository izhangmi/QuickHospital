//
//  MatchedDoctor.h
//  快医
//
//  Created by bear on 16/5/13.
//  Copyright © 2016年 bear. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YYModel.h"

@interface MatchedDoctor : NSObject

@property (nonatomic, assign) NSInteger flower;

@property (nonatomic, assign) NSInteger operation_count;

@property (nonatomic, assign) NSInteger banner;

@property (nonatomic, copy) NSString *doctor_hospital_name;

@property (nonatomic, copy) NSString *doctor_name;

@property (nonatomic, copy) NSString *doctor_portrait;

@property (nonatomic, assign) NSInteger doctor_id;

@property (nonatomic, copy) NSString *doctor_title_name;

@property (nonatomic, assign) NSInteger doctor_gender;

@property (nonatomic, copy) NSString *accuracy;

@property (nonatomic, copy) NSString *easymob_id;

@end
