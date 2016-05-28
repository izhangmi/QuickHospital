//
//  userCasehistoryInfo.m
//  快医
//
//  Created by 柯平常 on 16/5/12.
//  Copyright © 2016年 bear. All rights reserved.
//

#import "userCasehistoryInfo.h"

@interface userCasehistoryInfo ()


@property (weak, nonatomic) IBOutlet UIButton *chooseCasehistoryBtn;

@property (weak, nonatomic) IBOutlet UIButton *uploadPicBtn;



@end


@implementation userCasehistoryInfo


- (void)layoutSubviews{

    [super layoutSubviews];
    
    
    self.chooseCasehistoryBtn.layer.borderColor = [[UIColor lightGrayColor]CGColor];
    self.chooseCasehistoryBtn.layer.borderWidth = 1.0;
    
    
    self.uploadPicBtn.layer.borderColor = [[UIColor lightGrayColor]CGColor];
    self.uploadPicBtn.layer.borderWidth = 1.0;
    
    


}


- (IBAction)chooseCasehistoryBtnClick:(UIButton *)sender {
    
    
    
    
    
}

- (IBAction)uploadPicBtnClick:(UIButton *)sender {
    
    
    
    
    
    
    
    
}





@end
