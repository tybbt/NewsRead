//
//  WebViewTop.h
//  NewsRead
//
//  Created by tybbt on 2018/6/18.
//  Copyright © 2018年 tybbt. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol WebViewTopDelegate <NSObject>
- (void)JumpBack;
@end

@interface WebViewTop : UIView
@property (nonatomic, weak) id<WebViewTopDelegate> delegate;
@end
