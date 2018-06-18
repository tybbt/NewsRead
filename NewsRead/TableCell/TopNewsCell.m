
//
//  TopNewsCell.m
//  NewsRead
//
//  Created by tybbt on 2018/6/17.
//  Copyright © 2018年 tybbt. All rights reserved.
//

#import "TopNewsCell.h"

@implementation TopNewsCell

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.thumbnailView.frame = self.bounds;
    self.title.frame = CGRectMake(10, CGRectGetHeight(self.bounds)-90, CGRectGetWidth(self.bounds)-20, 70);
    self.category.frame = CGRectMake(10, CGRectGetHeight(self.bounds)-25, 100, 30);
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
