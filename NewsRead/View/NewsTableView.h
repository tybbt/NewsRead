//
//  NewsTableView.h
//  NewsRead
//
//  Created by tybbt on 2018/6/17.
//  Copyright © 2018年 tybbt. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol News;

@protocol NewsTableViewDelegate <NSObject>
- (void)didSelectRowAt: (NSInteger)index;
@end

@interface NewsTableView : UIView
- (void)setDataSource: (NSArray<News> *)data;
@property (nonatomic, weak) id<NewsTableViewDelegate> delegate;
@end
