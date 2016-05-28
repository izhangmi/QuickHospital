//
//  THChatDetailView.m
//  快医
//
//  Created by litianhao on 16/5/11.
//  Copyright © 2016年 bear. All rights reserved.
//

#import "THChatDetailView.h"

#import "THChatDetailCell.h"
#import "THChatCellModel.h"
#import "THChatModel.h"

static NSString *const detailCellId = @"detailCellId";

@interface THChatDetailView ()<UITableViewDataSource , UITableViewDelegate , UIScrollViewDelegate>

@property (nonatomic,strong) NSMutableArray *messages;


@end

@implementation THChatDetailView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.delegate = self ;
        self.dataSource = self ;
        self.bounces = NO ;
        [self registerClass:[THChatDetailCell class] forCellReuseIdentifier:detailCellId];
        self.separatorStyle = UITableViewCellSeparatorStyleNone;
        
    }
    return self ;
}

- (void)addMessage:(NSString *)message
{

    THChatModel *model = [[THChatModel alloc] init];
    model.Textmessage = message ;
    model.isDoctor = NO;
    model.iconName = @"user_default";
    NSDate *date = [NSDate dateWithTimeIntervalSinceNow:0];
    NSDateFormatter *dF = [[NSDateFormatter alloc] init];
    dF.dateFormat = @"HH : mm";
    NSString *timeStr = [dF stringFromDate:date];
    model.time = [NSString stringWithFormat:@"今天 %@" , timeStr];
    BOOL shouldShowTime = ![[[self.messages.lastObject chatModel] time] isEqualToString:model.time];
    
    
    [self.messages addObject:[THChatCellModel chatCellModelWithChatModel:model superViewSize:self.bounds.size shouldShowTimeLbl:shouldShowTime]];
    [self insertRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:self.messages.count-1 inSection:0]] withRowAnimation:UITableViewRowAnimationAutomatic];

    [self scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:self.messages.count-1 inSection:0] atScrollPosition:UITableViewScrollPositionBottom animated:YES];
}

#pragma mark - 代理

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.messages.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    THChatDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:detailCellId forIndexPath:indexPath];
    cell.model = self.messages[indexPath.row];
    return cell ;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    THChatCellModel *cellModel = self.messages[indexPath.row];
    return cellModel.totalHeight ;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.downKeyBoard) {
        self.downKeyBoard();
    }
}



#pragma mark - 懒加载
- (NSMutableArray *)messages
{
    if (!_messages) {
        NSArray *array = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"ChatMessage.plist" ofType:nil]];
        
        NSMutableArray *tempArrM = [NSMutableArray arrayWithCapacity:array.count];
        
        [array enumerateObjectsUsingBlock:^(NSDictionary  *_Nonnull dict, NSUInteger idx, BOOL * _Nonnull stop) {
            BOOL shouldShowTimeLbl = YES ;
            THChatModel *chatModel = [THChatModel chatModelWithDict:dict];
            
            if (idx>0 ) {
                THChatCellModel *cellModel =  tempArrM[idx - 1 ] ;
              if([cellModel.chatModel.time isEqualToString:chatModel.time])
                  shouldShowTimeLbl = NO ;
            }
            
            THChatCellModel * model = [THChatCellModel chatCellModelWithChatModel:chatModel superViewSize:self.bounds.size shouldShowTimeLbl:shouldShowTimeLbl];
            
            [tempArrM addObject:model];
        }];
        
        _messages = tempArrM ;
    }
    return _messages ;
}

@end
