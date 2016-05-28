//
//  THBuySeviceModel.h
//  快医
//
//  Created by litianhao on 16/5/13.
//  Copyright © 2016年 bear. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface THBuySeviceModel : NSObject

@property (nonatomic,assign) BOOL isPrompt;
@property (nonatomic,copy) NSString *title;
@property (nonatomic,copy) NSString *iconName;
@property (nonatomic,assign) BOOL isSelected;

+ (instancetype)modelWithDict:(NSDictionary *)dict;
- (instancetype)initWithDict:(NSDictionary *)dict;

@end
