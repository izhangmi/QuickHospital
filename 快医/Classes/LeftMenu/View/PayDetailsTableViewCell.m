//
//  PayDetailsTableViewCell.m
//  支付明细
//
//  Created by 朱宁MacPro on 16/5/10.
//  Copyright © 2016年 朱宁MacPro. All rights reserved.
//

#import "PayDetailsTableViewCell.h"
#define margin 10
#define KWidth [UIScreen mainScreen].bounds.size.width
#define KHeight [UIScreen mainScreen].bounds.size.height


@interface PayDetailsTableViewCell ()


@property(nonatomic,strong)UILabel *titleLable;

@property(nonatomic,strong)UILabel *dataLable;

@property(nonatomic,strong)UILabel *moneyLable;

@property(nonatomic,strong)UILabel *payLable;





@end



@implementation PayDetailsTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    
    
    if ( self) {
        
        //      初始化控件
        self.titleLable = [[UILabel alloc]init];
        self.payLable = [[UILabel alloc]init];
        
        self.dataLable = [[UILabel alloc]init];
        
        self.moneyLable = [[UILabel alloc]init];
        
        
        [self.contentView addSubview:self.titleLable];
        [self.contentView addSubview:self.payLable];
        [self.contentView addSubview:self.moneyLable];
        [self.contentView addSubview:self.dataLable];
        
    }
    
    
    
    return  self;
    
    
    
    
    
}
//赋值
-(void)setModel:(PayDetailsModel *)model{

    _model = model;
    self.titleLable.text = model.title;
    
    self.moneyLable.text = model.money;
    self.moneyLable.textAlignment = NSTextAlignmentCenter;
    self.moneyLable.textColor = [UIColor redColor];

    self.dataLable.text =model.payData;
    self.dataLable.font = [UIFont systemFontOfSize:13];
    self.dataLable.textColor = [UIColor grayColor];
    
    self.payLable.textColor = [UIColor blueColor];
    self.payLable.font = [UIFont systemFontOfSize:13];
    self.payLable.alpha = 0.6;
    [self.payLable sizeToFit];
    self.payLable.text = model.payThing;

}

-(void)layoutSubviews{
    [super layoutSubviews];

    CGFloat titleX = margin;
    CGFloat titleY = margin;
    CGFloat titleW = KWidth - 3 * margin - 100 ;
    CGFloat titleH = 25;
    self.titleLable.frame = CGRectMake(titleX, titleY, titleW, titleH);
    
    CGFloat payLableX = KWidth -titleW ;
    CGFloat paylableY = margin;
    CGFloat payLableW = KWidth - titleW - 3*margin;
    CGFloat payLableH = 25;
    self.payLable.frame = CGRectMake(payLableX, paylableY, payLableW, payLableH);
    
    
    
    
    CGFloat dataLableX = margin;
    CGFloat dataLabelY = CGRectGetMaxY(self.titleLable.frame) +margin;
    CGFloat dataLableW = KWidth- 3*margin;
    CGFloat dataLableH = 25;
    self.dataLable.frame = CGRectMake(dataLableX, dataLabelY, dataLableW, dataLableH);
    
    
    CGFloat moneyLableX = 290;
    CGFloat moneyLableY = 2 * margin;
    CGFloat moneyLableW = 100 ;
    CGFloat moneyLableH = 30;
    self.moneyLable.frame = CGRectMake(moneyLableX, moneyLableY, moneyLableW, moneyLableH);
    

}








@end
