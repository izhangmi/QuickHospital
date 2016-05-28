//
//  THBookingDetailVC.m
//  快医
//
//  Created by litianhao on 16/5/11.
//  Copyright © 2016年 bear. All rights reserved.
//

#import "THBookingDetailVC.h"
#import "THBookDetailBackgroundView.h"
#import "THBookingDetailDisplayModel.h"
#import "THBookingDetailInfoModel.h"

#import "THChatVC.h"

@interface THBookingDetailVC ()

@property (nonatomic,strong) THBookingDetailDisplayModel *displayModel;
@property (nonatomic,weak) UIButton *dingweiBtn;
@property (nonatomic,weak) UIButton *chatBtn;

@end

@implementation THBookingDetailVC

- (void)loadView
{
    self.view = [[THBookDetailBackgroundView alloc] init];
    self.view.backgroundColor = [UIColor whiteColor];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.displayModel = [THBookingDetailDisplayModel bookingDetailDisplayModelWithDict:self.displayInfo];
    [self settingUserView];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.title = @"预约详情";
}

- (void)settingUserView
{
    THBookingDetailDisplayModel *model = self.displayModel ;
    THBookingDetailInfoModel *infoModel = model.bookInfo ;
    
    THBookDetailBackgroundView * backgroundView = (THBookDetailBackgroundView *)self.view ;
    
    CGFloat const margin = 20 ;
    CGFloat const iconLength = 60 ;
    
    UIImageView *iconV = [[UIImageView alloc] initWithFrame:CGRectMake(margin, margin, iconLength, iconLength)];
    iconV.layer.cornerRadius = iconV.width/2 ;
    iconV.image = [UIImage imageNamed: model.iconName];
    [self.view addSubview:iconV];
    
    
   UILabel *userLbl = [self addLblWithFrame:CGRectMake(iconV.width + iconV.x +margin , iconV.y, 50, iconV.height/2) text:model.userName];
    userLbl.textColor = [UIColor blackColor];
    
    [self addLblWithFrame:CGRectMake(userLbl.width + userLbl.x +13 , iconV.y, 50, iconV.height/2) text:model.diseaseName];
    
    [self addLblWithFrame:CGRectMake(userLbl.x, userLbl.y + userLbl.height, 200, iconV.height/2) text:[NSString stringWithFormat:@"就诊时间:  %@" ,model.visitTime]];
    
   UILabel *rightLbl = [self addLblWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width - margin - iconLength, margin, iconLength, iconLength) text:@"   申请\n   成功"];
    rightLbl.font = [UIFont systemFontOfSize:18];
    rightLbl.layer.cornerRadius = rightLbl.width/2 ;
    rightLbl.layer.masksToBounds = YES ;
    rightLbl.numberOfLines = 2 ;
    rightLbl.backgroundColor = COLOR(35, 189, 184, 1) ;
    rightLbl.textColor = [UIColor whiteColor];
    
  UILabel *titleLbl =  [self addLblWithFrame:CGRectMake(margin, iconV.height+margin + 10, 80, 40) text:@"预约医生:"];
    [backgroundView.indicatorLineY addObject:@(titleLbl.y + 5)];
    [backgroundView.indicatorLineY addObject:@(titleLbl.y + titleLbl.height - 5)];

    titleLbl.font = [UIFont systemFontOfSize:15];
    
    UILabel *doctorLbl = [self addLblWithFrame:CGRectMake(margin , titleLbl.y + titleLbl.height  , 50, userLbl.height) text:model.doctorName];
    doctorLbl.textColor = [UIColor blackColor];
    
      [self addLblWithFrame:CGRectMake(doctorLbl.width + doctorLbl.x +margin , doctorLbl.y, 100, doctorLbl.height) text:model.doctorPost];
    
   UILabel *hospitalLbl  =   [self addLblWithFrame:CGRectMake( margin ,doctorLbl.height + doctorLbl.y , 100, doctorLbl.height) text:model.hospital];
    
   self.chatBtn =  [self addBtnWithFrame:CGRectMake(rightLbl.x , doctorLbl.center.y,  rightLbl.width - 10, rightLbl.height - 10) backImg:[UIImage imageNamed:@"u46"] img:nil title:nil];
    [self.chatBtn addTarget:self action:@selector(chatBtnClk) forControlEvents:UIControlEventTouchUpInside];
    
   UILabel *titleLbl1 = [self addLblWithFrame:CGRectMake(margin , hospitalLbl.y + hospitalLbl.height + margin   , 100, titleLbl.height) text:@"预约须知:"];
    titleLbl1.font = [UIFont systemFontOfSize:15];
    [backgroundView.indicatorLineY addObject:@(titleLbl1.y +5)];
    [backgroundView.indicatorLineY addObject:@(titleLbl1.y + titleLbl1.height - 5)];
    
    NSArray *infoTitleArr = @[
                         @"坐诊医院:" , @"坐诊科室:" , @"挂号费用:" , @"取号地点:"
                         ];
    [infoTitleArr enumerateObjectsUsingBlock:^(NSString  *_Nonnull title, NSUInteger idx, BOOL * _Nonnull stop) {
         [self addLblWithFrame:CGRectMake(margin, titleLbl1.height + titleLbl1.y + 25* idx   , titleLbl1.width, 25)  text:title].textColor = [UIColor blackColor];
        
    }];
    
    NSArray *infoArr = @[
                         infoModel.homeHospital , infoModel.homeDepartment , infoModel.cost , infoModel.address
                         ];
    [infoArr enumerateObjectsUsingBlock:^(NSString * _Nonnull info, NSUInteger idx, BOOL * _Nonnull stop) {
        
        CGFloat heading = titleLbl1.width - 10 ;
        if (idx == infoArr.count - 1) {
          self.dingweiBtn =  [self addBtnWithFrame:CGRectMake(titleLbl1.width - 10 , titleLbl1.height + titleLbl1.y + 25*idx, 10, 25) backImg:nil img:[UIImage imageNamed:@"u86"] title:nil];
            
            heading += self.dingweiBtn.width ;
        }
      UILabel *tempLbl =  [self addLblWithFrame:CGRectMake( heading , titleLbl1.height + titleLbl1.y + 5 + 25* idx   , SCREEN_WIDTH - titleLbl1.width - margin, 25)  text:info];
        tempLbl.font = [UIFont systemFontOfSize:14];
        tempLbl.numberOfLines = 0 ;
        [tempLbl sizeToFit];
        if (infoArr.count - 1 == idx) {
            [backgroundView.indicatorLineY addObject:@(tempLbl.height + tempLbl.y + 5)];
        }
        
    }];
 
}

- (UIButton *)addBtnWithFrame:(CGRect)frame backImg:(UIImage *)backImg img:(UIImage *)img title:(NSString *)title
{
    UIButton *btn = [[UIButton alloc] initWithFrame:frame];
    
    if (backImg) {
        [btn setBackgroundImage:backImg forState:UIControlStateNormal];
    }
    if (img) {
        [btn setImage:img forState:UIControlStateNormal];
        btn.imageView.contentMode = UIViewContentModeScaleAspectFit;
    }
    if (title) {
        [btn setTitle:title forState:UIControlStateNormal];
    }
    [self.view addSubview:btn];
    return btn ;
}

- (UILabel *)addLblWithFrame:(CGRect)frame text:(NSString *)text
{
    UILabel *lbl = [[UILabel alloc] initWithFrame:frame];
    lbl.font = [UIFont systemFontOfSize:14];
    lbl.text =text ;
    lbl.textColor  = [UIColor grayColor];
    [self.view addSubview:lbl];
    return lbl ;
}


- (void)chatBtnClk
{
    THChatVC *chatV = [[THChatVC alloc] init];
    [self.navigationController pushViewController:chatV animated:YES];
}

- (NSDictionary *)displayInfo
{
    if (!_displayInfo) {
        doctorListModel *model = self.modelToDisplay ;
        _displayInfo = @{
                         @"iconName": @"user_default",
                          @"userName": model.patient,
                          @"doctorName": model.doctor,
                          @"doctorPost": model.detail,
                         @"hospital":   model.title ,
                        @"diseaseName": model.symptom,
                        @"visitTime": model.dateTime,
                         @"bookingInfo": @{
                                 @"homeHospital": @"北京回龙观医院",
                                 @"homeDepartment": @"2楼心血管内科",
                                 @"cost": @"6.00",
                                 @"address": @"北京协和医院住院部北京协和医院2楼挂号处"
                                 },
                         };
    }
    return _displayInfo ;
}

@end
