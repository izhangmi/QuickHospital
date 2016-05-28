//
//  UserService.m
//  快医
//
//  Created by bear on 16/5/11.
//  Copyright © 2016年 bear. All rights reserved.
//

#import "UserService.h"
#import "CCHttpTool.h"

@interface UserService ()

@end

@implementation UserService



+(UserService *)shareUserService{


    static UserService *userService;
    static dispatch_once_t onceToken;


    dispatch_once(&onceToken, ^{

       userService =[UserService new];

    });

    return userService;
}




-(BOOL)LoginWithUserName:(NSString *)userName password:(NSString *)password{



    NSUserDefaults *userDefaults=[NSUserDefaults standardUserDefaults];
    [userDefaults setBool:YES forKey:@"isLogin"];

    [userDefaults synchronize];

    NSString *urlString =[NSString stringWithFormat:@"%@%@",APIURL,@"carelinkQuickLogin.json.php"];

    NSDictionary *params=@{@"login_token":@"985c96ce43bb5ef69de3e1ad8afaa83f"};


    [CCHttpTool POST:urlString parameters:params success:^(id responseObject) {


        //记录登记成功标志
        NSUserDefaults *userDefaults=[NSUserDefaults standardUserDefaults];
        [userDefaults setBool:YES forKey:@"isLogin"];
        [userDefaults synchronize];

        //数据存储
        User *user=[User yy_modelWithJSON:responseObject[@"data"]];
        [NSKeyedArchiver archiveRootObject:user toFile:[self getFilePath]];
        self.user=user;

        self.isLogin=YES;

    } failure:^(NSError *error) {

        self.isLogin=NO;

    }];


    return self.isLogin;


}



-(NSString *)getFilePath{
    NSString *docPath=[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString *filePath=[docPath stringByAppendingPathComponent:@"user.data"];
    NSLog(@"-------%@",filePath);
    return filePath;
}

@end
