//
//  THLoginVC.m
//  快医
//
//  Created by litianhao on 16/5/9.
//  Copyright © 2016年 bear. All rights reserved.
//

#import "THLoginVC.h"

#import <TPKeyboardAvoidingScrollView.h>
#import "THExtensionForLoginSence.h"
#import "UIView+THEx.h"
#import "THRegisterVC.h"
#import "HyLoglnButton.h"
#import "HyTransitions.h"
#import "CCHttpTool.h"
#import "User.h"
#import "UserService.h"
#import "NSString+CC.h"

@interface THLoginVC ()<UINavigationControllerDelegate>



@end

@implementation THLoginVC

- (void)loadView
{
    self.view = [[TPKeyboardAvoidingScrollView alloc] init];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self settingWidgetsInEveryRow];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self settingNaviBar];
}

- (void)settingNaviBar
{
    self.title = @"用户登录";
//    self.navigationController.navigationBar.tintColor = [UIColor blueColor];
//    self.navigationController.navigationBar.titleTextAttributes = @{
//                                                                    NSForegroundColorAttributeName : [UIColor colorWithWhite:0.3 alpha:1] ,
//                                                                    NSFontAttributeName : [UIFont fontWithName:@"Helvetica-Bold" size:20]
//                                                                    };
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"快速注册" style:UIBarButtonItemStylePlain target:self action:@selector(rightBarButtonItemClk)];
//    
//    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"u12"] style:UIBarButtonItemStylePlain target:self action:@selector(leftBarButtonItemClk)];
//    self.navigationItem.leftBarButtonItem.imageInsets = UIEdgeInsetsMake(8, 0, 8, 16);
}

- (void)settingWidgetsInEveryRow
{
    CGFloat const verMargin = 40 ;
    CGFloat const horMargin = 10 ;
    CGFloat const rowHeight = 38 ;
    
    NSArray *inputTextFieldArr = @[
                                   @{@"请输入用户名" : @"u16"},
                                   @{@"请输入用户证件号码" : @"u20"},
                                   @{@"请输入手机号码"  : @"u24"},
                                   @{@"请输入验证码"  : @"u28"},
                                   ];
    
   [inputTextFieldArr enumerateObjectsUsingBlock:^(NSDictionary * _Nonnull dict, NSUInteger idx, BOOL * _Nonnull stop) {
        NSString *key =   dict.allKeys.lastObject;
        CGFloat textFieldWidth = SCREEN_WIDTH - 2*verMargin ;
        CGFloat textFieldY = horMargin + (horMargin + rowHeight)*idx ;
                    if (idx == inputTextFieldArr.count - 1)
                    {
                        textFieldWidth *= 0.7 ;
                     [self.view addSubview:[UIButton th_ButtonWithTitle:@"获取验证码" frame:CGRectMake(
                                                                     verMargin + textFieldWidth + 6,
                                                                     textFieldY,
                                                                     SCREEN_WIDTH - 2*verMargin - textFieldWidth - 6,
                                                                     rowHeight
                                                                      )]];
                    }
       
       [self.view addSubview: [UIFloatLabelTextField th_TextFieldWith:key leftIconName:dict[key] frame:CGRectMake(
                                                                                             verMargin,
                                                                                             textFieldY,
                                                                                             textFieldWidth,
                                                                                             rowHeight)]];
                    }];
    
    
    [UILabel th_LabelWithTitle:@"请使用114平台实名制用户登录" frame:CGRectMake( verMargin,
                                                horMargin + (horMargin + rowHeight)*inputTextFieldArr.count,
                                                 SCREEN_WIDTH - 2*verMargin,
                                                                rowHeight) displayOnView:self.view];
    HyLoglnButton *loginBtn = [HyLoglnButton th_ButtonWithTitle:@"登      录" frame:CGRectMake( verMargin,
                                                                                             horMargin + (horMargin + rowHeight)*(inputTextFieldArr.count + 1),
                                                                                             SCREEN_WIDTH - 2*verMargin,
                                                                                             rowHeight)];
    loginBtn.titleLabel.font = [UIFont systemFontOfSize:18];
    [loginBtn addTarget:self action:@selector(loginBtnClk:) forControlEvents:UIControlEventTouchUpInside];
    [loginBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];

    loginBtn.backgroundColor=COLOR(35, 189, 184, 1);

    [self.view addSubview:loginBtn];
}

- (void)loginBtnClk:(HyLoglnButton *)sender
{
    HMLog(@"此处添加登录的业务逻辑");

//    UIImage *image = [UIImage imageNamed:@"toux"];
//    [[NSNotificationCenter defaultCenter]postNotificationName:@"changeUserIcon" object:image];
//    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [sender ExitAnimationCompletion:^{
            self.navigationController.delegate = self ;

            NSUserDefaults *userDefaults=[NSUserDefaults standardUserDefaults];
            [userDefaults setBool:YES forKey:@"isLogin"];
            [userDefaults synchronize];


            UserService *userService=[UserService shareUserService];
            userService.isLogin =YES;

            NSString *urlString =[NSString stringWithFormat:@"%@%@",APIURL,@"carelinkQuickLogin.json.php"];

            NSDictionary *params=@{@"login_token":@"985c96ce43bb5ef69de3e1ad8afaa83f"};

            [CCHttpTool POST:urlString parameters:params success:^(id responseObject) {

                User *user=[User yy_modelWithJSON:responseObject[@"data"]];
                
                dispatch_async(dispatch_get_main_queue(), ^{

                    [[NSNotificationCenter defaultCenter]postNotificationName:LOGIN_STATUS_CHANGE object:nil];

                    [self.navigationController popViewControllerAnimated:YES];
                });


            [NSKeyedArchiver archiveRootObject:user toFile:[NSString getDocumentPathWithFileName:@"user.data"]];


            } failure:^(NSError *error) {


            }];



        }];

    });
 
}

- (void)leftBarButtonItemClk
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)rightBarButtonItemClk
{
    [self.navigationController pushViewController:[THRegisterVC new] animated:YES];
}

#pragma mark - 转场相关


- (nullable id <UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                            animationControllerForOperation:(UINavigationControllerOperation)operation
                                                         fromViewController:(UIViewController *)fromVC
                                                           toViewController:(UIViewController *)toVC
{
        return [[HyTransitions alloc]initWithTransitionDuration:0.5f StartingAlpha:0.5f isBOOL:YES];
}

- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    navigationController.delegate = nil ;
}

-(NSString *)getFilePath{
    NSString *docPath=[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString *filePath=[docPath stringByAppendingPathComponent:@"user.data"];
    NSLog(@"-------%@",filePath);
    return filePath;
}
@end
