//
//  KKLeftMenuTABView.m
//  快医
//
//  Created by 柯平常 on 16/5/9.
//  Copyright © 2016年 bear. All rights reserved.
//

#import "KKLeftMenuTABView.h"
#import "TableHeaderView.h"
#import "UIColor+CC.h"
#import "CCNavigationController.h"

//已登录状态
//typedef enum{
//    kDidSelectCellChangeViewRegistrationView,   //预约挂号
//    kDidSelectCellChangeViewMYTAllayView,       //名医通
//    kDidSelectCellChangeViewCasehistoryView,    //病历管理
//    kDidSelectCellChangeViewMyCollectView,      //我的收藏
//    kDidSelectCellChangeViewPaymentdetailsView, //支付明细
//    kDidSelectCellChangeViewNull,               //空行
//
//    kDidSelectCellChangeViewSettingAndHelpView, //设置与帮助
//    kDidSelectCellChangeViewFeedbackView,       //意见反馈
//}
//kLoginInDidSelectCellChangeView;

//尚未登录状态
typedef enum {
    
    kLoginOutDidSelectCellChangeViewSettingAndHelpView, //设置与帮助
    kLoginOutDidSelectCellChangeViewFeedbackView,       //意见反馈
    
}kLoginOutDidSelectCellChangeView;


@interface KKLeftMenuTABView ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) NSArray *groupsArr;

@end

@implementation KKLeftMenuTABView

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style{
    
    if (self = [super initWithFrame:frame style:style]) {
        
        self.dataSource = self;
        self.delegate = self;
        
        self.tableFooterView = [[UIView alloc]init];
        
        self.showsVerticalScrollIndicator=NO;
        
    }
    return self;
}


#pragma mark - 数据源方法
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.groupsArr.count;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    NSDictionary *dict = self.groupsArr[section];
//    NSArray *arr = dict[@"Items"];
//    return arr.count;

    return  [dict[@"Items"] count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSDictionary *dict = self.groupsArr[indexPath.section];
    NSArray *arr = dict[@"Items"];
    NSDictionary *dictItem = arr[indexPath.row];
    
    
    static NSString *ID = @"leftTVCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID];
    }
    
    NSString *classStr = dictItem[@"AccessoryType"];
    Class className = NSClassFromString(classStr);
    id obj = [[className alloc]init];
    
    if ([obj isKindOfClass:[UIImageView class]]) {
        
        UIImageView *imgView = (UIImageView *)obj;
        
        imgView.image = [UIImage imageNamed:dictItem[@"AccessoryImgName"]];
        [imgView sizeToFit];
        cell.accessoryView = imgView;
        
    }else if([obj isKindOfClass:[UISwitch class]]){
        
        UISwitch *switcher = (UISwitch *)obj;
        cell.accessoryView = switcher;
        
    }
    
    if ([dictItem[@"Subtitle"] length]) {
        cell.detailTextLabel.text = dictItem[@"Subtitle"];
    }
    
    cell.textLabel.text = dictItem[@"Title"];
    cell.textLabel.numberOfLines = 0;

    
    return cell;
}

#pragma mark - 行高
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (5 == indexPath.row) {
        return 80;
    }
    return 55;
}

#pragma mark -
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //取消cell选中效果
    [self deselectRowAtIndexPath:indexPath animated:YES];
    
    if (5 == indexPath.row) {
        return;
    }
    
    NSDictionary *dict = self.groupsArr[indexPath.section];
    NSArray *arr = dict[@"Items"];
    NSDictionary *dictItem = arr[indexPath.row];
    
    
    //执行selRow[@"HMChect"]对应的方法
    NSString *selName = dictItem[@"Chect"];
    SEL founc = NSSelectorFromString(selName);
    if (dictItem[@"Chect"]) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
        [self performSelector:founc];
#pragma clang diagnostic pop
    }
    
    //MARK: 如果不是第五行 就发通知
//    [[NSNotificationCenter defaultCenter]postNotificationName:@"DidSelectCellChangeView" object:@(indexPath.row)];


    NSString *classStr=dictItem[@"TargetVc"];

    Class className= NSClassFromString(classStr);
    
    if (dictItem[@"TargetVc"]) {
    
        UIViewController *vC=[className new];
        [[NSNotificationCenter defaultCenter]postNotificationName:@"pushVc" object:nil userInfo:@{@"vC":vC}];
    }


}


#pragma mark - 呼叫客服
-(void)callCustomerService{
    
    UIApplication *app = [UIApplication sharedApplication];
    NSURL *url = [NSURL URLWithString:@"tel://10086"];
    [app openURL:url];
}

#pragma mark - 检查更新
-(void)chectUpdate{
    UIAlertController *alertVc = [UIAlertController alertControllerWithTitle:@"提示" message:@"已经是最新版本" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *sure = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
    [alertVc addAction:sure];

    if (self.chectUpdateBlock) {
        self.chectUpdateBlock(alertVc);
    }
}


-(NSArray *)groupsArr{

    NSString *path =  [[NSBundle mainBundle]pathForResource:self.settingPlistName ofType:@"plist"];

    NSLog(@"%@", path);

    
    if (_groupsArr == nil) {
        
        if (_settingPlistName) {
            
            _groupsArr = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle]pathForResource:self.settingPlistName ofType:@"plist"]];
        }

        NSLog(@"123");
    }
    return _groupsArr;
}


-(void)setSettingPlistName:(NSString *)settingPlistName{
    _settingPlistName=settingPlistName;

    
    HMLog(@"🐻🐻🐻🐻%@",settingPlistName);
    [self reloadData];
}

@end
