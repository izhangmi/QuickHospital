//
//  KKmediaclModel.h
//  快医
//
//  Created by 朱宁MacPro on 16/5/13.
//  Copyright © 2016年 bear. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KKmediaclModel : NSObject
@property(nonatomic,copy)NSString *iconName;
@property(nonatomic,copy)NSString *titleName;
@property(nonatomic,copy)NSString *report;
@property(nonatomic,copy)NSString *checkTime;
@property (nonatomic,assign) BOOL selected;

+(instancetype)KKmedicalModelWithDict:(NSDictionary *)dict;

@end
