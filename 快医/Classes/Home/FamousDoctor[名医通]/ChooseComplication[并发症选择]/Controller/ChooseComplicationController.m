//
//  ChooseComplicationController.m
//  快医
//
//  Created by bear on 16/5/12.
//  Copyright © 2016年 bear. All rights reserved.
//

#import "ChooseComplicationController.h"
#import <MJRefresh.h>
#import "Complication.h"
#import "CCHttpTool.h"

@interface ChooseComplicationController ()

@property (nonatomic, strong) NSMutableArray *complications;

@property (nonatomic, assign) NSInteger page;

@end

@implementation ChooseComplicationController


- (void)viewDidLoad {
    [super viewDidLoad];

    self.title =@"并发症选择";

    self.page=1;

    self.tableView.tableFooterView=[[UITableViewHeaderFooterView alloc]init];

    self.tableView.mj_header =[MJRefreshNormalHeader headerWithRefreshingBlock:^{
        // 进入刷新状态后会自动调用这个block

        [self.complications removeAllObjects];
        [self.tableView reloadData];
        self.page=1;
        [self loadDataFromServer];
    }];
    self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        // 进入刷新状态后会自动调用这个block
        if (self.page>2) {
            [self.tableView.mj_footer endRefreshingWithNoMoreData];
            return ;
        }
        [self loadDataFromServer];
    }];


    [self.tableView.mj_header beginRefreshing];

    [self.tableView  registerClass:[UITableViewCell class] forCellReuseIdentifier:@"chooseDisease"];


}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.complications.count;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"chooseDisease" forIndexPath:indexPath];

    cell.textLabel.text = [self.complications[indexPath.row]  complication_name];


    return cell;
}



-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{


    _handlerBlock(self.complications[indexPath.row]);

    [self.navigationController popViewControllerAnimated:YES];

}


-(void)handlerBlock:(void (^)(Complication *))handlerBlock{
    self.handlerBlock=handlerBlock;
}
-(void)loadDataFromServer{




    //这里  疾病类型 只有三的时候才能查到并发症类型  所以写死了
    NSDictionary *parmas=@{@"page":@(self.page),@"page_size":@15,@"ci2_id":@3};

    [CCHttpTool POST:@"http://iosapi.itcast.cn/doctor/complicationList.json.php" parameters:parmas success:^(id responseObject) {

        
        for (NSDictionary *dict in responseObject[@"data"]) {
            
            Complication *complication=[Complication yy_modelWithDictionary:dict];

            [self.complications addObject:complication];
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


-(NSMutableArray *)complications{
    if (!_complications) {
        _complications=[NSMutableArray array];

    }

    return _complications;
}

@end
