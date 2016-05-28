//
//  THChatMessageBtn.h
//  快医
//
//  Created by litianhao on 16/5/12.
//  Copyright © 2016年 bear. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface THChatMessageBtn : UIButton

@property (nonatomic,assign) BOOL directionIsLeft;
@property (nonatomic,strong) UIImage *messageImg;
@property (nonatomic,copy) NSString *messageText;

@end
