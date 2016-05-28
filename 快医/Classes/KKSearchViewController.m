//
//  KKSearchViewController.m
//  快医
//
//  Created by 柯平常 on 16/5/12.
//  Copyright © 2016年 bear. All rights reserved.
//

#import "KKSearchViewController.h"

#import "RootView.h"

@interface KKSearchViewController () <RootViewDelegate,RootViewDataSource>
@property (nonatomic, strong) RootView       *rootView;
@property (nonatomic, strong) NSMutableArray *testArray;
@property (nonatomic, strong) NSMutableArray *keyWordArray; // 搜索关键字记录
@end

@implementation KKSearchViewController

- (NSMutableArray *)testArray {
    if (!_testArray) {
        _testArray = [[NSMutableArray alloc] init];
    }
    return _testArray;
}

- (NSMutableArray *)keyWordArray {
    
    if (!_keyWordArray) {
        // *** 当文件为空时，创建会失败
        _keyWordArray = [NSMutableArray arrayWithContentsOfFile:[self getCachePath]];
    }
    // ***  所以要再次判断
    if (!_keyWordArray) {
        _keyWordArray = [[NSMutableArray alloc] init];
    }
    return _keyWordArray;
}

- (void)loadView {
    
    _rootView = [[[NSBundle mainBundle] loadNibNamed:@"RootView" owner:self options:nil] lastObject];
    _rootView.delegate = self;
    _rootView.datasource = self;
    
    __weak typeof(self) weakself = self;
    //MARK: 加载view
    _rootView.backblock = ^(){
    
        [weakself dismissViewControllerAnimated:YES completion:nil];
    };
    self.view = _rootView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

#pragma mark -
#pragma mark - CustomView代理


- (NSArray *)searchView:(RootView *)searchView {
    
    // 此代理方法的作用是提供开始输入时所展示的全部搜索记录
    return self.keyWordArray;
}

- (void)searchView:(RootView *)searchView didSelectKeyWord:(NSString *)keyword {
    
    [self dismissViewControllerAnimated:NO completion:nil];
    
    if (self.keyWordBlock) {
        self.keyWordBlock(keyword);
    }
}

- (void)searchView:(RootView *)searchView didDeleteKeyWord:(NSString *)keyword {
    
    // 此代理方法的作用是获取到删除的关键字后删除本地缓存的关键字。
    NSArray *keyArray = [self.keyWordArray copy];
    for (NSString *key in keyArray) {
        if ([key isEqualToString:keyword]) {
            [self.keyWordArray removeObject:key];
            [self seaveKayWord];
        }
    }
    NSLog(@"删除的关键字为:%@",keyword);
}

- (NSArray *)searchView:(RootView *)searchView didInputKeyWord:(NSString *)keyword {
    
    // 此代理方法的作用是获取到输入中的关键字后在本地缓存中模糊匹配,再把结果返回给视图,视图拿到匹配结果后,动态刷新候选关键字。
    [self.testArray removeAllObjects];
    for (NSString *key in self.keyWordArray) {
        if ([key containsString:keyword]) {
            [self.testArray addObject:key];
        }
    }
    NSLog(@"正在输入的关键字为:%@",keyword);
    return self.testArray;
}

- (void)searchView:(RootView *)searchView shouldReturnKeyWord:(NSString *)keyword {
    
    // 此代理方法的作用是获取到点击搜索按钮后搜索框中的关键字,在本地缓存中查找后再判断是否要保存到本地。
    BOOL isExist = NO;
    for (NSString *key in self.keyWordArray) {
        if ([key isEqualToString:keyword]) {
            isExist = YES;
        }
    }
    
    if (!isExist) {
        [self.keyWordArray insertObject:keyword atIndex:0];
        [self seaveKayWord];
    }
    NSLog(@"搜索的关键字为:%@",keyword);
}

#pragma mark -
#pragma mark - 数据缓存相关操作

- (void)seaveKayWord {
    
    // 此方法的作用是将关键字以数组的格式保存到本地。
    [self.keyWordArray writeToFile:[self getCachePath] atomically:YES];
}

- (NSString *)getCachePath {
    
    // 此方法的作用是获取本地缓存路径。
//    NSArray *cacPath = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
//    NSString *cachePath = [cacPath objectAtIndex:0];
//    NSString *path = [cachePath stringByAppendingString:@"/keyword.plist"];
    NSString *path = [[NSBundle mainBundle]pathForResource:self.searchPlistName ofType:@"plist"];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if (![fileManager fileExistsAtPath:path]) {
        [fileManager createFileAtPath:path contents:nil attributes:nil];
    }
    return path;
}
@end

