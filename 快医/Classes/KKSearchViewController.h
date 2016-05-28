//
//  KKSearchViewController.h
//  快医
//
//  Created by 柯平常 on 16/5/12.
//  Copyright © 2016年 bear. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KKSearchViewController : UIViewController
//
@property (nonatomic, copy) NSString *searchPlistName;
@property (nonatomic, copy) void(^keyWordBlock)(NSString *keyWorld);

@end
