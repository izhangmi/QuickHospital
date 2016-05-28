//
//  TableHeader.m
//  团购
//
//  Created by bear on 16/3/9.
//  Copyright © 2016年 bear. All rights reserved.
//

#import "Banner.h"
#import "CCHttpTool.h"
#import "UIColor+CC.h"
#import "CCWebViewController.h"


#define IMAGE_COUNT 5

@interface Banner ()<UIScrollViewDelegate>{
    int oldPage;
    BOOL isBack;
}
@property (strong, nonatomic)  UIScrollView *scrollView;
@property (strong, nonatomic) UIPageControl *pageControl;
@property (nonatomic, strong)NSTimer *timer;

@end

@implementation Banner









-(instancetype)initWithFrame:(CGRect)frame{


    if (self=[super initWithFrame:frame]) {

            [self setUI];


        [self loadDataFromServer];
    }


    return self;
}


-(void)loadDataFromServer{

    NSString *UrlStr =[NSString stringWithFormat:@"%@%@",APIURL,@"carelinkQuickLogin.json.php"];


    NSLog(@"%@",UrlStr);

    NSDictionary *parmas=@{@"page_size":@10,@"page":@1};

    [CCHttpTool POST:UrlStr parameters:parmas success:^(id responseObject) {


        NSLog(@"%@",responseObject);

    } failure:^(NSError *error) {


    }];
}


-(void)setUI{

    _scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, self.width, self.height-15)];
    [self addSubview:_scrollView];
    _pageControl =[[UIPageControl alloc]initWithFrame:CGRectMake(40, self.height-45, self.width-60, 30)];

    [self addSubview:_pageControl];
    UIView *linew= [[UIView alloc]initWithFrame:CGRectMake(0, 183, SCREEN_WIDTH, 10)];
//    linew.backgroundColor=[UIColor colorWithHex:0xEDEDED];
    [self addSubview:linew];

    UIView *lineBig= [[UIView alloc]initWithFrame:CGRectMake(0, 188, SCREEN_WIDTH, 10)];
    lineBig.backgroundColor=[UIColor colorWithHex:0xEDEDED];
    [self addSubview:lineBig];
    

    _scrollView.backgroundColor=[UIColor grayColor];


    self.backgroundColor = [UIColor yellowColor];

    _scrollView.height=self.height;
    _scrollView.width=self.width;

    CGFloat imageW=_scrollView.width;
    CGFloat imageH=_scrollView.frame.size.height;

    for (int i=0; i<IMAGE_COUNT; i++) {
        UIButton *imageButton=[UIButton buttonWithType:UIButtonTypeCustom];



        imageButton.frame=CGRectMake(imageW*i, 0, imageW, imageH);

        [imageButton setBackgroundImage:[UIImage imageNamed:@"bannerpic"] forState:UIControlStateNormal];

        imageButton.tag=i;




        [self.scrollView addSubview:imageButton];

        [imageButton addTarget:self action:@selector(imageBtnClk:) forControlEvents:UIControlEventTouchUpInside];

    }
    //设置内容大小/滚动范围大小
    _scrollView.contentSize=CGSizeMake(SCREEN_WIDTH*5, imageH);

    //隐藏横向滚动条
    _scrollView.showsHorizontalScrollIndicator=NO;

    //无弹性
    _scrollView.bounces=NO;

    //设置是否允许分页  水平方向分页  以  scrollView的宽度分页
    _scrollView.pagingEnabled=YES;

    _pageControl.numberOfPages=IMAGE_COUNT;

    _pageControl.currentPage=0;
    //当前页颜色
    _pageControl.currentPageIndicatorTintColor=[UIColor orangeColor];
    //默认页颜色
//    _pageControl.pageIndicatorTintColor=[UIColor redColor];



    [self bringSubviewToFront:_pageControl];
    _scrollView.delegate=self;
    
    
    [self timer];
    
}




-(void)next{

    if (_pageControl.currentPage==IMAGE_COUNT-1) {
        isBack=YES;
        oldPage=(int)_pageControl.currentPage;

    }else if(_pageControl.currentPage==0){
        isBack=NO;
        oldPage=(int)_pageControl.currentPage;

    }
    if (isBack) {
        _pageControl.currentPage--;

    }else{
        _pageControl.currentPage++;

    }

    [_scrollView setContentOffset:CGPointMake(_scrollView.width*(_pageControl.currentPage), 0)animated:YES];
}




#pragma 开始拖动时
-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{

    oldPage=(int)_pageControl.currentPage;

    [self.timer invalidate];
    self.timer=nil;

}


/**
 *  减速完成   完全停止滚动
 *
 *  @param scrollView scrollView
 */
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    [self timer];

    if (oldPage>_pageControl.currentPage) {
        isBack=YES;
    }else if(oldPage< _pageControl.currentPage){
        isBack=NO;
    }
}


//监听滚动  滚动中会一直调用
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    //当滚动一大半时 标记变为下一页


    _pageControl.currentPage=(scrollView.contentOffset.x+_scrollView.bounds.size.width*0.6)/_scrollView.bounds.size.width;


    //    NSLog(@"old----%d------new---%d",oldPage,(int)_pageControl.currentPage);

}

-(NSTimer *)timer{
    if (_timer==nil) {
        _timer=[NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(next) userInfo:@"test" repeats:YES];

        [[NSRunLoop currentRunLoop] addTimer:_timer forMode:NSRunLoopCommonModes];
    }
    return _timer;
}



-(void)imageBtnClk:(UIButton *)sender{

    CCWebViewController *webVc =[[CCWebViewController alloc]init];

    webVc.title=@"CC's blog";
    webVc.urlString=@"http://www.xiongcaichang.com/m/";
    self.jump2VC(webVc);

}

@end
