//
//  DoctorCell.m
//  Doctor
//
//  Created by 张少霞 on 16/5/11.
//  Copyright © 2016年 zsx. All rights reserved.
//

#import "DoctorCell.h"
#define Kmargin 10

#define KWIDTH [UIScreen mainScreen].bounds.size.width

@interface DoctorCell ()

//创建UI控件

@property (nonatomic ,strong)UILabel *titleLable;

@property (nonatomic ,strong)UILabel *detailLable;

@property (nonatomic ,strong)UILabel *dateTimeLable;


@end

@implementation DoctorCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    
    
    self.backgroundView=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"cellBg"]];
    
    
    //初始化UI控件  添加到cell
    
    self.titleLable = [[UILabel alloc]init];
    self.detailLable = [[UILabel alloc]init];
    self.dateTimeLable = [[UILabel alloc]init];
    
    
    
    [self.contentView addSubview:self.titleLable];
    [self.contentView addSubview:self.detailLable];
    [self.contentView addSubview:self.dateTimeLable];
    
    
    
    return self;
    
}

-(void)setModel:(DoctorModel *)model{
    _model = model;
    
    self.titleLable.text = model.title;
    //    设置而字体大小
    self.titleLable.font = [UIFont systemFontOfSize:18];
    
    self.detailLable.text = model.level;
    self.detailLable.font = [UIFont systemFontOfSize:13];
    self.detailLable.textColor = [UIColor grayColor];
    
    self.dateTimeLable.text = [NSString stringWithFormat:@"就诊时间: %@ 上午",model.dateTime];
    self.dateTimeLable.font = [UIFont systemFontOfSize:13];
    self.dateTimeLable.textColor = [UIColor grayColor];
    
    
    
}


-(void)layoutSubviews{
    [super layoutSubviews];
    
    //title
    CGFloat titleW = KWIDTH -2*Kmargin;
    CGFloat titleH = 20;
    self.titleLable.frame = CGRectMake(Kmargin, Kmargin, titleW, titleH);
    
    //    detail
    
    CGFloat detailY = CGRectGetMaxY(self.titleLable.frame) + Kmargin;
    
    CGFloat detailW = (KWIDTH - 3*Kmargin)*0.5;
    
    CGFloat detailH = Kmargin;
    self.detailLable.frame = CGRectMake(Kmargin, detailY, detailW, detailH);
    
    //    datetime
    
    CGFloat datetimeY = detailY;
    CGFloat datetimeH = detailH;
    CGFloat datetimeW = (KWIDTH - 3*Kmargin)*0.5 ;
    CGFloat datetimeX = KWIDTH - Kmargin - datetimeW;
    
    self.dateTimeLable.frame = CGRectMake(datetimeX, datetimeY, datetimeW, datetimeH);
    
    
    
    
    
    
}


@end
