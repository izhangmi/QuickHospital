//
//  SubjectChoiceController.m
//  快医
//
//  Created by 付凯琪 on 16/5/13.
//  Copyright © 2016年 bear. All rights reserved.
//

#import "SubjectChoiceController.h"
#import "HospitalListView.h"
@interface SubjectChoiceController ()
@property (nonatomic, weak) HospitalListView *SubjectView;
@end

@implementation SubjectChoiceController
- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    HospitalListView *SubjectView = [[HospitalListView alloc] init];
    SubjectView.plistName = @"DiseaseChoice.plist";
    _SubjectView = SubjectView;
    _SubjectView.ChoiceStr = self.ChoiceStr;
    [self.view addSubview:SubjectView];
    
}


#pragma mark - 下拉动画

- (void)viewDidAppear:(BOOL)animated{
    
    [UIView animateWithDuration:0.3 animations:^{
        
        _SubjectView.y = 0;
        
    }completion:^(BOOL finished) {
        
        _SubjectView.height = _SubjectView.height - 60;
        
    }];
    
    
}

@end
