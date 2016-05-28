//
//  DoctorInfoController.m
//  快医
//
//  Created by bear on 16/5/12.
//  Copyright © 2016年 bear. All rights reserved.
//

#import "DoctorInfoController.h"
#import "ConditionCell.h"

#import "THChatVC.h"

#import "KKDoctorInformationController.h"


@interface DoctorInfoController ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property (weak, nonatomic) IBOutlet UICollectionViewFlowLayout *panelLayout;

@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *collectTitleBtns;

@property (nonatomic, weak) IBOutlet UICollectionView *panelCollectionView;
@property (weak, nonatomic) IBOutlet UIView *sliderAccessory;

@property (nonatomic, strong)IBOutlet UIImageView *dengluhou;
@property (nonatomic, strong) UIButton *doctorInfo;

@end

@implementation DoctorInfoController


#pragma mark - 在头像的位置增加一个隐身的button,点击后展示医生详情
- (UIButton *)doctorInfo{
    if (!_doctorInfo) {
        _doctorInfo = [[UIButton alloc]init];
        _doctorInfo.frame = CGRectMake(self.dengluhou.x, self.dengluhou.y, SCREEN_WIDTH * 0.5, 50);
        _doctorInfo.backgroundColor = [UIColor clearColor];
        [_doctorInfo addTarget:self action:@selector(doctorInfoBtnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _doctorInfo;
}

- (void)doctorInfoBtnClick{

    KKDoctorInformationController *kkDoctorInformationVc = [[UIStoryboard storyboardWithName:@"DoctorInformation" bundle:nil]instantiateInitialViewController];
    
    [self.navigationController pushViewController:kkDoctorInformationVc animated:YES];
    
}


- (IBAction)collectionTitleBtnClick:(UIButton *)sender {

    NSIndexPath *indexPath=[NSIndexPath indexPathForItem:sender.tag inSection:0];

    [self.panelCollectionView selectItemAtIndexPath:indexPath animated:YES scrollPosition:UICollectionViewScrollPositionCenteredHorizontally];
}


- (void)viewDidLoad {
    [super viewDidLoad];

    [self.view addSubview:self.doctorInfo];
    self.automaticallyAdjustsScrollViewInsets=NO;

    self.title=@"医生基本信息";

    
        [self.panelCollectionView registerNib:[UINib nibWithNibName:@"ConditionCell" bundle:nil] forCellWithReuseIdentifier:@"ConditionCell"];

    [self.panelCollectionView registerNib:[UINib nibWithNibName:@"IntroductionCell" bundle:nil] forCellWithReuseIdentifier:@"IntroductionCell"];
        [self.panelCollectionView registerNib:[UINib nibWithNibName:@"TimeCell" bundle:nil] forCellWithReuseIdentifier:@"TimeCell"];








}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.panelLayout.itemSize=CGSizeMake(SCREEN_WIDTH, SCREEN_HEIGHT-149-64);

    self.panelLayout.minimumInteritemSpacing=0;
    self.panelLayout.minimumLineSpacing=0;



}



-(void)scrollViewDidScroll:(UIScrollView *)scrollView{

    NSInteger index = (self.panelCollectionView.contentOffset.x+SCREEN_WIDTH*0.5)/SCREEN_WIDTH;


    [UIView animateWithDuration:0.3 animations:^{

        self.sliderAccessory.frame=CGRectMake([self.collectTitleBtns[index] frame].origin.x+5, self.sliderAccessory.y, self.sliderAccessory.width, self.sliderAccessory.height) ;

        [self.collectTitleBtns[index] setSelected:YES];
    }];





}



+(instancetype)doctorInfoController{

    UIStoryboard *st=[UIStoryboard storyboardWithName:@"DoctorInfo" bundle:nil];

    return [st instantiateInitialViewController];
}



-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 3;
}


-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *cell;


    switch (indexPath.item) {
        case 0:
            cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"ConditionCell" forIndexPath:indexPath];
            break;
        case 1:
            cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"IntroductionCell" forIndexPath:indexPath];
            break;
        case 2:
            cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"TimeCell" forIndexPath:indexPath];
            break;

        default:
            break;
    }




    return cell;
}
- (IBAction)chartButtonClick:(id)sender {


    THChatVC *chartVc=[[THChatVC alloc]init];
    [self.navigationController pushViewController:chartVc animated:YES];
}
@end
