//
//  Weather.m
//  快医
//
//  Created by bear on 16/5/13.
//  Copyright © 2016年 bear. All rights reserved.
//

#import "Weather.h"
#import "WeatherModel.h"
#import "UIImageView+AFNetworking.h"
#import "ChooseCityController.h"
#import "CCHttpTool.h"
#import "NSString+CC.h"

@interface Weather ()


@property (nonatomic, strong) NSMutableArray *weathers;
@property (strong, nonatomic) IBOutlet UIImageView *weatherPic;
@property (strong, nonatomic) IBOutlet UIButton *cityNameButton;
@property (strong, nonatomic) IBOutlet UILabel *temperatureLabel;

@end

@implementation Weather

+(instancetype)weather{

    return [[Weather alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 60)];

}


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {

        _weatherPic =[[UIImageView alloc]init];


        [self addSubview:_weatherPic];
        _cityNameButton=[UIButton buttonWithType:UIButtonTypeCustom];


        [self addSubview:_cityNameButton];
        _temperatureLabel=[[UILabel alloc]init];


        [self addSubview:_temperatureLabel];

    }
    return self;
}


-(void)layoutSubviews{
    [super layoutSubviews];
    _weatherPic.frame=CGRectMake(10, 10, 40, 40);
    _temperatureLabel.frame=CGRectMake(60, 10, SCREEN_WIDTH-200, 40);
    [_temperatureLabel setTextColor:[UIColor whiteColor]];
    _cityNameButton.frame=CGRectMake(SCREEN_WIDTH-130, 10, 110, 40);
    [_cityNameButton setTitle:@"北京" forState:UIControlStateNormal];

    _temperatureLabel.backgroundColor=THEME_COLOR_GREEN;
    _cityNameButton.backgroundColor=THEME_COLOR_GREEN;
    [_cityNameButton addTarget:self action:@selector(chooseCityClick:) forControlEvents:UIControlEventTouchUpInside];


}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{

}
- (IBAction)chooseCityClick:(id)sender {



    ChooseCityController *chooseVc=[[ChooseCityController alloc]init];



    [chooseVc setHandlerBlock:^(NSString *cityName) {

        [self.cityNameButton setTitle:cityName forState:UIControlStateNormal];

        NSString *pinYin=[NSString transformChinsesToPinyin:cityName];


        




        pinYin = [pinYin stringByReplacingOccurrencesOfString:@" " withString:@""];
        NSLog(@"%@",pinYin);
        
        [self setCity:pinYin];



        

    }];

    _jump2VC(chooseVc);

    

      





}


-(void)setCity:(NSString *)city{

    _city=city;


    self.backgroundColor=[UIColor whiteColor];

    [CCHttpTool GET:kGetWeather_URL(city) parameters:nil success:^(id responseObject) {

    NSDictionary *dict =    [ [responseObject[@"results"]lastObject][@"weather_data"] firstObject];
        WeatherModel *weatherModel =[WeatherModel yy_modelWithDictionary:dict];

        dispatch_async(dispatch_get_main_queue(), ^{

            [self.weatherPic setImageWithURL:[NSURL URLWithString:weatherModel.dayPictureUrl]];

            self.temperatureLabel.text=[NSString stringWithFormat:@"%@   %@",weatherModel.weather,weatherModel.temperature];
        });




        

    } failure:^(NSError *error) {


    }];
}



@end
