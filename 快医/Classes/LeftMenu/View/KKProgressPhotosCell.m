//
//  KKProgressPhotosCell.m
//  快医
//
//  Created by 柯平常 on 16/5/11.
//  Copyright © 2016年 bear. All rights reserved.
//

#import "KKProgressPhotosCell.h"
#define space 3

@interface KKProgressPhotosCell ()

@property (nonatomic,strong) UIImageView *showImg;

@end

@implementation KKProgressPhotosCell

- (instancetype) initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        CGFloat width = (SCREEN_WIDTH-space*2)/4-space;
        _showImg = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0,width, width)];
        _showImg.contentMode=UIViewContentModeScaleAspectFill;
        _showImg.clipsToBounds=YES;
        [self.contentView addSubview:_showImg];
    }
    return self;
}

- (void)cellDataWithArray:(NSMutableArray *)assetArr position:(NSInteger)position;
{
    UIImage *image =assetArr[position];
    _showImg.image = image;
}

- (void)applyLayoutAttributes:(UICollectionViewLayoutAttributes *)layoutAttributes
{
    _showImg.frame = CGRectMake(0, 0, layoutAttributes.frame.size.width, layoutAttributes.frame.size.height);
}


@end
