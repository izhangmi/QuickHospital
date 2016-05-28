//
//  THChatDetailView.h
//  快医
//
//  Created by litianhao on 16/5/11.
//  Copyright © 2016年 bear. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface THChatDetailView : UITableView

@property (nonatomic,copy) void(^downKeyBoard)(void);

- (void)addMessage:(NSString *)message;

@end
