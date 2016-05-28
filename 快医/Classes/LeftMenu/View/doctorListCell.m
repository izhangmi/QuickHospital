//
//  doctorListCell.m
//  Doctor List
//
//  Created by 张少霞 on 16/5/10.
//  Copyright © 2016年 zsx. All rights reserved.
//

#import "doctorListCell.h"


#define Kmargin 10

#define KWIDTH [UIScreen mainScreen].bounds.size.width
#define KHeight [UIScreen mainScreen].bounds.size.height

@interface doctorListCell ()
//创建UI控件

@property (nonatomic ,strong)UILabel *titleLable;

@property (nonatomic ,strong)UILabel *detailLable;

@property (nonatomic ,strong)UILabel *dateTimeLable;

@property (nonatomic ,strong)UILabel *patientLable;

@property (nonatomic ,strong)UILabel *doctorLable;

@property (nonatomic ,strong)UILabel *symptomLable;

//添加中间的线
@property (nonatomic ,strong)UIView *placeView;

//右侧图片
@property (nonatomic ,strong)UIImageView *iconView;



@end

@implementation doctorListCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    

    
    self.backgroundView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"cellBg"]];
    
    
    
    //初始化UI控件  添加到cell
    
    self.titleLable = [[UILabel alloc]init];
    self.detailLable = [[UILabel alloc]init];
    self.dateTimeLable = [[UILabel alloc]init];
    self.patientLable = [[UILabel alloc]init];
    self.doctorLable = [[UILabel alloc]init];
    self.symptomLable = [[UILabel alloc]init];
    
    self.placeView = [[UIView alloc]initWithFrame:CGRectMake(10,38, self.bounds.size.width, 1.5)];
    self.placeView.backgroundColor = [UIColor colorWithRed:24/255.0 green:193/255.0 blue:255/255.0 alpha:1];
    self.placeView.alpha = 0.5;
    
    
    CGFloat iconViewW = 35;
    CGFloat iconViewH = iconViewW;
    
    self.iconView = [[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.placeView.frame) ,22 , iconViewW , iconViewH)];
//    NSLog(@"-------------%zd",self.width);
    
    
    self.iconView.image = [UIImage imageNamed:@"Yes"];
    
                           
    
    self.iconView.layer.cornerRadius= 15;
    self.iconView.clipsToBounds=YES;
    
    
    
    [self.contentView addSubview:self.titleLable];
    [self.contentView addSubview:self.detailLable];
    [self.contentView addSubview:self.dateTimeLable];
    [self.contentView addSubview:self.patientLable];
    [self.contentView addSubview:self.doctorLable];
    [self.contentView addSubview:self.symptomLable];
    
    
    [self.contentView addSubview:self.placeView];
    [self.contentView addSubview:self.iconView];
    

    
    return self;
    
}


-(void)setModel:(doctorListModel *)model{
    _model = model;
    
    
    self.patientLable.text = model.patient;
    self.titleLable.font = [UIFont systemFontOfSize:18];

    
    self.symptomLable.text = model.symptom;
    self.symptomLable.font = [UIFont systemFontOfSize:13];
    self.symptomLable.textColor = [UIColor grayColor];

    
    self.dateTimeLable.text = [NSString stringWithFormat:@" %@ 上午",model.dateTime];
    self.dateTimeLable.font = [UIFont systemFontOfSize:13];
    self.dateTimeLable.textColor = [UIColor grayColor];
    
    
    self.doctorLable.text = model.doctor;
    self.doctorLable.font = [UIFont systemFontOfSize:18];

  
    self.detailLable.text = model.detail;
    self.detailLable.font = [UIFont systemFontOfSize:13];
    self.detailLable.textColor = [UIColor grayColor];

    
    self.titleLable.text = model.title;
    self.titleLable.font = [UIFont systemFontOfSize:13];
    self.detailLable.textColor = [UIColor grayColor];


}


//布局
-(void)layoutSubviews{
    [super layoutSubviews];
    
// patient
    CGFloat patientW = 100;
    CGFloat patientH = 20;
    self.patientLable.frame = CGRectMake(Kmargin, Kmargin, patientW, patientH);
    
//    symptom
    CGFloat symptomX = 120;
    CGFloat symptomY =  10;
    
    CGFloat symptomW = 100;
    
    CGFloat syptomH = 20;
    self.symptomLable.frame = CGRectMake(symptomX ,symptomY, symptomW, syptomH);
    
//    datetime
    
    CGFloat datetimeY = Kmargin;
    CGFloat datetimeH = syptomH;
    CGFloat datetimeW = 150 ;
    CGFloat datetimeX = CGRectGetMaxX(self.symptomLable.frame) +Kmargin;
    
    self.dateTimeLable.frame = CGRectMake(datetimeX, datetimeY, datetimeW, datetimeH);
    
//   doctor
    CGFloat doctorx = Kmargin;
    CGFloat doctorY = CGRectGetMaxY(self.patientLable.frame) + Kmargin;
    CGFloat doctorW = 100;
    CGFloat doctorH = 20;
    
    
    
    self.doctorLable.frame = CGRectMake(doctorx, doctorY, doctorW, doctorH);
    
//   detaile  level
    
    
    self.detailLable.frame = CGRectMake(symptomX, doctorY, symptomW, syptomH);
    
   
    
//    title hospital
    self.titleLable.frame = CGRectMake(datetimeX, doctorY, datetimeW, datetimeH);
    
   

}









@end
