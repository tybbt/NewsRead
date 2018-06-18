//
//  ViewController.m
//  NewsRead
//
//  Created by tybbt on 2018/6/16.
//  Copyright © 2018年 tybbt. All rights reserved.
//

#import "ViewController.h"
#import <AFNetworkReachabilityManager.h>
#import <AFHTTPSessionManager.h>
#import "RequestModelService.h"
#import "NewsModel.h"
#import "NewsTableView.h"
#import "WebViewController.h"

@interface ViewController ()<NewsTableViewDelegate>
@property (nonatomic, strong) NewsTableView * tableView;
@property (nonatomic, copy) NewsModel * model;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController.navigationBar setHidden:YES];
    [self networkStatus];
}

- (void)setNoNetWorkUI
{
    NSLog(@"无网络");
}

- (void)setUI
{
    [self.view addSubview:self.tableView];
    [RequestModelService GetJsonModel:^(NSString *json) {
        NSLog(@"json : %@", json);
        dispatch_async(dispatch_get_main_queue(), ^{
            if (json) {
                self.model = [RequestModelService JsonToNewsModel:json];
                [self initTableView];
            }
        });
    }];
}

- (void)initTableView
{
    [self.tableView setDataSource:self.model.data];
}

- (void)didSelectRowAt:(NSInteger)index
{
    News * info = self.model.data[index];
    NSString * url = info.pageURL;
    WebViewController * controller = [[WebViewController alloc] init];
    controller.urlString = url;
    controller.model = info;
    [self.navigationController pushViewController:controller animated:YES];
}

-(void)networkStatus {
    
    AFNetworkReachabilityManager * manager = [AFNetworkReachabilityManager sharedManager];
    [manager startMonitoring];
    
    [manager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        switch (status) {
            case AFNetworkReachabilityStatusNotReachable:
            {
                [self setNoNetWorkUI];
            }
                break;
                
            case AFNetworkReachabilityStatusReachableViaWWAN:
            {
                [self setUI];
            }
                break;
                
            case AFNetworkReachabilityStatusReachableViaWiFi:
            {
                [self setUI];
            }
                break;
                
            case AFNetworkReachabilityStatusUnknown:
            {
                [self setNoNetWorkUI];
            }
                break;
                
            default:
                break;
        }
    }];
}

- (NewsTableView *)tableView
{
    if (!_tableView) {
        _tableView = [[NewsTableView alloc] initWithFrame:self.view.bounds];
        _tableView.delegate = self;
    }
    return _tableView;
}

- (NewsModel *)model
{
    if (!_model) {
        _model = [[NewsModel alloc] init];
    }
    return _model;
}



@end
