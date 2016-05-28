//
//  HospitalHeaderView.m
//  快医
//
//  Created by 付凯琪 on 16/5/9.
//  Copyright © 2016年 bear. All rights reserved.
//

#import "HospitalHeaderView.h"
#import "HospitalBtn.h"

@interface HospitalHeaderView ()

@property (nonatomic, weak )HospitalBtn *hospitalRankBtn;

@property (nonatomic, weak) HospitalBtn *hospitalAreaBtn;

@property (nonatomic, weak) UILabel *currentChoiceLabel;


//按钮模型数据
@property (nonatomic, strong) NSArray *hospitalRank;
@property (nonatomic, strong) NSArray *hospitalArea;


@end
@implementation HospitalHeaderView

- (instancetype)initWithFrame:(CGRect)frame{

    if (self = [super initWithFrame:frame]) {
        
        
        //医院等级数据
        NSArray *hospitalRank = @[@"一级甲等",@"二级甲等",@"三级甲等",@"四级甲等",@"一级乙等",@"二级乙等",@"三级乙等",@"四级五等",@"满级"];
        //医院位置
        NSArray *hospitalArea = @[@"小营新村",@"西大望路",@"建材城西路",@"中国大陆",@"安哥拉共和国",@"平壤",@"我家门口",@"国贸",@"硫磺岛"];
        _hospitalRank = hospitalRank;
        _hospitalArea = hospitalArea;
        
        
        
        self.backgroundColor =  [UIColor whiteColor];
        
        
        //分割线
        UIView *grayLine = [[UIView alloc] initWithFrame:CGRectMake(0, 118, [UIScreen mainScreen].bounds.size.width, 1)];
        UIView *grayLine2 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 58)];
        
        UIView *middleLine = [[UIView alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width / 2 - 1, 70, 2, 40)];
        middleLine.backgroundColor = [UIColor colorWithRed:220/255.0 green:220/255.0 blue:220/255.0 alpha:1];
        grayLine.backgroundColor = [UIColor colorWithRed:220/255.0 green:220/255.0 blue:220/255.0 alpha:1];
        grayLine2.backgroundColor = [UIColor colorWithWhite:0.831 alpha:1.000];
        
        
        [self addSubview:grayLine2];
        [self addSubview:middleLine];
        [self addSubview:grayLine];
        
        //医院等级按钮
        HospitalBtn *hospitalRankBtn = [[HospitalBtn alloc]initWithFrame:CGRectMake(0, 60, [UIScreen mainScreen].bounds.size.width / 2, 60)];
        [hospitalRankBtn setTitle:@"医院等级" forState:UIControlStateNormal];
 
        _hospitalRankBtn = hospitalRankBtn;
        [hospitalRankBtn addTarget:self action:@selector(hospitalRankBtnClick) forControlEvents:UIControlEventTouchUpInside];
        
        
        
        //医院地区按钮
        HospitalBtn *hospitalAreaBtn = [[HospitalBtn alloc]initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width / 2, 60, [UIScreen mainScreen].bounds.size.width / 2, 60)];
        [hospitalAreaBtn setTitle:@"医院地区" forState:UIControlStateNormal];
        _hospitalAreaBtn = hospitalAreaBtn;
        [hospitalAreaBtn addTarget:self action:@selector(hospitalAreaBtnClick) forControlEvents:UIControlEventTouchUpInside];
        
        
        //当前选择
        UILabel *currentChoiceLabel = [[UILabel alloc] init];
        currentChoiceLabel.textColor = [UIColor whiteColor];
        _currentChoiceLabel = currentChoiceLabel;
        _currentChoiceLabel.text = @"当前选择 :";
        _currentChoiceLabel.frame = CGRectMake(50, 0, [UIScreen mainScreen].bounds.size.width, 60);
        [_currentChoiceLabel setFont:[UIFont systemFontOfSize:20]];
        
        
        
        [self addSubview:_currentChoiceLabel];
        [self addSubview:_hospitalRankBtn];
        [self addSubview:_hospitalAreaBtn];

        
    }
    return self;
}
//等级
- (void)hospitalRankBtnClick{

    self.tugBtnClick(self.hospitalRank);
    
}
//地区
- (void)hospitalAreaBtnClick{

    self.tugBtnClick(self.hospitalArea);
}

- (void)setChoiceStr:(NSString *)ChoiceStr{

    _ChoiceStr = ChoiceStr;
    _currentChoiceLabel.text = [NSString stringWithFormat:@"当前选择 : %@",ChoiceStr];

}


@end
