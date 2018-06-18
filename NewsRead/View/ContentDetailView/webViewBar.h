//
//  webViewBar.h
//  NewsRead
//
//  Created by tybbt on 2018/6/18.
//  Copyright © 2018年 tybbt. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol webViewBarDelegate <NSObject>
- (void)BackToTheFrontPage;
- (void)GoToTheNextPage;
- (void)ReloadPage;
- (void)StarPage;
@end

@interface webViewBar : UIView
@property (nonatomic, weak) id<webViewBarDelegate> delegate;
@end
