//
//  doctorListModel.h
//  Doctor List
//
//  Created by 张少霞 on 16/5/10.
//  Copyright © 2016年 zsx. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface doctorListModel : NSObject

//医院
@property (nonatomic ,strong)NSString *title;
//级别
@property (nonatomic,copy) NSString *detail;
//时间
@property (nonatomic,copy) NSString *dateTime;
//患者
@property (nonatomic,copy) NSString *patient;

//医生
@property (nonatomic,copy) NSString *doctor;

//症状
@property (nonatomic,copy) NSString *symptom;



+(instancetype)notificationModelWithDict:(NSDictionary*)dict;






@end
