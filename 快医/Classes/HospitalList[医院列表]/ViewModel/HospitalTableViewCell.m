//
//  HospitalTableViewCell.m
//  快医
//
//  Created by 付凯琪 on 16/5/9.
//  Copyright © 2016年 bear. All rights reserved.
//

#import "HospitalTableViewCell.h"

@interface HospitalTableViewCell ()

@property (nonatomic, strong) UIImageView *iconImageView;

@property (nonatomic, strong) UILabel *nameLabel;

@property (nonatomic, strong) UILabel *rankLabel;

@property (nonatomic, strong) UIButton *areaBtn;

@property (nonatomic, strong) UIImageView *arrowImageView;

@end

@implementation HospitalTableViewCell
+ (instancetype)hospitalCellWithTableView:(UITableView *)tableView{
    
    HospitalTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kHospitalTableViewCell];
    if (!cell) {
        cell = [[HospitalTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:kHospitalTableViewCell];
    }
    
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{

    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        //分割线
        UIView *grayLine = [[UIView alloc] initWithFrame:CGRectMake(0, 99, [UIScreen mainScreen].bounds.size.width, 1)];
        grayLine.backgroundColor = [UIColor colorWithRed:220/255.0 green:220/255.0 blue:220/255.0 alpha:1];
        
        
        _iconImageView = [[UIImageView alloc] init];
        _nameLabel = [[UILabel alloc] init];
        _rankLabel = [[UILabel alloc] init];
        _rankLabel.textColor = [UIColor grayColor];
        _rankLabel.font = [UIFont systemFontOfSize:14];
        
        _areaBtn = [[UIButton alloc] init];
        [_areaBtn setImage:[UIImage imageNamed:@"illness_rb_img_sel.png"] forState:UIControlStateNormal];
        [_areaBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
#pragma mark - 设置button不能点击,否则会干扰cell的点击
        _areaBtn.enabled = NO;
        
        
        _arrowImageView = [[UIImageView alloc] init];
        _arrowImageView.image = [UIImage imageNamed:@"icon"];
        [_arrowImageView sizeToFit];
        

        
        [self addSubview:grayLine];
        [self addSubview:_iconImageView];
        [self addSubview:_nameLabel];
        [self addSubview:_rankLabel];
        [self addSubview:_areaBtn];
        [self addSubview:_arrowImageView];
    
    }
    return self;
}

//获取文字尺寸
//- (CGFloat)getWidthWithText:(NSString *)text{
//
//    UILabel *label = [[UILabel alloc] init];
//    label.text = text;
//    [label sizeToFit];
//
//    UIImageView *imgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"illness_rb_img_sel.png"]];
//    [imgView sizeToFit];
//    
//    return (label.width + imgView.width);
//}

- (void)setData:(HospitalData *)data{

    _data = data;
    
    _iconImageView.image = [UIImage imageNamed:data.icon];
    _nameLabel.text = data.name;
    _rankLabel.text = data.rank;
    [_areaBtn setTitle:data.area forState:UIControlStateNormal];
    CGFloat margin = 8;
    CGFloat iconW = 80;
    _iconImageView.frame = CGRectMake(margin, margin, iconW, iconW);
    _nameLabel.frame = CGRectMake(_iconImageView.width + 2 * margin, margin, ([UIScreen mainScreen].bounds.size.width - (margin * 3) - _iconImageView.width) / 3 * 1.5, _iconImageView.height / 2);
    _rankLabel.frame = CGRectMake(CGRectGetMaxX(_nameLabel.frame) + margin, margin, ([UIScreen mainScreen].bounds.size.width - (margin * 3) - _iconImageView.width) / 3, _iconImageView.height / 2);
    _areaBtn.frame = CGRectMake(_iconImageView.width + 2 * margin, margin + _iconImageView.height / 2, [UIScreen mainScreen].bounds.size.width - (margin * 3) - _iconImageView.width, _iconImageView.height / 2);
    
    _arrowImageView.frame = CGRectMake([UIScreen mainScreen].bounds.size.width - 3 * margin - _arrowImageView.width, (100 - _arrowImageView.height) / 2, _arrowImageView.width, _arrowImageView.height);
    _areaBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;

}

- (void)layoutSubviews{

    [super layoutSubviews];
    
//
}
@end
