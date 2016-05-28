//
//  THChatCellModel.m
//  快医
//
//  Created by litianhao on 16/5/12.
//  Copyright © 2016年 bear. All rights reserved.
//

#import "THChatCellModel.h"
#import "THChatModel.h"

@implementation THChatCellModel

+ (instancetype)chatCellModelWithChatModel: (THChatModel *)chatModel
                                                   superViewSize: (CGSize)superViewSize
                                          shouldShowTimeLbl: (BOOL)shouldShowTimeLbl
{
    return [[self alloc ] initWithChatModel:chatModel superViewSize:superViewSize shouldShowTimeLbl:shouldShowTimeLbl];
}

- (instancetype)initWithChatModel:  (THChatModel *)chatModel
                                superViewSize:  (CGSize)superViewSize
                      shouldShowTimeLbl:  (BOOL)shouldShowTimeLbl
{
    if (self = [super init ]) {
        _chatModel = chatModel ;
        _showTimeLbl = shouldShowTimeLbl ;
        _superViewSize = superViewSize ;
        [self settingFrame];
    }
    return self ;
}

- (void)settingFrame
{
    CGFloat const margin = 10 ;
    CGFloat const iconBorder = 40 ;
    
    if (_showTimeLbl) {
        UILabel *tempLbl = [[UILabel alloc] init];
        tempLbl.font  = [UIFont systemFontOfSize:13];
        
        tempLbl.text = _chatModel.time ;
        [tempLbl sizeToFit];
        tempLbl.center = CGPointMake(_superViewSize.width/2, tempLbl.height/2);
        _timeLblFrame = tempLbl.frame ;
    }else
    {
        _timeLblFrame = CGRectZero ;
    }
    
    _iconFrame = CGRectMake(_chatModel.isDoctor ? margin : _superViewSize.width - margin - iconBorder , _timeLblFrame.size.height , iconBorder, iconBorder);

    CGFloat displayBtnWidth = _superViewSize.width - margin * 2 - _iconFrame.size.width - 30 ;
          CGSize  textSize =  [_chatModel.Textmessage boundingRectWithSize:CGSizeMake( displayBtnWidth , CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:16]} context:nil].size;
    
    if (textSize.width < displayBtnWidth) textSize.width = displayBtnWidth ;
    
        _displayBtnFrame = CGRectMake( _chatModel.isDoctor ? _iconFrame.size.width + _iconFrame.origin.x : _superViewSize.width - textSize.width - _iconFrame.size.width - margin , _iconFrame.origin.y, textSize.width , textSize.height + 20);
    if (_chatModel.imageName) {
        UIImage *imgMessage = [UIImage imageNamed:_chatModel.imageName];
        if (imgMessage) {
            _displayBtnFrame.size.height += imgMessage.size.height ;
        }
    }
    
    _totalHeight = _timeLblFrame.size.height + MAX(_iconFrame.size.height, _displayBtnFrame.size.height) + 10;

}

@end
