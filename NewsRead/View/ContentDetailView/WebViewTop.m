//
//  WebViewTop.m
//  NewsRead
//
//  Created by tybbt on 2018/6/18.
//  Copyright © 2018年 tybbt. All rights reserved.
//

#import "WebViewTop.h"

@interface WebViewTop()
@property (nonatomic, strong) UIButton * backBtn;
@end

@implementation WebViewTop

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setTopBarItem];
    }
    return self;
}

- (void)setTopBarItem
{
    [self addSubview:self.backBtn];
    self.backgroundColor = RGBToColor(153, 204, 255);
}

- (UIButton *)backBtn
{
    if (!_backBtn) {
        _backBtn = [[UIButton alloc] initWithFrame:CGRectMake(5, SafeTopBarHeight-32, 40, 30)];
        [_backBtn setTitle:@"返回" forState:UIControlStateNormal];
        _backBtn.backgroundColor = [UIColor clearColor];
        [_backBtn addTarget:self action:@selector(clickBackBtn) forControlEvents:UIControlEventTouchUpInside];
    }
    return _backBtn;
}

- (void)clickBackBtn
{
    if (self.delegate && [_delegate respondsToSelector:@selector(JumpBack)]) {
        [_delegate JumpBack];
    }
}


@end
