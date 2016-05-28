//
//  DiseaseViewController.m
//  快医
//
//  Created by bear on 16/5/12.
//  Copyright © 2016年 bear. All rights reserved.
//

#import "DiseaseViewController.h"
#import "MatchedDoctorController.h"
#import "ChooseDiseaseController.h"
#import "ChooseDisease.h"
#import "ChooseComplicationController.h"
#import "Complication.h"

@interface DiseaseViewController ()
@property (weak, nonatomic) IBOutlet UILabel *diseaseNameLabel;

@property (weak, nonatomic) IBOutlet UILabel *comlicationNameLbel;

@property (nonatomic, strong) ChooseDisease  *disease;
@property (nonatomic, strong) Complication *complication;

@end

@implementation DiseaseViewController



+(instancetype)diseaseViewController{
    UIStoryboard *st=[UIStoryboard storyboardWithName:@"DiseaseViewController" bundle:[NSBundle mainBundle]];

    return [st instantiateInitialViewController];
}




-(void)viewDidLoad{
    [super viewDidLoad];

    self.title=@"疾病细分";
}
- (IBAction)chooseDiseaseClick {



    ChooseDiseaseController *chooseDiseaseVc=[[ChooseDiseaseController alloc]init];

    [chooseDiseaseVc handlerBlock:^(ChooseDisease *disease) {

        self.disease =disease;
        self.diseaseNameLabel.text=disease.ci3_name;

    }];
    

    chooseDiseaseVc.ci1_id=self.ci1_id;
    [self.navigationController pushViewController:chooseDiseaseVc animated:YES];
}

- (IBAction)complicationBtnClick:(id)sender {


    ChooseComplicationController *chooseComplicationVc=[[ChooseComplicationController alloc]init];

    chooseComplicationVc.ci2_id=self.disease.ci2_id;

    [chooseComplicationVc setHandlerBlock:^(Complication *complication) {

        self.complication=complication;

        self.comlicationNameLbel.text=complication.complication_name;
    }];

    [self.navigationController pushViewController:chooseComplicationVc animated:YES];

}

- (IBAction)matchDoctorBtnClick:(id)sender {

    [self.navigationController pushViewController:[[MatchedDoctorController alloc]init] animated:YES];
}

@end
