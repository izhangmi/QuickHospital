//
//  DiseaseChioseController.m
//  快医
//
//  Created by 付凯琪 on 16/5/13.
//  Copyright © 2016年 bear. All rights reserved.
//

#import "DiseaseChioseController.h"
#import "HospitalListView.h"

@interface DiseaseChioseController ()
@property (nonatomic, weak) HospitalListView *diseaseChioseView;

@end

@implementation DiseaseChioseController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    HospitalListView *diseaseChioseView = [[HospitalListView alloc] init];
        diseaseChioseView.plistName = @"DiseaseChoice.plist";
    _diseaseChioseView = diseaseChioseView;
    _diseaseChioseView.ChoiceStr = self.ChoiceStr;
    [self.view addSubview:diseaseChioseView];

}


#pragma mark - 下拉动画

- (void)viewDidAppear:(BOOL)animated{
    
    [UIView animateWithDuration:0.3 animations:^{
        
        _diseaseChioseView.y = 0;
        
    }completion:^(BOOL finished) {
        
        _diseaseChioseView.height = _diseaseChioseView.height - 60;
        
    }];
    
    
}

//- (void)setChoiceStr:(NSString *)ChoiceStr{
//
//    _ChoiceStr = ChoiceStr;
//    _diseaseChioseView.ChoiceStr = ChoiceStr;
//    
//}

@end
