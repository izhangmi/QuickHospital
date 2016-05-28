//
//  THCahtInputView.h
//  快医
//
//  Created by litianhao on 16/5/11.
//  Copyright © 2016年 bear. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface THChatInputView : UIView

/**
 *  是否有权限咨询
 */
@property (nonatomic,assign) BOOL hasTimes;

@property (nonatomic,copy) void (^keyBoardUp) (BOOL shouldUp);
@property (nonatomic,copy) void(^postImgCallback) (BOOL postImgshouldUp);
@property (nonatomic,copy) void(^buyServeiceCallback)(void);
@property (nonatomic,copy) void(^sendMessage) (NSString *message);

@property (nonatomic,assign) BOOL postViewShouldUp;

@end
