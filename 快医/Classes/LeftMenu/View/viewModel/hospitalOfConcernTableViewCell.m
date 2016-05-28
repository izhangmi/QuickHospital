//
//  hospitalOfConcernTableViewCell.m
//  我的收藏
//
//  Created by 朱宁MacPro on 16/5/10.
//  Copyright © 2016年 朱宁MacPro. All rights reserved.
//

#import "hospitalOfConcernTableViewCell.h"


@interface hospitalOfConcernTableViewCell ()

@property (weak, nonatomic) IBOutlet UIImageView *hospicalIconView;
@property (weak, nonatomic) IBOutlet UILabel *hospitalTitle;
@property (weak, nonatomic) IBOutlet UILabel *hospitalGradeTitle;

@property (weak, nonatomic) IBOutlet UILabel *hospitalLocationTitle;
@property (weak, nonatomic) IBOutlet UIImageView *locationTitle;
@property (weak, nonatomic) IBOutlet UIButton *rightBtn;

@end



@implementation hospitalOfConcernTableViewCell

-(void)setHospitalModel:(hospitalOfConcernModel *)hospitalModel{

    _hospitalModel = hospitalModel;
    
    self.hospicalIconView.image = [UIImage imageNamed:hospitalModel.hospitalIcon];
//    self.hospicalIconView.backgroundColor = [UIColor grayColor];
    
    
    self.hospitalTitle.text = hospitalModel.hospitalTitle;
    self.hospitalGradeTitle.text = hospitalModel.hospitalGrades;
    self.hospitalGradeTitle.font = [UIFont systemFontOfSize:16];
    
    self.hospitalLocationTitle.text = hospitalModel.hospitalLocation;
    self.hospitalLocationTitle.font = [UIFont systemFontOfSize:14];
    
//    self.rightBtn.backgroundColor = [UIColor blackColor];
    
//    self.locationTitle.backgroundColor = [UIColor redColor];
    


}
+(instancetype)hoispitalCellWithTableView:(UITableView *)tableView{

static NSString *indentifier = @"hospital";
    hospitalOfConcernTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:indentifier];

    if (cell==nil) {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"hospitalOfConcernTableViewCell" owner:nil options:nil]firstObject];
    }
    

    return cell;

}



@end
