//
//  MatchedDoctorController.m
//  快医
//
//  Created by bear on 16/5/12.
//  Copyright © 2016年 bear. All rights reserved.
//

#import "MatchedDoctorController.h"
#import "MacthedDoctorCell.h"
#import "DoctorInfoController.h"
#import "MatchedDoctor.h"
#import <MJRefresh.h>
#import "CCHttpTool.h"

@interface MatchedDoctorController ()

@property (nonatomic, strong) NSMutableArray *matchedDoctors;

@property (nonatomic, assign) NSInteger page;
@end

@implementation MatchedDoctorController


+(instancetype)matchedDoctorController{
    UIStoryboard *st =[UIStoryboard storyboardWithName:@"MatchedDoctorController" bundle:nil] ;

    return [st instantiateInitialViewController];
}

-(void)viewDidLoad{



    self.title = @"医生选择";
    self.page=1;

    self.tableView.mj_header=[MJRefreshNormalHeader  headerWithRefreshingBlock:^{

        [self.matchedDoctors removeAllObjects];

        [self.tableView reloadData];
        self.page=1;
        [self loadDataFromServer];
    }];

    self.tableView.mj_footer=[MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{


        if (self.page>3) {
            [self.tableView.mj_footer endRefreshingWithNoMoreData];
            return ;
        }
        [self loadDataFromServer];
    }];


    [self.tableView.mj_header beginRefreshing];

}



-(void)loadDataFromServer{




    //这里  疾病类型 只有三的时候才能查到并发症类型  所以写死了
    NSDictionary *parmas=@{@"ci1_id":@1,@"ci2_id":@3,@"ci3_id":@3,@"diagnosis_type":@0,@"page_size":@15,@"is_confirmed":@1,@"user_id":@1000089, @"page":@(self.page),@"has_diagnosis":@2}
;

    [CCHttpTool POST:@"http://iosapi.itcast.cn/doctor/matchDoctors.json.php" parameters:parmas success:^(id responseObject) {


        for (NSDictionary *dict in responseObject[@"data"]) {


            MatchedDoctor *doctor=[MatchedDoctor yy_modelWithDictionary:dict];

            [self.matchedDoctors addObject:doctor];
        }

        dispatch_async(dispatch_get_main_queue(), ^{

            [self.tableView reloadData];

            [self.tableView.mj_header endRefreshing];
            [self.tableView.mj_footer endRefreshing];
        });

        
    } failure:^(NSError *error) {
        
        
    }];
    
    self.page++;
    
}







-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.matchedDoctors.count;
}



-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *view =[[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 20)];

    view.backgroundColor =[UIColor lightGrayColor];
    return view;
}



-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{


   MacthedDoctorCell *cell = [MacthedDoctorCell cellWithTableView:tableView];


    cell.matchedDoctor=self.matchedDoctors[indexPath.row];



    return cell;
}



-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{


    [self.navigationController pushViewController:[DoctorInfoController doctorInfoController] animated:YES];
}

-(CGFloat )tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80;
}



-(NSMutableArray *)matchedDoctors{
    if (!_matchedDoctors) {
        _matchedDoctors=[NSMutableArray array];
    }
    return _matchedDoctors;
}
@end
