//
//  ListCustomCell.m
//  NewsRead
//
//  Created by tybbt on 2018/6/17.
//  Copyright © 2018年 tybbt. All rights reserved.
//

#import "ListCustomCell.h"

static const CGFloat thumbWidth = 95;
static const CGFloat thumbHeight = 75;

@implementation ListCustomCell

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.title.frame = CGRectMake(10, 10, CGRectGetWidth(self.bounds)-130, 60);
    self.category.frame = CGRectMake(10, CGRectGetHeight(self.bounds)-25, 60, 20);
    self.thumbnailView.frame = CGRectMake(CGRectGetWidth(self.title.frame)+15, 15, thumbWidth, thumbHeight);
}



@end
