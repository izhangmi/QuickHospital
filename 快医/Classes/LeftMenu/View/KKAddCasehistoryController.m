//
//  KKAddCasehistoryController.m
//  快医
//
//  Created by 柯平常 on 16/5/10.
//  Copyright © 2016年 bear. All rights reserved.
//

#import "KKAddCasehistoryController.h"
#import "KKAddCasehistoryView.h"
#import <Masonry.h>


@implementation KKAddCasehistoryController


- (void)viewWillAppear:(BOOL)animated{
    
    self.title = @"添加病历";
    self.view.backgroundColor = [UIColor whiteColor];
}


-(void)viewDidLoad{

    
    KKAddCasehistoryView *addcaseView = [[NSBundle mainBundle]loadNibNamed:@"KKAddCasehistoryView" owner:nil options:nil].lastObject;


    [self.view addSubview:addcaseView];

    [addcaseView mas_makeConstraints:^(MASConstraintMaker *make) {
        
//        make.edges.equalTo(self.view);
        make.size.equalTo(self.view);
        make.center.equalTo(self.view);
        
    }];

}



@end
