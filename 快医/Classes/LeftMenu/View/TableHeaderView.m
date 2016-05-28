//
//  TableHeaderView.m
//  2.第二题-tableView
//
//  Created by 柯平常 on 16/5/5.
//  Copyright © 2016年 柯平常. All rights reserved.
//

#import "TableHeaderView.h"

@interface TableHeaderView ()

@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UILabel *userNameLabel;


@end




@implementation TableHeaderView


- (IBAction)setUserInfo:(id)sender {
    
    UIViewController *vC= [[UIStoryboard storyboardWithName:@"Info" bundle:nil] instantiateInitialViewController];
    [[NSNotificationCenter defaultCenter]postNotificationName:@"pushVc" object:nil userInfo:@{@"vC":vC}];
    
}




+(instancetype)headerView{
    
//    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(changeUserIcon:) name:@"changeUserIcon" object:nil];
    TableHeaderView *headerView = [[[NSBundle mainBundle]loadNibNamed:@"TableHeaderView" owner:nil options:nil]lastObject];
    
    headerView.iconImageView.layer.cornerRadius = headerView.iconImageView.width / 2;
    headerView.iconImageView.clipsToBounds = YES;
    
    
    
    return headerView;
}

//- (void)changeUserIcon:(NSNotification *)notify{
//
//
//    UIImage *image = notify.object;
//    self.iconImageView.image = image;
//
//
//}
//
//
//- (void)dealloc{
//
//    [[NSNotificationCenter defaultCenter]removeObserver:self];
//}




@end
