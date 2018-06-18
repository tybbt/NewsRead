//
//  NewsTableView.m
//  NewsRead
//
//  Created by tybbt on 2018/6/17.
//  Copyright © 2018年 tybbt. All rights reserved.
//

#import "NewsTableView.h"
#import "ListCustomCell.h"
#import "TopNewsCell.h"
#import "NewsModel.h"

static const CGFloat TopCellHeight = 200;
static const CGFloat NormalCellHeight = 100;

@interface NewsTableView() <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView * tableview;
@property (nonatomic, copy) NSMutableArray<News> * newsArray;
@end

@implementation NewsTableView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self)
    {
        [self createUI];
    }
    return self;
}

- (void)createUI
{
    [self addSubview:self.tableview];
    self.tableview.frame = self.bounds;
}

- (void)setDataSource: (NSArray<News> *)data
{
    [self.newsArray removeAllObjects];
    [self.newsArray addObjectsFromArray:data];
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.tableview reloadData];
        [self.tableview layoutIfNeeded];
    });
}

- (UITableView *)tableview
{
    if(!_tableview)
    {
        _tableview = [[UITableView alloc] initWithFrame:self.bounds];
        _tableview.delegate = self;
        _tableview.dataSource = self;
    }
    return _tableview;
}

- (NSMutableArray<News> *)newsArray
{
    if (!_newsArray) {
        _newsArray = [[NSMutableArray alloc] initWithCapacity:20];
    }
    return _newsArray;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.delegate && [_delegate respondsToSelector:@selector(didSelectRowAt:)]) {
        [self.delegate didSelectRowAt:indexPath.row];
    }
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.newsArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    if (indexPath.row == 0) {
        static NSString * TopCustom = @"TopNewsCell";
        Class clazz = NSClassFromString(TopCustom);
        [tableView registerClass:clazz forCellReuseIdentifier:TopCustom];
        TopNewsCell * topCell = [tableView dequeueReusableCellWithIdentifier:TopCustom forIndexPath:indexPath];
        [topCell setCellInfo:self.newsArray[indexPath.row] TextColor:[UIColor whiteColor]];
        return topCell;
    } else {
        static NSString * ListCustom = @"ListCustomCell";
        Class clazz = NSClassFromString(ListCustom);
        [tableView registerClass:clazz forCellReuseIdentifier:ListCustom];
        ListCustomCell * listCell = [tableView dequeueReusableCellWithIdentifier:ListCustom forIndexPath:indexPath];
        [listCell setCellInfo:self.newsArray[indexPath.row] TextColor:[UIColor blackColor]];
        return listCell;
    }
    return nil;

}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        return TopCellHeight;
    }
    return NormalCellHeight;
}


@end
