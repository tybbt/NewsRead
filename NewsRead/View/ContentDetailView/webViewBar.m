//
//  webViewBar.m
//  NewsRead
//
//  Created by tybbt on 2018/6/18.
//  Copyright © 2018年 tybbt. All rights reserved.
//

#import "webViewBar.h"

@interface webViewBar()
@property (nonatomic, strong) UIButton * backBtn;
@property (nonatomic, strong) UIButton * goBtn;
@property (nonatomic, strong) UIButton * reload;
@property (nonatomic, strong) UIButton * star;
@end

@implementation webViewBar

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setToolBarItem];
    }
    return self;
}

- (void)setToolBarItem
{
    [self addSubview:self.backBtn];
    [self addSubview:self.reload];
    [self addSubview:self.star];
    [self addSubview:self.goBtn];
    self.backgroundColor = RGBToColor(153, 204, 255);
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.backBtn.frame = CGRectMake(0, 0, 40, 40);
    self.reload.frame = CGRectMake((self.frame.size.width-40)/3, 0, 40, 40);
    self.star.frame = CGRectMake((self.frame.size.width-40)*2/3, 0, 40, 40);
    self.goBtn.frame = CGRectMake((self.frame.size.width-40), 0, 40, 40);
}

- (UIButton *)backBtn
{
    if (!_backBtn) {
        _backBtn = [[UIButton alloc] init];
        [_backBtn setTitle:@"回退" forState:UIControlStateNormal];
        _backBtn.backgroundColor = [UIColor clearColor];
        [_backBtn addTarget:self action:@selector(clickBackBtn) forControlEvents:UIControlEventTouchUpInside];
    }
    return _backBtn;
}

- (UIButton *)reload
{
    if (!_reload) {
        _reload = [[UIButton alloc] init];
        [_reload setTitle:@"刷新" forState:UIControlStateNormal];
        _reload.backgroundColor = [UIColor clearColor];
        [_reload addTarget:self action:@selector(clickReload) forControlEvents:UIControlEventTouchUpInside];
    }
    return _reload;
    
}

- (UIButton *)star
{
    if (!_star) {
        _star = [[UIButton alloc] init];
        [_star setTitle:@"收藏" forState:UIControlStateNormal];
        _star.backgroundColor = [UIColor clearColor];
        [_star addTarget:self action:@selector(clickStar) forControlEvents:UIControlEventTouchUpInside];
    }
    return _star;
    
}

- (UIButton *)goBtn
{
    if (!_goBtn) {
        _goBtn = [[UIButton alloc] init];
        [_goBtn setTitle:@"前进" forState:UIControlStateNormal];
        _goBtn.backgroundColor = [UIColor clearColor];
        [_goBtn addTarget:self action:@selector(clickGoBtn) forControlEvents:UIControlEventTouchUpInside];
    }
    return _goBtn;
}

- (void)clickBackBtn
{
    if (self.delegate && [_delegate respondsToSelector:@selector(BackToTheFrontPage)]) {
        [_delegate BackToTheFrontPage];
    }
}

- (void)clickGoBtn
{
    if (self.delegate && [_delegate respondsToSelector:@selector(GoToTheNextPage)]) {
        [_delegate GoToTheNextPage];
    }
}

- (void)clickReload
{
    if (self.delegate && [_delegate respondsToSelector:@selector(ReloadPage)]) {
        [_delegate ReloadPage];
    }
}

- (void)clickStar
{
    if (self.delegate && [_delegate respondsToSelector:@selector(StarPage)]) {
        [_delegate StarPage];
    }
}

@end
