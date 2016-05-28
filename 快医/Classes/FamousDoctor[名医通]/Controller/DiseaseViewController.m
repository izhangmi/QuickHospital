//
//  DiseaseViewController.m
//  快医
//
//  Created by bear on 16/5/12.
//  Copyright © 2016年 bear. All rights reserved.
//

#import "DiseaseViewController.h"

@implementation DiseaseViewController



+(instancetype)diseaseViewController{
    UIStoryboard *st=[UIStoryboard storyboardWithName:@"DiseaseViewController" bundle:[NSBundle mainBundle]];

    return [st instantiateInitialViewController];
}
@end
