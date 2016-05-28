//
//  SubjectHearView.m
//  快医
//
//  Created by 付凯琪 on 16/5/11.
//  Copyright © 2016年 bear. All rights reserved.
//

#import "SubjectHeaderView.h"

@interface SubjectHeaderView ()

@property (nonatomic, strong) UILabel *nameLabel;

@property (nonatomic, strong) UILabel *rankLabel;

@property (nonatomic, strong) UIButton *areaBtn;

@property (nonatomic, strong) UIButton *detailBtn;

@end
@implementation SubjectHeaderView

- (instancetype)initWithFrame:(CGRect)frame{

    if (self = [super initWithFrame:frame]) {

        self.backgroundColor = [UIColor colorWithRed:220/255.0 green:220/255.0 blue:220/255.0 alpha:1];
        _nameLabel = [[UILabel alloc] init];
        _nameLabel.textColor = [UIColor colorWithRed:80/255.0 green:80/255.0 blue:80/255.0 alpha:1];
        _rankLabel = [[UILabel alloc] init];
        _rankLabel.textColor = [UIColor grayColor];
        _rankLabel.font = [UIFont systemFontOfSize:14];
        
        _areaBtn = [[UIButton alloc] init];
        [_areaBtn setImage:[UIImage imageNamed:@"illness_rb_img_sel.png"] forState:UIControlStateNormal];
        [_areaBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        
        _detailBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        [_detailBtn setTitle:@"查看医院详情" forState:UIControlStateNormal];
        

        [self addSubview:_nameLabel];
        [self addSubview:_rankLabel];
        [self addSubview:_areaBtn];
        [self addSubview:_detailBtn];

    }
    return self;
}

- (void)setData:(HospitalData *)data{
    
    _data = data;
    

    _nameLabel.text = data.name;
    _rankLabel.text = data.rank;
    [_areaBtn setTitle:data.area forState:UIControlStateNormal];
    CGFloat margin = 8;
    
    _nameLabel.frame = CGRectMake(margin, margin, ([UIScreen mainScreen].bounds.size.width - (margin * 2)) / 3, self.height / 2);
    _rankLabel.frame = CGRectMake(CGRectGetMaxX(_nameLabel.frame) + margin, margin, ([UIScreen mainScreen].bounds.size.width - (margin * 2)) / 3, self.height / 2);
    _areaBtn.frame = CGRectMake(margin, margin + self.height / 2, [UIScreen mainScreen].bounds.size.width - (margin * 2), self.height / 2);
    
    
//    [_detailBtn sizeToFit];
    _detailBtn.frame = CGRectMake(([UIScreen mainScreen].bounds.size.width - (margin * 2)) / 3 * 2, margin, ([UIScreen mainScreen].bounds.size.width - (margin * 2)) / 3, self.height / 2);
    

    _areaBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    _detailBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight | UIControlContentVerticalAlignmentBottom;

    
}
@end
