//
//  CCWebViewController.m
//  快医
//
//  Created by bear on 16/5/13.
//  Copyright © 2016年 bear. All rights reserved.
//

#import "CCWebViewController.h"

@interface CCWebViewController ()

@property (nonatomic, strong) UIWebView *webview;
@end


@implementation CCWebViewController




-(void)loadView{


    self.webview=[[UIWebView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    self.view=self.webview;
}


-(void)viewDidLoad{

    [self loadPage];
}


-(void)setUrlString:(NSString *)urlString{
    _urlString=urlString;
    [self loadPage];
}



-(void)loadPage{
    NSURLRequest  *request =[NSURLRequest requestWithURL:[NSURL  URLWithString:self.urlString]];

    [self.webview loadRequest:request];
}

@end
