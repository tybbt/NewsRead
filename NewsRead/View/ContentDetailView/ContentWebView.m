//
//  ContentWebView.m
//  NewsRead
//
//  Created by tybbt on 2018/6/18.
//  Copyright © 2018年 tybbt. All rights reserved.
//

#import "ContentWebView.h"
#import <WebKit/WebKit.h>
#import "webViewBar.h"

@interface ContentWebView()<WKUIDelegate, WKNavigationDelegate, webViewBarDelegate>
@property (nonatomic, strong) WKWebView * webView;
@property (nonatomic, strong) webViewBar * toolBar;
@property (nonatomic, copy) SuccessLoad loadSuccess;
@property (nonatomic, copy) FailedLoad loadFailed;

@property (nonatomic, strong) UIActivityIndicatorView * activityView;
@end

@implementation ContentWebView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self createUI];
    }
    return self;
}

- (void)createUI
{
    [self addSubview:self.webView];
    [self addSubview:self.toolBar];
    [self addSubview:self.activityView];
    [self bringSubviewToFront:self.activityView];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.webView.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height-80);
    self.toolBar.frame = CGRectMake(0, self.webView.frame.size.height, self.frame.size.width, 80);
    self.activityView.frame = CGRectMake(self.frame.size.width/2-30, self.frame.size.height/2-30, 60, 60);
}

- (void)loadWebViewWithURL: (NSURL *)url successed: (SuccessLoad)success failed: (FailedLoad)fail
{
    NSURLRequest * request = [NSURLRequest requestWithURL:url];
    
    self.loadSuccess = success;
    self.loadFailed = fail;
    
    [self.webView loadRequest:request];
}

- (WKWebView *)webView
{
    if (!_webView) {
        WKWebViewConfiguration * configuration = [[WKWebViewConfiguration alloc] init];
        _webView = [[WKWebView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height-SafeTopBarHeight) configuration:configuration];
    }
    return _webView;
}

- (webViewBar *)toolBar
{
    if (!_toolBar) {
        _toolBar = [[webViewBar alloc] initWithFrame:CGRectMake(0, self.webView.frame.size.height, self.frame.size.width, SafeTopBarHeight)];
        _toolBar.delegate = self;
    }
    return _toolBar;
}

- (UIActivityIndicatorView *)activityView
{
    if (!_activityView) {
        _activityView = [[UIActivityIndicatorView alloc] init];
        _activityView.activityIndicatorViewStyle = UIActivityIndicatorViewStyleGray;
    }
    return _activityView;
}

- (void)BackToTheFrontPage
{
    if (_webView.canGoBack) {
        [_webView goBack];
    }
}

- (void)ReloadPage
{
    [_webView reload];
}

- (void)StarPage
{
    if (self.delegate && [_delegate respondsToSelector:@selector(clickStarAction)]) {
        [_delegate clickStarAction];
    }
}

- (void)GoToTheNextPage
{
    if (_webView.canGoForward) {
        [_webView goForward];
    }
}

#pragma mark -WKNavigationDelegate
- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation
{
    [self.activityView startAnimating];
}

- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation
{
    self.loadSuccess();
    [self.activityView stopAnimating];
}

- (void)webView:(WKWebView *)webView didFailProvisionalNavigation:(WKNavigation *)navigation withError:(NSError *)error
{
    self.loadFailed(error);
    [self.activityView stopAnimating];
}


@end
