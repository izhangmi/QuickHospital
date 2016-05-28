//
//  hospitalOfConcernModel.h
//  我的收藏
//
//  Created by 朱宁MacPro on 16/5/10.
//  Copyright © 2016年 朱宁MacPro. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface hospitalOfConcernModel : NSObject

@property(nonatomic,copy)NSString *hospitalIcon;

@property(nonatomic,copy) NSString *hospitalTitle;
@property(nonatomic,copy) NSString *hospitalGrades;
@property(nonatomic,copy) NSString *hospitalLocation;




+(instancetype)hoispatalModelWithDict:(NSDictionary *)dict;

@end
