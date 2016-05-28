//
//  THPostImgView.m
//  快医
//
//  Created by litianhao on 16/5/12.
//  Copyright © 2016年 bear. All rights reserved.
//

#import "THPostImgView.h"

#import "IconButton.h"

#import "KKMedicalRecordController.h"

@interface THPostImgView ()

@property (nonatomic,weak) IconButton *postHistory;
@property (nonatomic,weak) IconButton *postImage;

@end

@implementation THPostImgView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        IconButton *postHis = [[IconButton alloc] init];
        [postHis setImage:[UIImage imageNamed:@"u38"] forState:UIControlStateNormal];
        [postHis setTitle:@"发病例" forState:UIControlStateNormal];
        [postHis setTitleColor:COLOR(35, 189, 184, 0.6) forState:UIControlStateNormal ];
        postHis.layer.borderColor =COLOR(35, 189, 184, 0.6).CGColor ;
        postHis.layer.borderWidth = 2 ;
        [self addSubview:postHis];
        postHis.titleLabel.font = [UIFont systemFontOfSize:20];
        [postHis addTarget:self action:@selector(postHisCLk) forControlEvents:UIControlEventTouchUpInside];
        _postHistory = postHis ;
        
        IconButton *postImg = [[IconButton alloc] init];
        [postImg setImage:[UIImage imageNamed:@"u38"] forState:UIControlStateNormal];
        [postImg setTitle:@"发图片" forState:UIControlStateNormal];
        [postImg setTitleColor:COLOR(35, 189, 184, 0.6) forState:UIControlStateNormal ];
        postImg.layer.borderColor =COLOR(35, 189, 184, 0.6).CGColor ;
        postImg.layer.borderWidth = 2 ;
        [self addSubview:postImg];
        _postImage = postImg ;
        postImg.titleLabel.font = [UIFont systemFontOfSize:20];

     
    }
    return self ;
}

- (void)layoutSubviews
{
    CGFloat const margin = 10 ;
    _postHistory.frame = CGRectMake(margin, margin, self.height - margin*2, self.height - margin *2);
    _postImage.frame = CGRectMake(_postHistory.width + _postHistory.x + margin, margin, _postHistory.width, _postHistory.height);
}


- (void)postHisCLk
{
    if (self.postHisCallback) {
        self.postHisCallback();
    }
}

@end
