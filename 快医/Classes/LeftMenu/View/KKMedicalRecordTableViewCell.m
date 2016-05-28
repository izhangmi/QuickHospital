//
//  KKMedicalRecordTableViewCell.m
//  快医
//
//  Created by 朱宁MacPro on 16/5/13.
//  Copyright © 2016年 bear. All rights reserved.
//

#import "KKMedicalRecordTableViewCell.h"
#define margin 20
#define KWidth [UIScreen mainScreen].bounds.size.width
#define KHeight [UIScreen mainScreen].bounds.size.height

@interface KKMedicalRecordTableViewCell ()


@property (weak, nonatomic) IBOutlet UIView *backView;


@property(nonatomic,strong)IBOutlet UIImageView *iconName;
@property(nonatomic,strong)IBOutlet UILabel *NameLable;
@property(nonatomic,strong)IBOutlet UILabel *reportLable;
@property(nonatomic,strong)IBOutlet UILabel *timeLable;



@end



@implementation KKMedicalRecordTableViewCell

-(instancetype)initWithCoder:(NSCoder *)aDecoder{

    self = [super initWithCoder:aDecoder];
    if (self) {
        
        self.backView.layer.borderColor = [UIColor lightGrayColor].CGColor;
        self.backView.layer.borderWidth = 1;
        self.backView.layer.cornerRadius = 5;
        
    }
    return self;


}
-(void)setModel:(KKmediaclModel *)model{

    _model = model;
    
    self.NameLable.text = model.titleName;
    self.reportLable.text = model.report;
    self.timeLable.text = model.titleName;
    self.iconName.image = [UIImage imageNamed:@"user_default"];
    self.selectBtn.selected = model.selected ;
    
}

-(void)layoutSubviews{

    [super layoutSubviews];

    

}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
        
    
}



@end
