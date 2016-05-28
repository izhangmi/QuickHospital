//
//  ChooseDiseaseController.m
//  快医
//
//  Created by bear on 16/5/12.
//  Copyright © 2016年 bear. All rights reserved.
//

#import "ChooseDiseaseController.h"
#import "CCHttpTool.h"
#import <MJRefresh.h>
#import "ChooseDisease.h"

@interface ChooseDiseaseController ()

@property (nonatomic, strong) NSMutableArray *diseases;

@property (nonatomic, assign) NSInteger page;

@end

@implementation ChooseDiseaseController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title =@"疾病细分种类选择";

    self.page=1;
    self.tableView.tableFooterView=[[UITableViewHeaderFooterView alloc]init];

    self.tableView.mj_header =[MJRefreshNormalHeader headerWithRefreshingBlock:^{
        // 进入刷新状态后会自动调用这个block

        [self.diseases removeAllObjects];
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

    return self.diseases.count;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"chooseDisease" forIndexPath:indexPath];

    cell.textLabel.text = [self.diseases[indexPath.row]  ci3_name];

    
    return cell;
}



-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    _handlerBlock(self.diseases[indexPath.row]);
    [self.navigationController popViewControllerAnimated:YES];

}


-(void)handlerBlock:(void (^)(ChooseDisease *))handlerBlock{
    self.handlerBlock=handlerBlock;
}
-(void)loadDataFromServer{

    NSDictionary *parmas=@{@"page":@(self.page),@"page_size":@15,@"ci1_id":self.ci1_id,@"keyword":@""};

    [CCHttpTool POST:@"http://iosapi.itcast.cn/doctor/searchCI3List.json.php" parameters:parmas success:^(id responseObject) {


        NSLog(@"%@--------- ",responseObject);
        for (NSDictionary *dict in responseObject[@"data"]) {
            ChooseDisease *disease=[ChooseDisease yy_modelWithDictionary:dict];

            [self.diseases addObject:disease];
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


-(NSMutableArray *)diseases{

    if (!_diseases) {
        _diseases = [NSMutableArray array];
    }

    return _diseases;
}

@end
