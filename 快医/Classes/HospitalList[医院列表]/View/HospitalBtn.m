//
//  HospitalBtn.m
//  快医
//
//  Created by 付凯琪 on 16/5/10.
//  Copyright © 2016年 bear. All rights reserved.
//

#import "HospitalBtn.h"

@interface HospitalBtn ()
@property (nonatomic, weak) UILabel *name;

@property (nonatomic, weak) UIImageView *img;



@end
@implementation HospitalBtn

- (instancetype)initWithFrame:(CGRect)frame{

    if (self = [super initWithFrame:frame]) {

        UILabel *name = [[UILabel alloc] init];

        UIImageView *img = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"youjian"]];

        #pragma mark -  图片优化,尺寸/旋转
        img.width = 15;
        img.height = 28;
        img.transform = CGAffineTransformMakeRotation(M_PI_2);
        
        _name = name;
        _img = img;
        
        [self addSubview:name];
        [self addSubview:img];
        
    }
    return self;
}

- (void)setTitle:(NSString *)title forState:(UIControlState)state{
//    [super setTitle:title forState:state];
    _name.text = title;
    [_name sizeToFit];
    
    
}


- (void)layoutSubviews{
    [super layoutSubviews];

    _name.frame = CGRectMake(([UIScreen mainScreen].bounds.size.width / 2 - _name.width - _img.width) / 2, (self.height - _name.height) / 2, _name.width, _name.height);
    
    _img.frame = CGRectMake(_name.x + _name.width + 5, (self.height - _img.height) / 2, _img.width, _img.height);

}

@end
