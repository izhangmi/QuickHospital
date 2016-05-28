//
//  THChatModel.h
//  快医
//
//  Created by litianhao on 16/5/11.
//  Copyright © 2016年 bear. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface THChatModel : NSObject

@property (nonatomic,assign) BOOL isDoctor;
@property (nonatomic,copy) NSString *Textmessage;
@property (nonatomic,copy) NSString *imageName;
@property (nonatomic,copy) NSString *iconName;
@property (nonatomic,copy) NSString *time;

+ (instancetype)chatModelWithDict :(NSDictionary *)dict;
- (instancetype) initWithDict:(NSDictionary *)dict;

@end
