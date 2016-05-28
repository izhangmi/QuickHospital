//
//  notificationModel.h
//  通知
//
//  Created by 张少霞 on 16/5/9.
//  Copyright © 2016年 zsx. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface notificationModel : NSObject
//图片名称
@property (nonatomic,copy) NSString *iconName;
//标题
@property (nonatomic ,strong)NSString *title;
//简介
@property (nonatomic,copy) NSString *detail;

+(instancetype)notificationModelWithDict:(NSDictionary*)dict;

@end
