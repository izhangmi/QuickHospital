//
//  CCHttpTool.m
//  hedaAssistant
//
//  Created by bear on 16/3/23.
//  Copyright © 2016年 bear. All rights reserved.
//

#import "CCHttpTool.h"

@implementation CCHttpTool : NSObject


+(void)GET:(NSString *)URLString
parameters:(id)parameters
success:(void (^)(id responseObject))success
failure:(void (^)(NSError *error))failure{


    [UIApplication sharedApplication].networkActivityIndicatorVisible=YES;


    AFHTTPSessionManager *manager=[AFHTTPSessionManager manager];


    manager.requestSerializer = [AFJSONRequestSerializer serializer];

    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    NSSet *set = [NSSet setWithObjects:@"text/plain", @"text/html",nil];


    manager.responseSerializer.acceptableContentTypes = [manager.responseSerializer.acceptableContentTypes setByAddingObjectsFromSet:set];


    [manager GET:URLString parameters:parameters progress:^(NSProgress * _Nonnull downloadProgress) {


    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {

        responseObject=[NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];

        success(responseObject);
        [UIApplication sharedApplication].networkActivityIndicatorVisible=NO;


    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {

        failure(error);
        [UIApplication sharedApplication].networkActivityIndicatorVisible=NO;

        

    }];

}



+ (void)POST:(NSString *)URLString
  parameters:(id)parameters
     success:(void (^)(id responseObject))success
     failure:(void (^)(NSError *error))failure{



    [UIApplication sharedApplication].networkActivityIndicatorVisible=YES;


    AFHTTPSessionManager *manager=[AFHTTPSessionManager manager];


    manager.requestSerializer = [AFJSONRequestSerializer serializer];

    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    NSSet *set = [NSSet setWithObjects:@"text/plain", @"text/html",nil];


    manager.responseSerializer.acceptableContentTypes = [manager.responseSerializer.acceptableContentTypes setByAddingObjectsFromSet:set];


    [manager POST:URLString parameters:parameters progress:^(NSProgress * _Nonnull downloadProgress) {


    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {

        responseObject=[NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];

        success(responseObject);
        [UIApplication sharedApplication].networkActivityIndicatorVisible=NO;


    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {

        failure(error);
        [UIApplication sharedApplication].networkActivityIndicatorVisible=NO;
        
        
        
    }];



}





+(void)upload:(NSString *)URLString parmameters:(id)parmameters progress:(void (^)(id))progress success:(void (^)(id))success failure:(void (^)(NSError *))failure{

    //    NSURLRequest *request=[[NSURLRequest alloc]initWithURL:[NSURL URLWithString:URLString]];

    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];


    [manager POST:URLString parameters:parmameters constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {


    } progress:^(NSProgress * _Nonnull uploadProgress) {


    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {


    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        
    }];
}




+(void)download:(NSString *)URLString destination:(NSString *)destinationURLString parmameters:(id)parmameters progress:(void (^)(id))progress success:(void (^)(id))success failure:(void (^)(NSError *))failure{


       NSURLRequest *request=[[NSURLRequest alloc]initWithURL:[NSURL URLWithString:URLString]];

    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc]initWithSessionConfiguration:configuration];



    NSURLSessionDownloadTask *task = [manager downloadTaskWithRequest:request progress:^(NSProgress * _Nonnull downloadProgress) {



        NSLog(@"progress %f",downloadProgress.fractionCompleted);

    } destination:^NSURL * _Nonnull(NSURL * _Nonnull targetPath, NSURLResponse * _Nonnull response) {



        return targetPath;

    } completionHandler:^(NSURLResponse * _Nonnull response, NSURL * _Nullable filePath, NSError * _Nullable error) {


    }];
    [task resume];
}






-(BOOL)getNetWorkStatus{


    static BOOL  IS_NET_CAN_CONNECT=YES;

    //1.创建网络状态监测管理者
    AFNetworkReachabilityManager *manger = [AFNetworkReachabilityManager sharedManager];

    //2.监听改变
    [manger setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        /*
         AFNetworkReachabilityStatusUnknown          = -1,
         AFNetworkReachabilityStatusNotReachable     = 0,
         AFNetworkReachabilityStatusReachableViaWWAN = 1,
         AFNetworkReachabilityStatusReachableViaWiFi = 2,

         */
        switch (status) {
            case AFNetworkReachabilityStatusUnknown:
                NSLog(@"未知");
                break;
            case AFNetworkReachabilityStatusNotReachable:
                NSLog(@"没有网络");

                IS_NET_CAN_CONNECT=NO;
                break;
            case AFNetworkReachabilityStatusReachableViaWWAN:
                NSLog(@"3G|4G");
                break;
            case AFNetworkReachabilityStatusReachableViaWiFi:
                NSLog(@"WiFi");
                break;
            default:
                break;
        }
    }];


    return IS_NET_CAN_CONNECT;

}


@end
