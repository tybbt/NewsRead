//
//  StarHistoryTopVIew.h
//  NewsRead
//
//  Created by tybbt on 2018/6/18.
//  Copyright © 2018年 tybbt. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol StarHistoryTopDelegate <NSObject>
- (void)clickBackBtn;
@end

@interface StarHistoryTopVIew : UIView
@property (nonatomic, strong) UIButton * backBtn;
@property (nonatomic, weak) id<StarHistoryTopDelegate> delegate;
@end
