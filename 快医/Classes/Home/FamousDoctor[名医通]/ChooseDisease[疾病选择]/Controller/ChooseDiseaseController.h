//
//  ChooseDiseaseController.h
//  快医
//
//  Created by bear on 16/5/12.
//  Copyright © 2016年 bear. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ChooseDisease.h"


@interface ChooseDiseaseController : UITableViewController

@property (nonatomic,strong) NSNumber  *ci1_id;


@property (nonatomic, copy) void(^handlerBlock)(ChooseDisease * disease);

-(void)handlerBlock: (void(^)(ChooseDisease * disease)) handlerBlock ;

@end
