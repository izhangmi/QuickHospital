//
//  ChooseComplicationController.h
//  快医
//
//  Created by bear on 16/5/12.
//  Copyright © 2016年 bear. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ChooseDisease.h"
#import "Complication.h"

@interface ChooseComplicationController : UITableViewController


@property (nonatomic,strong) NSNumber  *ci2_id;
@property (nonatomic, copy) void (^handlerBlock)(Complication * complication);
-(void)handlerBlock:(void (^)(Complication *))handlerBlock;
@end
