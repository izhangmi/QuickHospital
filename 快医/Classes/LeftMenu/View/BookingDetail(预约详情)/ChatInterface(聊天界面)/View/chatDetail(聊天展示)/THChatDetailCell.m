//
//  THChatDetailCell.m
//  快医
//
//  Created by litianhao on 16/5/12.
//  Copyright © 2016年 bear. All rights reserved.
//

#import "THChatDetailCell.h"

#import "IconButton.h"

#import "THChatCellModel.h"
#import "THChatModel.h"

#import "THChatMessageBtn.h"

@interface THChatDetailCell ()

@property (nonatomic,weak) UIImageView *iconV;
@property (nonatomic,weak) THChatMessageBtn *displayBtn;
@property (nonatomic,weak) UILabel *timeLbl;

@end

@implementation THChatDetailCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.selectionStyle = UITableViewCellSelectionStyleNone ;
        _iconV = [self addImageView] ;
        
      THChatMessageBtn *displayBtn =  [[THChatMessageBtn alloc] init];
        [displayBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [self addSubview:displayBtn];
        _displayBtn = displayBtn ;
        _displayBtn.titleLabel.font = [UIFont systemFontOfSize:16];
        _displayBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
    
        _timeLbl = [self addLabel];
        _timeLbl.font = [UIFont systemFontOfSize:13];
        _timeLbl.backgroundColor = [UIColor grayColor];
        self.backgroundColor =  [UIColor whiteColor];
        
    }
    return self ;
}

- (void)setModel:(THChatCellModel *)model
{
    _model = model ;
    
        _timeLbl.frame = model.timeLblFrame ;
        _timeLbl.text = model.chatModel.time;
        _timeLbl.layer.cornerRadius = _timeLbl.height/2 ;
        _timeLbl.clipsToBounds = YES ;
    
    _iconV.frame = model.iconFrame;
    _iconV.image = [UIImage imageNamed:model.chatModel.iconName];
    _iconV.layer.cornerRadius = _iconV.width/2 ;
    _iconV.clipsToBounds = YES ;
    
    [_displayBtn setTitle:model.chatModel.Textmessage forState:UIControlStateNormal];
    _displayBtn.titleLabel.numberOfLines = 0 ;
    _displayBtn.directionIsLeft = model.chatModel.isDoctor ;
    _displayBtn.frame = model.displayBtnFrame;
    _displayBtn.contentEdgeInsets = UIEdgeInsetsMake(10, 15, 10, 15);
    _displayBtn.messageImg = nil ;
    if (model.chatModel.imageName) {
        UIImage *imag = [UIImage imageNamed:_model.chatModel.imageName];
        if (imag) {
            _displayBtn.messageImg = imag;
        }
    }

}
@end
