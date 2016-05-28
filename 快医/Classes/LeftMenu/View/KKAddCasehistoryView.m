//
//  KKAddCasehistoryView.m
//  快医
//
//  Created by 柯平常 on 16/5/10.
//  Copyright © 2016年 bear. All rights reserved.
//

#import "KKAddCasehistoryView.h"


@interface KKAddCasehistoryView ()<UITextViewDelegate>

//显示选择的疾病类型label


//可选按钮 //tag值设置为 10 - 15 - 为避免tag重复
@property (weak, nonatomic) IBOutlet UIButton *dehydrationBtn;
@property (weak, nonatomic) IBOutlet UIButton *cacotrophiaBtn;
@property (weak, nonatomic) IBOutlet UIButton *anemiaBtn;
@property (weak, nonatomic) IBOutlet UIButton *ChestHurtBtn;
@property (weak, nonatomic) IBOutlet UIButton *throatPainBtn;
@property (weak, nonatomic) IBOutlet UIButton *hardSwallowBtn;

//疾病类型button
@property (weak, nonatomic) IBOutlet UIButton *diseaseStyleBtn;

@property (weak, nonatomic) IBOutlet UIButton *upLoadPicBtn;


//view的辅助提示Label
@property (weak, nonatomic) IBOutlet UILabel *assistLabel;

//确认按钮
@property (weak, nonatomic) IBOutlet UIButton *sureBtn;

//文本输入视图
@property (weak, nonatomic) IBOutlet UITextView *CasehistoryTextView;

//剩余文字个数
@property (weak, nonatomic) IBOutlet UILabel *textCount;


//添加图片collecitonView
@property (nonatomic, strong) IBOutlet UICollectionView *picCollectionView;

@end


@implementation KKAddCasehistoryView


- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super initWithCoder:aDecoder]) {
        
        //MARK: 设置collectionView代理和数据源
//        self.picCollectionView.dataSource = self;
//        self.picCollectionView.delegate = self;
        

    }
    return self;
}

- (IBAction)sureBtnClick:(UIButton *)sender {
 
    if (self.jumpToMedicalRecord) {
        self.jumpToMedicalRecord();
    }
    
}

- (IBAction)chooseBtnClick:(UIButton *)sender {
    
    //MARK: 再次点击同一个sender,可以取消点击
    if (sender.selected) {
        sender.selected = NO;
        sender.layer.borderColor = [[UIColor lightGrayColor]CGColor];
        [sender setImage:[UIImage new] forState:UIControlStateNormal];
        return;
    }
    [sender setImage:[UIImage imageNamed:@"ok"] forState:UIControlStateSelected];
    sender.layer.borderColor = [UIColor colorWithRed:26/255.0 green:178/255.0 blue:170/255.0 alpha:1].CGColor;
    sender.selected = YES;
}

#pragma mark - textView的代理方法
- (void) textViewDidChange:(UITextView *)textView{
    if ([textView.text length] == 0) {
        [self.assistLabel setHidden:NO];
    }else{
        [self.assistLabel setHidden:YES];
    }
    self.textCount.text = [NSString stringWithFormat:@"%zd",200 - textView.text.length];
}
- (void) textViewDidBeginEditing:(UITextView *)textView{
    
    //MARK: 当前控制器增加一个全屏的阴影遮罩
//    if (self.addCoverBlock) {
//        self.addCoverBlock();
//    }
    [self.assistLabel setHidden:YES];
    [self addConerBtn];
}

#pragma mark - 增加阴影遮罩

- (void)addConerBtn{

    UIButton *cover = [[UIButton alloc]init];
    cover.backgroundColor = [UIColor clearColor];

    cover.frame=self.frame;
    [cover addTarget:self action:@selector(coverBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    [self addSubview:cover];



    [self bringSubviewToFront:cover];
}


- (void)coverBtnClick:(UIButton *)coverBtn{

    coverBtn.hidden = YES;
    [self endEditing:YES];
}


- (IBAction)searchCaseType:(UIButton *)sender {
    //搜索疾病类型
    if (self.jumpToSearchController) {
        self.jumpToSearchController();
    }

}



- (void)layoutSubviews{
    
    [super layoutSubviews];
    
    [self setChooseBtnStyle];
}

- (void)setChooseBtnStyle{
    
    //MARK: 设置label和btn的style
    self.showCaseTypeLabel.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.showCaseTypeLabel.layer.borderWidth = 1.0;
    
    self.diseaseStyleBtn.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.diseaseStyleBtn.layer.borderWidth = 1.0;
    
    
    
    //MARK: 26 178 170
    self.dehydrationBtn.layer.borderColor = [[UIColor lightGrayColor]CGColor];
    self.dehydrationBtn.layer.borderWidth = 1.0;
    
    self.cacotrophiaBtn.layer.borderColor = [[UIColor lightGrayColor]CGColor];
    self.cacotrophiaBtn.layer.borderWidth = 1.0;
    
    self.anemiaBtn.layer.borderColor = [[UIColor lightGrayColor]CGColor];
    self.anemiaBtn.layer.borderWidth = 1.0;
    
    self.ChestHurtBtn.layer.borderColor = [[UIColor lightGrayColor]CGColor];
    self.ChestHurtBtn.layer.borderWidth = 1.0;
    
    self.throatPainBtn.layer.borderColor = [[UIColor lightGrayColor]CGColor];
    self.throatPainBtn.layer.borderWidth = 1.0;
    
    self.hardSwallowBtn.layer.borderColor = [[UIColor lightGrayColor]CGColor];
    self.hardSwallowBtn.layer.borderWidth = 1.0;
    
    //MARK: 上传按钮和选择疾病类型按钮
    self.diseaseStyleBtn.layer.borderColor = [[UIColor lightGrayColor]CGColor];
    self.diseaseStyleBtn.layer.borderWidth = 1.0;
    
    self.upLoadPicBtn.layer.borderColor = [[UIColor lightGrayColor]CGColor];
    self.upLoadPicBtn.layer.borderWidth = 1.0;
    
    //MARK: textView视图
    self.CasehistoryTextView.layer.borderColor = [[UIColor lightGrayColor]CGColor];
    self.CasehistoryTextView.layer.borderWidth = 1.0;
    self.CasehistoryTextView.delegate = self;
    
    //MARK: 确认按钮
    self.sureBtn.layer.cornerRadius = 5;
    self.sureBtn.clipsToBounds = YES;
    
    if (self.dehydrationBtn.selected) {
        self.dehydrationBtn.layer.borderColor = [UIColor colorWithRed:26/255.0 green:178/255.0 blue:170/255.0 alpha:1].CGColor;
    }
    if (self.cacotrophiaBtn.selected) {
        self.cacotrophiaBtn.layer.borderColor = [UIColor colorWithRed:26/255.0 green:178/255.0 blue:170/255.0 alpha:1].CGColor;
    }
    if (self.anemiaBtn.selected) {
        self.anemiaBtn.layer.borderColor = [UIColor colorWithRed:26/255.0 green:178/255.0 blue:170/255.0 alpha:1].CGColor;
    }
    if (self.ChestHurtBtn.selected) {
        self.ChestHurtBtn.layer.borderColor = [UIColor colorWithRed:26/255.0 green:178/255.0 blue:170/255.0 alpha:1].CGColor;
    }
    if (self.throatPainBtn.selected) {
        self.throatPainBtn.layer.borderColor = [UIColor colorWithRed:26/255.0 green:178/255.0 blue:170/255.0 alpha:1].CGColor;
    }
    if (self.hardSwallowBtn.selected) {
        self.hardSwallowBtn.layer.borderColor = [UIColor colorWithRed:26/255.0 green:178/255.0 blue:170/255.0 alpha:1].CGColor;
    }
}
@end
