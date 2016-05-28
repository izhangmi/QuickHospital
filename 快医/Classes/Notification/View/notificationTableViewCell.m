//
//  notificationTableViewCell.m
//  通知
//
//  Created by 张少霞 on 16/5/9.
//  Copyright © 2016年 zsx. All rights reserved.
//

#import "notificationTableViewCell.h"
#define Kmargin 10
#define kWIDTH [UIScreen mainScreen].bounds.size.width

@interface notificationTableViewCell ()
//创建控件属性

@property (nonatomic ,strong)UIImageView *iconView;

@property (nonatomic ,strong)UILabel *titleLable;

@property (nonatomic ,strong)UILabel *detailLable;


@end

@implementation notificationTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{

    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
//初始化UI控件  添加到cell


    self.backgroundView=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"cellBg"]];
 
    self.iconView = [[UIImageView alloc]init];
    self.titleLable = [[UILabel alloc]init];
    self.detailLable = [[UILabel alloc]init];
    
    
    [self.contentView addSubview:self.iconView];
    [self.contentView addSubview:self.titleLable];
    [self.contentView addSubview:self.detailLable];


        return self;
    
}

//添加数据
-(void)setModel:(notificationModel *)model{

    _model = model;
    
    self.titleLable.text = model.title;
    self.titleLable.font = [UIFont systemFontOfSize:18];

    
    self.detailLable.text = model.detail;
    self.detailLable.font = [UIFont systemFontOfSize:14];
    self.detailLable.numberOfLines = 0;
    
    self.iconView.image = [UIImage imageNamed:model.iconName];
  
}


//布局
-(void)layoutSubviews{
    [super layoutSubviews];
    
    
    CGFloat imageW = 24;
    
    self.iconView.frame = CGRectMake(Kmargin,Kmargin ,imageW, imageW);
    
    self.titleLable.frame = CGRectMake(2*Kmargin + imageW, Kmargin, kWIDTH - (3*Kmargin + imageW), 20);
   
    
    
    CGFloat iconViewMaxY = CGRectGetMaxY(self.iconView.frame);
    
    self.detailLable.frame = CGRectMake(Kmargin, iconViewMaxY + Kmargin, kWIDTH - 2*Kmargin, 40);
    



}
@end
