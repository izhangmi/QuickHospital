//
//  UserService.h
//  快医
//
//  Created by bear on 16/5/11.
//  Copyright © 2016年 bear. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"

@interface UserService : NSObject
@property (nonatomic, strong) User *user;

@property (nonatomic,assign)BOOL isLogin;
+(UserService *) shareUserService;
-(BOOL)LoginWithUserName:(NSString *)userName password:(NSString *)password;
@end
