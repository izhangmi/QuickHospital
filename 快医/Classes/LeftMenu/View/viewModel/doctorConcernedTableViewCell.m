//
//  doctorConcernedTableViewCell.m
//  收藏03
//
//  Created by 朱宁MacPro on 16/5/11.
//  Copyright © 2016年 朱宁MacPro. All rights reserved.
//

#import "doctorConcernedTableViewCell.h"
#import <UIImageView+WebCache.h>

@interface doctorConcernedTableViewCell ()
@property (weak, nonatomic) IBOutlet UIImageView *doctorHearView;
@property (weak, nonatomic) IBOutlet UILabel *doctorNameTitle;
@property (weak, nonatomic) IBOutlet UILabel *doctorLevelTitle;
@property (weak, nonatomic) IBOutlet UILabel *doctorHospitalTitle;
@property (weak, nonatomic) IBOutlet UILabel *operationTitle;

@property (weak, nonatomic) IBOutlet UILabel *flowerCount;
@property (weak, nonatomic) IBOutlet UILabel *pennantCountTitle;


@end

@implementation doctorConcernedTableViewCell
-(void)setDoctorConcernedlModel:(concernedDoctorModel *)doctorConcernedlModel{

    _doctorConcernedlModel = doctorConcernedlModel;
    

    
    [self.doctorHearView sd_setImageWithURL:[NSURL URLWithString:doctorConcernedlModel.doctor_portrait]placeholderImage:[UIImage imageNamed:@"user_default"]];
    self.doctorHearView.layer.cornerRadius = 30;
    self.doctorHearView.clipsToBounds = YES;

    self.doctorNameTitle.text = doctorConcernedlModel.doctor_name;
    self.doctorLevelTitle.text = doctorConcernedlModel.doctor_title_name;
    self.doctorHospitalTitle.text = doctorConcernedlModel.hospital_name;
    
    self.operationTitle.text = [NSString stringWithFormat:@"%zd",doctorConcernedlModel.operation_count];
    self.flowerCount.text = [NSString stringWithFormat:@"%zd",doctorConcernedlModel.flower];
    self.pennantCountTitle.text = [NSString stringWithFormat:@"%zd",doctorConcernedlModel.banner];

}


+(instancetype)doctorCellWithTableView:(UITableView *)tableView{

    
    static NSString *indentifier = @"cell";
    doctorConcernedTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:indentifier];
    
    if (cell==nil) {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"doctorConcernedTableViewCell" owner:nil options:nil]lastObject];
    }
    
    
    return cell;




}
- (IBAction)dialogBtn:(id)sender {
    
    
    
}
@end
