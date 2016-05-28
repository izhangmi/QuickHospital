//
//  KKMyCollectViewController.m
//  快医
//
//  Created by 柯平常 on 16/5/10.
//  Copyright © 2016年 bear. All rights reserved.
//

#import "KKMyCollectViewController.h"
#import "hospitalOfConcernTableView.h"
#import "doctorConcernedTableView.h"
#import "THChatVC.h"

@interface KKMyCollectViewController ()

//@property (nonatomic, strong) UITableView *doctorConcernedTableView;

@end

@implementation KKMyCollectViewController

- (void)initSegmentedControl
{
    NSArray *segmentedData = [[NSArray alloc]initWithObjects:@"关注的医院",@"关注的医生",nil];
    
    //创建
    UISegmentedControl *segmentedControl = [[UISegmentedControl alloc]initWithItems:segmentedData];
    //    segmentedControl.frame = CGRectMake(40.0, 20.0,280.0, 30);
    segmentedControl.frame = CGRectMake(40.0, 20.0,200, 30);
    /*
     这个是设置按下按钮时的颜色
     */
    segmentedControl.tintColor = [UIColor whiteColor];
    segmentedControl.selectedSegmentIndex = 0;//默认选中的按钮索引
    
    /*
     下面的代码实同正常状态和按下状态的属性控制,比如字体的大小和颜色等
     */
    NSDictionary *attributes = [NSDictionary dictionaryWithObjectsAndKeys:[UIFont boldSystemFontOfSize:14],NSFontAttributeName,[UIColor whiteColor], NSForegroundColorAttributeName, nil];
    
    [segmentedControl setTitleTextAttributes:attributes forState:UIControlStateNormal];
    
    
    NSDictionary *highlightedAttributes = [NSDictionary dictionaryWithObject:[UIColor whiteColor] forKey:NSForegroundColorAttributeName];
    
    [segmentedControl setTitleTextAttributes:highlightedAttributes forState:UIControlStateHighlighted];
    
    //设置分段控件点击相应事件
    [segmentedControl addTarget:self action:@selector(doSomethingInSegment:)forControlEvents:UIControlEventValueChanged];
    
    self.navigationItem.titleView = segmentedControl;
}

-(void)doSomethingInSegment:(UISegmentedControl *)Seg
{
    
    NSInteger Index = Seg.selectedSegmentIndex;
    
    switch (Index)
    {
        case 0:
            [self.view addSubview:[[hospitalOfConcernTableView alloc]initWithFrame:self.view.bounds]];
            break;
        case 1:
        {
            doctorConcernedTableView *docView = [[doctorConcernedTableView alloc]initWithFrame:self.view.bounds];
            
            docView.jumpToTChatVc = ^(){
            
                THChatVC *chatVc = [[THChatVC alloc]init];
                [self.navigationController pushViewController:chatVc animated:YES];
                
            };
            
            [self.view addSubview:docView];
            break;
            
        }
        default:
            break;
    }
}

#pragma mark - tableView懒加载







- (void)viewDidLoad
{
    [super viewDidLoad];
    
    hospitalOfConcernTableView *hospitalTableView = [[hospitalOfConcernTableView alloc]initWithFrame:self.view.frame];
    
    //    hospitalTableView.bounces = NO;
    
//    hospitalOfConcernTableView
    
    [self.view addSubview:hospitalTableView];
    
    [self initSegmentedControl];
    
    
}

- (void)viewWillAppear:(BOOL)animated{
    
    //    self.title = @"我的收藏";
    
    self.navigationController.navigationBarHidden=NO;
}



@end