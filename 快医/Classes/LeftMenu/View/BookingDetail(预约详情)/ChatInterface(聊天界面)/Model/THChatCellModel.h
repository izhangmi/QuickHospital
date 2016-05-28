//
//  THChatCellModel.h
//  快医
//
//  Created by litianhao on 16/5/12.
//  Copyright © 2016年 bear. All rights reserved.
//

#import <Foundation/Foundation.h>

@class THChatModel ;

@interface THChatCellModel : NSObject

@property (nonatomic,strong) THChatModel *chatModel;

@property (nonatomic,assign) CGSize superViewSize;
@property (nonatomic,assign) CGRect iconFrame;
@property (nonatomic,assign) CGRect displayBtnFrame;
@property (nonatomic,assign) CGRect timeLblFrame;
@property (nonatomic,assign) CGFloat totalHeight;

@property (nonatomic,assign) BOOL showTimeLbl;



+ (instancetype)chatCellModelWithChatModel:(THChatModel *)chatModel superViewSize:(CGSize)superViewSize shouldShowTimeLbl:(BOOL)shouldShowTimeLbl;
- (instancetype)initWithChatModel:(THChatModel *)chatModel superViewSize:(CGSize)superViewSize shouldShowTimeLbl:(BOOL)shouldShowTimeLbl;

@end
