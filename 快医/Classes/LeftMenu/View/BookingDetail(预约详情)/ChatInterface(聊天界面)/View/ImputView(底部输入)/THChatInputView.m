//
//  THCahtInputView.m
//  快医
//
//  Created by litianhao on 16/5/11.
//  Copyright © 2016年 bear. All rights reserved.
//

#import "THChatInputView.h"

#import <TPKeyboardAvoidingScrollView.h>

#import "THPostImgView.h"
@interface THChatInputView ()<UITextFieldDelegate>

@property (nonatomic,weak) UIButton *forbidBtn;
@property (nonatomic,weak) UITextField *inputView;
@property (nonatomic,weak) UIButton *emojiBtn;
@property (nonatomic,weak) UIButton *postImageBtn;
@property (nonatomic,weak) UIView  *postImgView;
@property (nonatomic,weak) UIButton *sendBtn;

@property (nonatomic,weak) THPostImgView *postView;

@property (nonatomic,assign) BOOL keyBoardIsUp;
@property (nonatomic,assign) BOOL postViewIsUp;

@end

@implementation THChatInputView

//COLOR(35, 189, 184, 0.6)

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        _inputView = [self addTextFiled] ;
        _inputView.delegate = self ;
        _inputView.layer.borderColor = COLOR(35, 189, 184, 0.6) .CGColor ;
        _inputView.layer.borderWidth = 3 ;
        
        UIButton *emojiBtn =  [[UIButton alloc] init];
        _emojiBtn = emojiBtn ;
        [emojiBtn addTarget:self action:@selector(emojiBtnClk) forControlEvents:UIControlEventTouchUpInside];
        [_emojiBtn setBackgroundImage:[UIImage imageNamed:@"illness_rb_img_sel.png"] forState:UIControlStateNormal];

        _inputView.rightView =  emojiBtn ;
        _inputView.rightViewMode = UITextFieldViewModeAlways ;
        [_inputView addTarget:self action:@selector(keyboardShow) forControlEvents:UIControlEventEditingDidBegin];
        [_inputView addTarget:self action:@selector(keyboardHide) forControlEvents:UIControlEventEditingDidEnd];

        
        UIButton *postImgBtn =  [[UIButton alloc] init] ;
        [postImgBtn addTarget:self action:@selector(postImgBtnClk) forControlEvents:UIControlEventTouchUpInside];
        [postImgBtn setBackgroundImage:[UIImage imageNamed:@"chat_bottom_up_nor"] forState:UIControlStateNormal];
        [self addSubview:postImgBtn];
        _postImageBtn = postImgBtn ;
        
        _sendBtn = [self addButton];
        [_sendBtn setTitle:@"发送" forState:UIControlStateNormal];
        [_sendBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_sendBtn setBackgroundColor:COLOR(35, 189, 184, 1)];
        _sendBtn.layer.cornerRadius = 8 ;
        _sendBtn.layer.masksToBounds = YES ;
        [_sendBtn addTarget:self action:@selector(sendBtnClk) forControlEvents:UIControlEventTouchUpInside];
        
        _forbidBtn = [self addButton] ;
        _forbidBtn.hidden = _hasTimes ;
        [_forbidBtn addTarget:self action:@selector(buySevice) forControlEvents:UIControlEventTouchUpInside];
        
        _postImgView =  [self addView] ;
        _postImgView.backgroundColor = [UIColor redColor];
        
    }
    
    return self ;
}


- (void)layoutSubviews
{
    CGFloat const margin = 3 ;
    _inputView.frame = CGRectMake(margin, margin, self.width - 2*margin - self.height *2.5, self.height - 2*margin);
    _inputView.layer.cornerRadius = _inputView.height/2 ;
    _inputView.leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, _inputView.height/2, 0)];
    _inputView.leftViewMode = UITextFieldViewModeAlways ;
    
    _emojiBtn.frame = CGRectMake(0, 0, _inputView.height - margin , _inputView.height - margin );
    
    _postImageBtn.frame = CGRectMake(_inputView.x + _inputView.width  , 0, self.height  ,  self.height) ;
    
    _sendBtn.frame = CGRectMake(_postImageBtn.x + _postImageBtn.width, 5, self.height*1.5, self.height - 10);
    
    if (_forbidBtn.hidden == NO ) {
        _forbidBtn.frame = self.bounds ;
    }
    
}

- (void)keyboardShow
{
    
    if (self.keyBoardUp) {
        self.keyBoardUp(YES);
    }
}
- (void)keyboardHide
{
    if (self.keyBoardUp) {
        self.keyBoardUp(NO);
    }
}

- (void)buySevice
{
    if (self.buyServeiceCallback) {
        self.buyServeiceCallback();
    }
    NSLog(@"购买服务");
}

- (void)emojiBtnClk
{
    NSLog(@"表情键盘待实现");
}



- (void)postImgBtnClk
{
    if ([_inputView isFirstResponder]) {
        [_inputView resignFirstResponder];
        _postViewIsUp = YES ;
    }else
    {
    _postViewIsUp = !_postViewIsUp ;
    }
            if (self.postImgCallback) {
            self.postImgCallback(_postViewIsUp);
        }
}

- (void)sendBtnClk
{
    if (self.inputView.text.length) {
        if (self.sendMessage) {
            self.sendMessage(self.inputView.text);
        }
    }
    self.inputView.text = nil ;
}

- (void)setHasTimes:(BOOL)hasTimes
{
    _hasTimes = hasTimes ;
    self.forbidBtn.hidden = hasTimes ;
    if (hasTimes == NO) {
        [_inputView resignFirstResponder];
        if (_postViewIsUp) {
            _postViewIsUp = NO ;
            if (self.postImgCallback) {
                self.postImgCallback(_postViewIsUp);
            }
        }
    }
}

- (void)setPostViewShouldUp:(BOOL)postViewShouldUp
{
    _postViewIsUp = postViewShouldUp ;
    _postViewIsUp = postViewShouldUp ;
    if (self.postImgCallback) {
        self.postImgCallback(_postViewShouldUp);
    }
}

@end
