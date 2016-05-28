//
//  DoctorModel.h
//  Doctor
//
//  Created by 张少霞 on 16/5/11.
//  Copyright © 2016年 zsx. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DoctorModel : NSObject

@property (nonatomic,copy) NSString *title;

@property (nonatomic,copy) NSString *level;

@property (nonatomic,copy) NSString *dateTime;

+(instancetype)doctorModelWithDict:(NSDictionary *)dict;



@end
