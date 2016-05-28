//
//  THBuyServiceView.m
//  快医
//
//  Created by litianhao on 16/5/13.
//  Copyright © 2016年 bear. All rights reserved.
//

#import "THBuyServiceView.h"

@interface THBuyServiceView ()

@property (nonatomic,weak) UIButton *cancelBtn;
@property (nonatomic,weak) UIImageView *iconV;
@property (nonatomic,weak) UILabel *promptLbl;
@property (nonatomic,weak) UIButton *buyBtn;
@property (nonatomic,weak) UIView *popView;

@end

@implementation THBuyServiceView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor colorWithWhite:0 alpha:0.7];
        
        _popView =  [self addView];
        _popView.bounds = CGRectMake(0, 0, 200, 200);
        _popView.center = CGPointMake(self.width/2, self.height/2);
        _popView.backgroundColor = [UIColor whiteColor];
        
        UIImageView *iconV = [[UIImageView alloc] init];
        iconV.image = [UIImage imageNamed:@"u62"];
        [_popView addSubview:iconV];
        _iconV = iconV ;
        
        _cancelBtn = [_popView addButton];
        [_cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
        _cancelBtn.titleLabel.font = [UIFont systemFontOfSize:15];
        [_cancelBtn addTarget:self action:@selector(cancelClk) forControlEvents:UIControlEventTouchUpInside];
        [_cancelBtn setTitleColor:COLOR(35, 189, 184, 0.6) forState:UIControlStateNormal];
        
        _promptLbl = [_popView addLabel];
        _promptLbl.text = @"您好，您还没有拥有咨询专家的服务，需要购买后才能咨询。";
        _promptLbl.numberOfLines = 0 ;
        _promptLbl.font = [UIFont systemFontOfSize:15];
        _promptLbl.textColor = COLOR(35, 189, 184, 1) ;
        
        _buyBtn = [_popView addButton];
        [_buyBtn addTarget:self action:@selector(buyBtnClk) forControlEvents:UIControlEventTouchUpInside];
        [_buyBtn setTitle:@"购买服务>>" forState:UIControlStateNormal];
        [_buyBtn setTitleColor:COLOR(35, 189, 184, 1) forState:UIControlStateNormal];
        
    }
    return self ;
}

- (void)cancelClk
{
    self.hidden = YES ;
}
- (void)buyBtnClk
{
    if (self.buyServiceClk) {
        self.buyServiceClk();
    }
}

- (void)setHidden:(BOOL)hidden
{
    [super setHidden:hidden];
  
    
    if (hidden == NO) {
        _cancelBtn.frame = CGRectMake(_popView.width - 60, 0, 40, 40);
        _iconV.frame = CGRectMake((_popView.width - 60)/2, 40 , 60, 60) ;
        _promptLbl.frame = CGRectMake( 20 , _iconV.height + _iconV.y, _popView.width - 40, 60);
        _buyBtn.frame = CGRectMake((_popView.width - 100)/2, _promptLbl.y + _promptLbl.height , 100, 40);
    }
}

@end
