//
//  AppointmentView.m
//  快医
//
//  Created by bear on 16/5/9.
//  Copyright © 2016年 bear. All rights reserved.
//

#import "AppointmentView.h"
#import "IconButton.h"
#import "UIColor+CC.h"
#import "HospitalListController.h"
#import "SubjectListController.h"
#import "DiseaseListController.h"

@interface AppointmentView ()


@property (nonatomic, strong) IconButton *hospitalIconBtn;
@property (nonatomic, strong) IconButton *departmentsIconBtn;
@property (nonatomic, strong) IconButton *diseaseIconBtn;

@end

@implementation AppointmentView



+(instancetype)appointmentViewWithFrame:(CGRect )frame{


    return [[self alloc]initWithFrame:frame];
}


-(instancetype)initWithFrame:(CGRect)frame{


    if (self=[super initWithFrame:frame]) {


        

        self.backgroundColor=[UIColor whiteColor];


        UIView *line0=[[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 1)];
        line0.backgroundColor=COLOR(237, 237, 237, 1);
        [self addSubview:line0];

        UIView * greenSilde=[[UIView alloc]initWithFrame:CGRectMake(0, 1, 6, 26)];
        greenSilde.backgroundColor=COLOR(30, 208, 199, 1);
        [self addSubview:greenSilde];

        UILabel *titleLabel=[[UILabel alloc]initWithFrame:CGRectMake(12, 1, SCREEN_WIDTH-6, 26)];
        titleLabel.text=@"预约挂号";
        [self addSubview:titleLabel];


        CGFloat width  = SCREEN_WIDTH/3;
        CGFloat height =78;

        self.hospitalIconBtn =[[IconButton alloc]initWithFrame:CGRectMake(0*width, 27, width, height)];
        [self.hospitalIconBtn setImage:[UIImage imageNamed:@"按医院"] forState:UIControlStateNormal];
        [self.hospitalIconBtn setTitle:@"按医院" forState:UIControlStateNormal];


        [self.hospitalIconBtn addTarget:self action:@selector(jumpToVc) forControlEvents:UIControlEventTouchUpInside];


        [self addSubview:self.hospitalIconBtn];


        self.departmentsIconBtn =[[IconButton alloc]initWithFrame:CGRectMake(1*width, 27, width, height)];
        [self.departmentsIconBtn setImage:[UIImage imageNamed:@"按科室"] forState:UIControlStateNormal];
        [self.departmentsIconBtn setTitle:@"按科室" forState:UIControlStateNormal];



        [self.departmentsIconBtn addTarget:self action:@selector(jump2SubjectListController) forControlEvents:UIControlEventTouchUpInside];


        [self addSubview:self.departmentsIconBtn];

        self.diseaseIconBtn =[[IconButton alloc]initWithFrame:CGRectMake(2*width, 27+1, width, height)];
        [self.diseaseIconBtn setImage:[UIImage imageNamed:@"按疾病"] forState:UIControlStateNormal];
        [self.diseaseIconBtn setTitle:@"按疾病" forState:UIControlStateNormal];

        [self.diseaseIconBtn addTarget:self action:@selector(jump3DiseaseListController) forControlEvents:UIControlEventTouchUpInside];

        [self addSubview:self.diseaseIconBtn];

         UIView *lineBig= [[UIView alloc]initWithFrame:CGRectMake(0, 106, SCREEN_WIDTH, 10-1)];
        lineBig.backgroundColor=THEME_COLOR_LIGHTCRAY;
        [self addSubview:lineBig];
    }


    return self;
}


-(void)jumpToVc{

    HospitalListController *hospitalListVc=[[HospitalListController alloc]init];
    _jump2VC(hospitalListVc);

}

-(void)jump2SubjectListController{

    SubjectListController *subjectVc=[[SubjectListController alloc]init];

    _jump2VC(subjectVc);

}

- (void)jump3DiseaseListController{

    DiseaseListController *diseaseVc = [[DiseaseListController alloc] init];
    
    _jump2VC(diseaseVc);

}

@end
