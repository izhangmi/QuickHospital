//
//  MacthedDoctorCell.m
//  快医
//
//  Created by bear on 16/5/12.
//  Copyright © 2016年 bear. All rights reserved.
//

#import "MacthedDoctorCell.h"


@interface MacthedDoctorCell ()
@property (weak, nonatomic) IBOutlet UIImageView *headPic;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *positionLabel;
@property (weak, nonatomic) IBOutlet UILabel *hospitalNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *operation_count_Label;
@property (weak, nonatomic) IBOutlet UILabel *flowerLabel;

@property (weak, nonatomic) IBOutlet UILabel *banner;

@property (weak, nonatomic) IBOutlet UILabel *accuracyLabel;

@end

@implementation MacthedDoctorCell

+ (instancetype)cellWithTableView:(UITableView *)tableVeiw {
    static NSString *ID = @"MacthedDoctorCell";
    MacthedDoctorCell *cell = [tableVeiw dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"MatchedDoctorCell" owner:nil options:nil] lastObject];
    }
    return cell;
}

-(void)awakeFromNib{




}

-(void)setMatchedDoctor:(MatchedDoctor *)matchedDoctor{
    _matchedDoctor=matchedDoctor;
    self.nameLabel.text=matchedDoctor.doctor_name;
    self.positionLabel.text=matchedDoctor.doctor_title_name;
    self.positionLabel.text=matchedDoctor.doctor_hospital_name;
    self.operation_count_Label.text=[NSString stringWithFormat:@"%zd",matchedDoctor.operation_count];
    self.flowerLabel.text=[NSString stringWithFormat:@"%zd",matchedDoctor.flower];

    self.banner.text=[NSString stringWithFormat:@"%zd",matchedDoctor.banner];
    self.accuracyLabel.text=matchedDoctor.accuracy;




}


@end
