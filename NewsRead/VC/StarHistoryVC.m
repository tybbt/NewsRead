//
//  StarHistoryVC.m
//  NewsRead
//
//  Created by tybbt on 2018/6/18.
//  Copyright © 2018年 tybbt. All rights reserved.
//

#import "StarHistoryVC.h"
#import "NSStoreNewsData.h"
#import "StarHistoryTopVIew.h"

@interface StarHistoryVC ()<UITableViewDelegate,UITableViewDataSource, StarHistoryTopDelegate>
@property (nonatomic, strong) UITableView * tableView;
@property (nonatomic, strong) StarHistoryTopVIew * topBar;
@property (nonatomic, strong) UILabel * emptyLable;
@property (nonatomic, copy) NSMutableArray * data;
@end

@implementation StarHistoryVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.topBar];
    
    [self loadDataSource];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, SafeTopBarHeight, ScreenWidth, ScreenHeight - SafeTopBarHeight)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}

- (StarHistoryTopVIew *)topBar
{
    if(!_topBar)
    {
        _topBar = [[StarHistoryTopVIew alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, SafeTopBarHeight)];
        _topBar.delegate = self;
    }
    return _topBar;
}

- (UILabel *)emptyLable
{
    if (!_emptyLable) {
        _emptyLable = [[UILabel alloc] initWithFrame:CGRectMake(0, SafeTopBarHeight, ScreenWidth, ScreenHeight - SafeTopBarHeight)];
        [_emptyLable setText:@"当前无收藏"];
        [_emptyLable setBackgroundColor:[UIColor whiteColor]];
        [_emptyLable setTextAlignment:NSTextAlignmentCenter];
        [_emptyLable setFont:[UIFont systemFontOfSize:13]];
    }
    return _emptyLable;
}

- (NSMutableArray *)data
{
    if (!_data) {
        _data = [NSMutableArray arrayWithCapacity:20];
    }
    return _data;
}

- (void)loadDataSource
{
    NSUserDefaults * userDefault = [NSUserDefaults standardUserDefaults];
    if (![userDefault objectForKey:@"StarList"]) {
        [self.view addSubview:self.emptyLable];
        return;
    }
    [self.view addSubview:self.tableView];
    NSArray * array = [userDefault objectForKey:@"StarList"];
    [self.data removeAllObjects];
    for (NSData * data in array) {
        NSStoreNewsData * news = [NSKeyedUnarchiver unarchiveObjectWithData:data];
        [self.data addObject:news];
    }
    [self.tableView reloadData];
}

- (void)clickBackBtn
{
    if (self.delegate && [_delegate respondsToSelector:@selector(dismissWithCancel)]) {
        [_delegate dismissWithCancel];
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.data.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * cellIdentifier = @"cellIdentifier";
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellIdentifier];
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
    }
    NSStoreNewsData * data = self.data[indexPath.row];
    [cell.textLabel setText:data.title];
    [cell.detailTextLabel setText:data.category];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.delegate && [_delegate respondsToSelector:@selector(dismissWithChooseHistory:)]) {
        NSStoreNewsData * data = self.data[indexPath.row];
        [_delegate dismissWithChooseHistory:data.pageURL];
    }
}



@end
