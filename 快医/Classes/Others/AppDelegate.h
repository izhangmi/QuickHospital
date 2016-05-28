//
//  AppDelegate.h
//  快医
//
//  Created by bear on 16/5/9.
//  Copyright © 2016年 bear. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RESideMenu.h"
#import <GeTuiSdk.h>

#define kGtAppId           @"zEb0aaoJNV6J0c1FmEUGs4"
#define kGtAppKey          @"8KEOuqF3618DV69gU3wRW3"
#define kGtAppSecret       @"eD6GeQ7rfq7aRpEZf2CUD3"
#define kSmsAppKey         @"12a482fe910ee"
#define kSmsAppSecret      @"ecb719aa195b25ffe9cb53dcc0c724d5"


@interface AppDelegate : UIResponder <UIApplicationDelegate,RESideMenuDelegate,GeTuiSdkDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (nonatomic, strong) RESideMenu *sideMenuViewController;


@property (nonatomic,assign)BOOL loginStatus;


@end

