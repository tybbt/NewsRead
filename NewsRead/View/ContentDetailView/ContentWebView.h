//
//  ContentWebView.h
//  NewsRead
//
//  Created by tybbt on 2018/6/18.
//  Copyright © 2018年 tybbt. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^SuccessLoad)(void);
typedef void(^FailedLoad)(NSError *error);

@protocol ContentWebViewDelegate <NSObject>
- (void)clickStarAction;
@end

@interface ContentWebView : UIView
@property (nonatomic, weak) id<ContentWebViewDelegate> delegate;
- (void)loadWebViewWithURL: (NSURL *)url successed: (SuccessLoad)success failed: (FailedLoad)fail;
@end
