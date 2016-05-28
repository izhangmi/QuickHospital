//
//  KKAddCasehistoryControllerTest.m
//  快医
//
//  Created by 柯平常 on 16/5/11.
//  Copyright © 2016年 bear. All rights reserved.
//

#import "KKAddCasehistoryControllerTest.h"
#import "ZLPhotoActionSheet.h"
#import "ZLShowBigImage.h"
#import "KKAddCasehistoryView.h"
#import <Masonry.h>
#import "KKMedicalRecordController.h"
#import "KKSearchViewController.h"


@interface KKAddCasehistoryControllerTest ()
{
    ZLPhotoActionSheet *actionSheet;
}
@property (strong, nonatomic) UIView *baseView;


@end

@implementation KKAddCasehistoryControllerTest

- (void)viewWillAppear:(BOOL)animated{
    
    self.title = @"添加病历";
    self.view.backgroundColor = [UIColor whiteColor];
}

-(void)addViews{
    
    KKAddCasehistoryView *addcaseView = [[NSBundle mainBundle]loadNibNamed:@"KKAddCasehistoryView" owner:nil options:nil].lastObject;
    
#pragma mark - 优化
    /**
     //    addcaseView.addCoverBlock = ^(){
     //
     //        UIButton *cover = [[UIButton alloc]initWithFrame:self.view.bounds];
     //        [cover addTarget:self action:@selector(coverBtnClick:) forControlEvents:UIControlEventTouchUpInside];
     //        cover.backgroundColor = [UIColor clearColor];
     //        [self.view addSubview:cover];
     //    };
     */
    
    addcaseView.jumpToMedicalRecord = ^(){
        
        KKMedicalRecordController *medicalVc = [[KKMedicalRecordController alloc]init];
        [self.navigationController pushViewController:medicalVc animated:YES];
    };
    
    
#pragma mark - view的block回调 - 实现搜索控制器切换
    __weak __typeof__(addcaseView)weakAddcaseView = addcaseView;
    addcaseView.jumpToSearchController = ^(){
        
        KKSearchViewController *searchVc = [[KKSearchViewController alloc]init];
        searchVc.searchPlistName = @"KKSearchCaseType";
#pragma mark - 搜索控制器的回调,实现了逆传值
        searchVc.keyWordBlock = ^(NSString *keyWord){
            
#pragma mark - 给view设置公有属性的值
            weakAddcaseView.showCaseTypeLabel.text = keyWord;
        };
        
        [self presentViewController:searchVc animated:YES completion:nil];
    };
    
    
    [self.view addSubview:addcaseView];
    
    [addcaseView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        //        make.edges.equalTo(self.view);
        make.size.equalTo(self.view);
        make.center.equalTo(self.view);
        
    }];
    
    
    UIButton *uploadButton = [[UIButton alloc]init];
    uploadButton.frame = CGRectMake(120, 359, 235, 30);
    uploadButton.backgroundColor = [UIColor clearColor];
    [uploadButton addTarget:self action:@selector(btnSelectPhoto_Click:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:uploadButton];
    
    self.baseView = [[UIView alloc]initWithFrame:CGRectMake(30, 415, 334, 100)];
    self.baseView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:self.baseView];
    
}


#pragma mark - 遮罩button点击方法
-(void)coverBtnClick:(UIButton *)sender{
    sender.hidden = YES;
    [self.view endEditing:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    actionSheet = [[ZLPhotoActionSheet alloc] init];
    //设置照片最大选择数
    actionSheet.maxSelectCount = 3;
    //设置照片最大预览数
    actionSheet.maxPreviewCount = 20;
    
    [self addViews];
}

- (void)btnSelectPhoto_Click:(id)sender
{
    __weak typeof(self) weakSelf = self;
    
    [actionSheet showWithSender:self animate:YES completion:^(NSArray<UIImage *> * _Nonnull selectPhotos) {
        [weakSelf.baseView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
        
        CGFloat width = [UIScreen mainScreen].bounds.size.width/4-2;
        for (int i = 0; i < selectPhotos.count; i++) {
            UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(i%4*(width+20), i/4*(width+20), width, width)];
            imgView.image = selectPhotos[i];
            [weakSelf.baseView addSubview:imgView];
        }
    }];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self.view];
    for (UIView *view in self.baseView.subviews) {
        CGRect convertRect = [self.baseView convertRect:view.frame toView:self.view];
        if ([view isKindOfClass:[UIImageView class]] &&
            CGRectContainsPoint(convertRect, point)) {
            [ZLShowBigImage showBigImage:(UIImageView *)view];
            break;
        }
    }
}


@end
