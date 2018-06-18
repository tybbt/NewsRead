//
//  WebViewController.m
//  NewsRead
//
//  Created by tybbt on 2018/6/18.
//  Copyright © 2018年 tybbt. All rights reserved.
//

#import "WebViewController.h"
#import "NewsModel.h"
#import "ContentWebView.h"
#import "WebViewTop.h"
#import "FileHelper.h"
#import "NSStoreNewsData.h"
#import "StarHistoryVC.h"

@interface WebViewController ()<WebViewTopDelegate, ContentWebViewDelegate, StarVCDismiss>
@property (nonatomic, strong) ContentWebView * webView;
@property (nonatomic, strong) WebViewTop * topBar;
@property (nonatomic, strong) FileHelper * fHelper;
@end

@implementation WebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createUI];
    
}

- (void)createUI
{
    [self.view addSubview:self.topBar];
    if (self.urlString != nil) {
        [self.webView loadWebViewWithURL:[NSURL URLWithString:self.urlString] successed:^{
            NSLog(@"加载页面完成");
        } failed:^(NSError *error) {
            NSLog(@"加载失败 error ：%@",error);
        }];
    }
    [self.view addSubview:self.webView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)JumpBack
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)clickStarAction
{
    UIAlertController *alertView = [UIAlertController alertControllerWithTitle:@"收藏" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction * StarNews = [UIAlertAction actionWithTitle:@"收藏该网页" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self wirteNewStarHistory];
    }];
    UIAlertAction * showStared = [UIAlertAction actionWithTitle:@"收藏历史" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self JumpToListVC];
    }];
    UIAlertAction * cancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    
    [alertView addAction:StarNews];
    [alertView addAction:showStared];
    [alertView addAction:cancel];
    
    [self presentViewController:alertView animated:YES completion:nil];
}

- (void)wirteNewStarHistory
{
    if (self.model) {
        NSUserDefaults * userDefault = [NSUserDefaults standardUserDefaults];
        if (![userDefault objectForKey:@"StarList"]) {
            NSStoreNewsData * news = [[NSStoreNewsData alloc] initWithNewsModel:self.model];
            NSData * data = [NSKeyedArchiver archivedDataWithRootObject:news];
            NSArray * array = [NSArray arrayWithObjects:data, nil];
            [userDefault setObject:array forKey:@"StarList"];
            return;
        }
        NSArray * array = [userDefault objectForKey:@"StarList"];
        for (NSData * data in array) {
            NSStoreNewsData * news = [NSKeyedUnarchiver unarchiveObjectWithData:data];
            if ([news.pageURL compare:self.model.pageURL] == NSOrderedSame) {
                return;
            }
        }
        NSStoreNewsData * news = [[NSStoreNewsData alloc] initWithNewsModel:self.model];
        NSData * data = [NSKeyedArchiver archivedDataWithRootObject:news];
        NSMutableArray * tempArr = [NSMutableArray arrayWithArray:array];
        [tempArr addObject:data];
        NSArray * newArr = [NSArray arrayWithArray:tempArr];
        [userDefault setObject:newArr forKey:@"StarList"];
    }
}

- (void)JumpToListVC
{
    StarHistoryVC * controller = [StarHistoryVC new];
    controller.delegate = self;
    [self presentViewController:controller animated:YES completion:nil];
}

- (void)dismissWithCancel
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)dismissWithChooseHistory:(NSString *)URL
{
    [self dismissViewControllerAnimated:YES completion:nil];
    [self.webView loadWebViewWithURL:[NSURL URLWithString:URL] successed:^{
    } failed:^(NSError *error) {
        NSLog(@"load from starVC error: %@",error);
    }];
}

- (ContentWebView *)webView
{
    if (!_webView) {
        _webView = [[ContentWebView alloc] initWithFrame:CGRectMake(0, SafeTopBarHeight, ScreenWidth, ScreenHeight - SafeTopBarHeight)];
        _webView.delegate = self;
    }
    return _webView;
}

- (WebViewTop *)topBar
{
    if (!_topBar) {
        _topBar = [[WebViewTop alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, SafeTopBarHeight)];
        _topBar.delegate = self;
    }
    return _topBar;
}

- (FileHelper *)fHelper
{
    if (!_fHelper) {
        _fHelper = [FileHelper new];
    }
    return _fHelper;
}

@end
