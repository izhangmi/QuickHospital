//
//  THChatBannerView.m
//  快医
//
//  Created by litianhao on 16/5/11.
//  Copyright © 2016年 bear. All rights reserved.
//

#import "THChatBannerView.h"

@interface THChatBannerView ()

@property (nonatomic,weak) UILabel  *consultLbl;
@property (nonatomic,weak) UILabel  *timeLbl;
@property (nonatomic,weak) UILabel  *titleLbl;

@end

@implementation THChatBannerView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {

        self.backgroundColor = [UIColor whiteColor];
        _consultLbl = [self addLabel] ;
        _consultLbl.font = [UIFont systemFontOfSize:14];
        _consultLbl.hidden = YES ;
       
        _timeLbl = [self addLabel];
        _timeLbl.hidden = YES ;
        _timeLbl.font = [UIFont systemFontOfSize:14];

        _titleLbl = [self addLabel];
        _titleLbl.text = @"免费咨询";
        _titleLbl.font = [UIFont systemFontOfSize:16];
        _titleLbl.textAlignment = NSTextAlignmentCenter;

    }
    
    return self ;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    [self settingFrames];

}

- (void)setConsultCount:(NSInteger)consultCount
{
    _consultCount = consultCount ;
    BOOL hasTimes = _consultCount >0 && _timeLeft > 0 ;
        NSMutableAttributedString *text = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"咨询次数:%zd/10",_consultCount]];
        [text setAttributes:@{NSForegroundColorAttributeName : [UIColor grayColor]} range:NSMakeRange(0, 5)];
        [text setAttributes:@{NSForegroundColorAttributeName : [UIColor blackColor]} range:NSMakeRange(5, text.length - 5)];
        
        _consultLbl.attributedText = text ;
    
    _timeLbl.hidden =   _consultLbl.hidden = !hasTimes;
    _titleLbl.hidden = hasTimes ;
 
    [self settingFrames];

}

- (void)setTimeLeft:(NSInteger)timeLeft
{
    _timeLeft = timeLeft ;
    BOOL hasTimes = _consultCount >0 && _timeLeft > 0 ;
        NSMutableAttributedString *text = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"剩余天数:%zd天",_timeLeft]];
        [text setAttributes:@{NSForegroundColorAttributeName : [UIColor grayColor]} range:NSMakeRange(0, 5)];
        [text setAttributes:@{NSForegroundColorAttributeName : [UIColor blackColor]} range:NSMakeRange(5, text.length - 5)];
        
        _timeLbl.attributedText = text ;
    
    _timeLbl.hidden =   _consultLbl.hidden = !hasTimes;
    _titleLbl.hidden = hasTimes ;
    
    [self settingFrames];

}

- (void)settingFrames
{
    if (self.consultLbl.hidden == NO) {
        self.consultLbl.frame = CGRectMake(10, 10, 130, self.height - 20) ;
    }
    
    if (self.timeLbl.hidden == NO) {
        self.timeLbl.frame = CGRectMake(self.width - 100, 10,  130, self.height - 20) ;
    }
    
    if (self.titleLbl.hidden == NO) {
        self.titleLbl.bounds = CGRectMake(0, 0, 130, self.height - 20) ;
        self.titleLbl.center = CGPointMake(self.width/2, self.height/2) ;
    }
}

@end
