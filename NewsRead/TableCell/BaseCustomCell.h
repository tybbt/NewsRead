//
//  BaseCustomCell.h
//  NewsRead
//
//  Created by tybbt on 2018/6/17.
//  Copyright © 2018年 tybbt. All rights reserved.
//

#import <UIKit/UIKit.h>

@class News;

@interface BaseCustomCell : UITableViewCell

@property (nonatomic, strong) UILabel * title;
@property (nonatomic, strong) UILabel * category;
@property (nonatomic, strong) UIImageView * thumbnailView;
@property (nonatomic, copy) NSString * pageUrl;

- (void)setCellInfo: (News *)info TextColor: (UIColor *)color;
@end
