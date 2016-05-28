//
//  WeatherModel.h
//  快医
//
//  Created by bear on 16/5/13.
//  Copyright © 2016年 bear. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YYModel.h"

@interface WeatherModel : NSObject


@property (nonatomic, copy) NSString *weather;

@property (nonatomic, copy) NSString *wind;

@property (nonatomic, copy) NSString *temperature;

@property (nonatomic, copy) NSString *date;

@property (nonatomic, copy) NSString *dayPictureUrl;

@property (nonatomic, copy) NSString *nightPictureUrl;

@end

