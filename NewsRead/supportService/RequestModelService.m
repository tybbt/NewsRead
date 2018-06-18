//
//  RequestModelServiceImpl.m
//  NewsRead
//
//  Created by tybbt on 2018/6/16.
//  Copyright © 2018年 tybbt. All rights reserved.
//

#import "RequestModelService.h"
#import <AFNetworking.h>
#import <AFNetworkReachabilityManager.h>
#import <AFHTTPSessionManager.h>

#import "NewsModel.h"

@implementation RequestModelService

+ (void)GetJsonModel: (JsonBack)completion
{
    NSString * urlString = [NSString stringWithFormat:@"http://123.57.32.66:1920/test"];
    
    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    [manager GET:urlString parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSString * json = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
        dispatch_async(dispatch_get_main_queue(), ^{
            //NSLog(@"请求成功 json：%@",json);
            if (completion) {
                completion(json);
            }
        });
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"请求失败 === %@",error);
    }];
}

+ (NewsModel *)JsonToNewsModel: (NSString *)json
{
    json = [json stringByReplacingOccurrencesOfString:@"\\/" withString:@"/"];
    NSError * error;
    NewsModel * model = [[NewsModel alloc] initWithString:json error:&error];
    return model;
}

+ (UIImage *)getThumbnailWithPath: (NSURL *)thumbPath
{
    UIImage * img = [UIImage imageWithData:[NSData dataWithContentsOfURL:thumbPath]];
    if (!img) {
        img = [UIImage imageNamed:@"placeHolder"];
    }
    return img;
}

@end
