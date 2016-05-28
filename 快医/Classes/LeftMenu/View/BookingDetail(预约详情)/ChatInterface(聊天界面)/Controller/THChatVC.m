//
//  THChatVC.m
//  快医
//
//  Created by litianhao on 16/5/11.
//  Copyright © 2016年 bear. All rights reserved.
//

#import "THChatVC.h"

#import "THChatBannerView.h"
#import "THChatDetailView.h"
#import "THChatInputView.h"
#import "THPostImgView.h"
#import "THBuyServiceView.h"
#import "THBuyServiceTVC.h"
#import "KKMedicalRecordController.h"

#import <TPKeyboardAvoidingScrollView.h>


@interface THChatVC ()

@property (nonatomic,weak) THChatBannerView *banner;
@property (nonatomic,weak) THChatDetailView *detail;
@property (nonatomic,weak) THChatInputView *input;
@property (nonatomic,strong) THPostImgView *postImg;
@property (nonatomic,assign) CGFloat detailHeight;
@property (nonatomic,weak) THBuyServiceView *buyServiceView;
@property (nonatomic,weak) UIView *containerView;

@end

@implementation THChatVC


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:[[TPKeyboardAvoidingScrollView alloc] initWithFrame:self.view.bounds]];
    
    _consultCount  = 0 ;
    _timeLeft  =  0 ;
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self addContainerView];
    [self addBanner];
    [self addDetailView];
    [self addInputView];
    [self addPostImg];
    [self addBuyServiceView];
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    _banner.hidden = NO ;
    self.title = @"王医生";
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    _banner.hidden = NO ;
}

- (void)addContainerView
{
    UIView *containerV = [[UIView alloc] initWithFrame:self.view.bounds];
    _containerView = containerV ;
    [self.view addSubview:containerV];
}
- (void)addBanner
{
    THChatBannerView *banner = [[THChatBannerView alloc] initWithFrame:CGRectMake(0, NavigationBar_HEIGHT , SCREEN_WIDTH, NavigationBar_HEIGHT)];
    [self.navigationController.navigationBar addSubview:banner];
    banner.consultCount = _consultCount;
    banner.timeLeft = _timeLeft;
    self.banner = banner ;
    _banner.hidden = YES ;
}

- (void)addDetailView
{
    
     THChatDetailView *detail = [[THChatDetailView alloc] initWithFrame:CGRectMake(0, NavigationBar_HEIGHT, SCREEN_WIDTH, SCREEN_HEIGHT - _banner.height - NavigationBar_HEIGHT - 20 - 49)];
    _detail  = detail ;
    [self.containerView addSubview:detail];
    _detailHeight = detail.height ;
    
    __weak typeof(self) weakSelf = self ;
    [detail setDownKeyBoard:^{
        [weakSelf.view endEditing:YES];
    }];
}

- (void)addBuyServiceView
{
    THBuyServiceView *buyView = [[THBuyServiceView alloc] initWithFrame:self.view.bounds];
    [self.containerView addSubview:buyView];
    _buyServiceView = buyView ;
    buyView.hidden = YES ;
    __weak typeof(self) weakSelf = self ;
    [buyView setBuyServiceClk:^{
        weakSelf.buyServiceView.hidden = YES ;
        THBuyServiceTVC *tvc = [[THBuyServiceTVC alloc] init];
        
        [tvc setSetCountAndTime:^(NSUInteger count, NSUInteger time) {
            weakSelf.consultCount = count ;
            weakSelf.timeLeft = time ;
           weakSelf.banner.timeLeft = weakSelf.timeLeft ;
            weakSelf.banner.consultCount = weakSelf.consultCount;
            weakSelf.input.hasTimes = count > 0 && time > 0 ;
        }];
        [weakSelf.navigationController pushViewController:tvc animated:YES];
    }];
}
- (void)addInputView
{
    THChatInputView *input = [[THChatInputView alloc] initWithFrame:CGRectMake(0, _detail.y + _detail.height , SCREEN_WIDTH, 49)];
    input.hasTimes = _timeLeft > 0 && _consultCount > 0  ;
    
    //上移 以避开弹出视图的遮挡
    __weak typeof(self) weakSelf = self ;
    [input setPostImgCallback:^(BOOL postImgshouldUp){
        __strong typeof(weakSelf) strongSelf = weakSelf ;
    
        if (postImgshouldUp) {
            [UIView animateWithDuration:0.3 animations:^{
                strongSelf.containerView.transform = CGAffineTransformMakeTranslation(0, -100);
                strongSelf.detail.transform = CGAffineTransformMakeTranslation(0, 100);
                strongSelf.detail.height -= 100 ;
            } completion:^(BOOL finished) {
                      [strongSelf.detail setContentOffset:CGPointMake(0, MAX(0, strongSelf.detail.contentSize.height - strongSelf.detail.height)) animated:YES];
                _postImg.hidden = NO;
            }];
        }else
        {
            _postImg.hidden = YES;
            [UIView animateWithDuration:0.3 animations:^{
                strongSelf.containerView.transform = CGAffineTransformMakeTranslation(0, 0);
                strongSelf.detail.transform = CGAffineTransformMakeTranslation(0, 0);
                strongSelf.detail.height += 100 ;
            } completion:^(BOOL finished) {
            [strongSelf.detail setContentOffset:CGPointMake(0, MAX(0, strongSelf.detail.contentSize.height - strongSelf.detail.height)) animated:YES];
            }];
        }
    }];
    
    [input setSendMessage:^(NSString *message) {
        if (message.length) {
            [weakSelf.detail addMessage:message];
            weakSelf.consultCount -- ;
        }
    }];
    
    //上移 以避键盘的遮挡
    [input setKeyBoardUp:^(BOOL shoulUp) {
        CGFloat keyboardHeight = 270 ;
        __strong typeof(weakSelf) strongSelf = weakSelf ;
        if (shoulUp) {
            [UIView animateWithDuration:0.3 animations:^{
                strongSelf.view.transform = CGAffineTransformMakeTranslation(0, -keyboardHeight);
                strongSelf.detail.transform = CGAffineTransformMakeTranslation(0, keyboardHeight);
                strongSelf.detail.height = strongSelf.detailHeight - keyboardHeight ;
            } completion:^(BOOL finished) {
             [strongSelf.detail setContentOffset:CGPointMake(0, MAX(0, strongSelf.detail.contentSize.height - strongSelf.detail.height)) animated:YES];
            }];
        }else
        {
            [UIView animateWithDuration:0.3 animations:^{
                strongSelf.view.transform = CGAffineTransformMakeTranslation(0, 0);
                strongSelf.detail.transform = CGAffineTransformMakeTranslation(0, 0);
                strongSelf.detail.height = strongSelf.detailHeight  ;
            } completion:^(BOOL finished) {
            [strongSelf.detail setContentOffset:CGPointMake(0, MAX(0, strongSelf.detail.contentSize.height - strongSelf.detail.height)) animated:YES];
            }];
        }
    }];
    
    [input setBuyServeiceCallback:^{
        weakSelf.buyServiceView.hidden = NO;
    }];
    
    [self.containerView addSubview:input];
    self.input = input ;
}

- (void)addPostImg
{
    _postImg = [[THPostImgView alloc] initWithFrame:CGRectMake(0, SCREEN_HEIGHT  - NavigationBar_HEIGHT  - 20-100 , SCREEN_WIDTH, 100)];
    _postImg.hidden = YES ;
    __weak typeof(self) weakSelf = self ;
    [_postImg setPostHisCallback:^{
        KKMedicalRecordController *kkVc = [[KKMedicalRecordController alloc] init];
        [weakSelf.navigationController pushViewController:kkVc animated:YES];
        
        weakSelf.input.postViewShouldUp = NO ;
    }];
    [self.view addSubview:_postImg];
}


- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    _banner.hidden = YES ;
}

- (void)setConsultCount:(NSUInteger)consultCount
{
    _consultCount = consultCount ;
    _banner.consultCount = _consultCount ;
    _input.hasTimes = _consultCount>0 && _timeLeft>0 ;
}

- (void)setTimeLeft:(NSUInteger)timeLeft
{
    _timeLeft = timeLeft ;
    _banner.timeLeft = _timeLeft ;
    _input.hasTimes = _consultCount>0 && _timeLeft > 0 ;
}

@end
