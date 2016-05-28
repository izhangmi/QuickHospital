//
//  HomeController.m
//  快医
//
//  Created by bear on 16/5/9.
//  Copyright © 2016年 bear. All rights reserved.
//

#import "HomeController.h"
#import "CCHttpTool.h"
#import "UIBarButtonItem+CC.h"
#import "Banner.h"
#import "AppointmentView.h"
#import "SortsView.h"
#import "NotificationController.h"
#import "Weather.h"


@implementation HomeController


-(void)viewDidLoad{





    self.title=@"114快医";


    
    UIBarButtonItem *leftBarItem=  [UIBarButtonItem itemWithIcon:@"ic_navigation_more_normal" highlightedIcon:@"ic_navigation_more_normal" target:self action:@selector(leftBarItemClick)];
    
    UIBarButtonItem *rightBarItem= [UIBarButtonItem itemWithIcon:@"ic_message_normal" highlightedIcon:@"ic_message_normal" target:self action:@selector(rightBarItemClick)];
    
    self.navigationItem.leftBarButtonItem=leftBarItem;
    
    self.navigationItem.rightBarButtonItem=rightBarItem;
    
    self.view.backgroundColor=COLOR(237, 237, 237, 1);

    self.navigationController.view.layer.shadowOffset=CGSizeMake(-2,0 );
    
    self.navigationController.view.layer.shadowColor = [UIColor grayColor].CGColor;
    self.navigationController.view.layer.shadowOpacity = 0.4;
    

    self.tableView.showsVerticalScrollIndicator=NO;

    self.tableView.tableFooterView=[[UITableViewHeaderFooterView alloc]init];
    self.tableView.separatorStyle=UITableViewCellSeparatorStyleNone;


    

    [self.tableView setBackgroundColor:[UIColor whiteColor]];


}



-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 4;
}
    
    


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    UITableViewCell *cell=[[UITableViewCell alloc]init];


    switch (indexPath.row) {
        case 0:

            [cell.contentView addSubview:[self addWeather]];
            break;
        case 1:

            [cell.contentView addSubview:[self addBanner]];
            break;
        case 2:
            [cell.contentView addSubview:[self addAppointmentView]];
            break;
        case 3:
            [cell.contentView addSubview:[self addSortsView]];
            break;

        default:
            break;
    }


        cell.selectionStyle = UITableViewCellSelectionStyleNone;

    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    CGFloat height;
    switch (indexPath.row) {
        case 0:
            height=60;
            break;
        case 1:
            height=193;
            break;
        case 2:
            height=115;
            break;
        case 3:
            height=180;
            break;


        default:
            break;
    }
    return height;
}



-(Weather *)addWeather{


    Weather *weather = [Weather weather];

    weather.parentNavVc=self.navigationController;

    weather.frame=CGRectMake(0, 0, SCREEN_WIDTH, 60);

    weather.city=@"beijing";

    [weather setJump2VC:^(UIViewController *TargetVc) {

        [self.navigationController pushViewController:TargetVc animated:YES];
    }];

    return weather;

}

-(UIView *)addBanner{
    
    Banner *banner=[[Banner alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 183)];




    [banner setJump2VC:^(UIViewController * TargetVc) {


        [self.navigationController pushViewController:TargetVc animated:YES];

    }];
    NSLog(@"%@",NSStringFromCGRect(self.view.frame));
    return banner;

}


-(UIView *)addAppointmentView{
    AppointmentView *appointmentV=[AppointmentView appointmentViewWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 105)];
    
    appointmentV.backgroundColor=[UIColor whiteColor];
    
    [self.view addSubview:appointmentV];

   [appointmentV setJump2VC:^(UIViewController * TargetVc) {


        [self.navigationController pushViewController:TargetVc animated:YES];
        
    }];

    return appointmentV;

}



-(UIView *)addSortsView{
    SortsView *sortsView=[[SortsView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-298)];
    __weak typeof(self) weakSelf = self ;
    [sortsView setGetNavigationControllerBlock:^UINavigationController *{
        return weakSelf.navigationController;
    }];

    [sortsView setJump2VC:^(UIViewController *TargetVc) {
        [self.navigationController pushViewController:TargetVc animated:YES];
    }];



    sortsView.backgroundColor=[UIColor whiteColor];
    return sortsView;
}


//打开左边菜单 
-(void)leftBarItemClick{
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"switchLeftMenu" object:nil];
    
}


//消息按钮
-(void)rightBarItemClick{

    [self.navigationController pushViewController:[[NotificationController alloc]init] animated:YES];
    
}
@end
