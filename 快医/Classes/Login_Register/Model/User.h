//
//  User.h
//  快医
//
//  Created by bear on 16/5/11.
//  Copyright © 2016年 bear. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YYModel.h"

@interface User : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) NSInteger gender;

@property (nonatomic, copy) NSString *mobile_number;

@property (nonatomic, assign) NSInteger province_id;

@property (nonatomic, assign) NSInteger county_id;

@property (nonatomic, assign) NSInteger age;

@property (nonatomic, assign) NSInteger user_id;

@property (nonatomic, copy) NSString *true_name;

@property (nonatomic, copy) NSString *weight;

@property (nonatomic, assign) NSInteger city_id;

@property (nonatomic, assign) NSInteger is_certify;

@property (nonatomic, copy) NSString *address;

@property (nonatomic, assign) NSInteger card_type;

@property (nonatomic, copy) NSString *easymob_password;

@property (nonatomic, copy) NSString *associate_id;

@property (nonatomic, copy) NSString *login_token;

@property (nonatomic, copy) NSString *easymob_id;

@property (nonatomic, copy) NSString *head_photo;

@property (nonatomic, copy) NSString *card_number;

@property (nonatomic, copy) NSString *height;

@end
