//
//  NewsModel.m
//  NewsRead
//
//  Created by tybbt on 2018/6/16.
//  Copyright © 2018年 tybbt. All rights reserved.
//

#import "NewsModel.h"

@implementation News

+ (JSONKeyMapper *)keyMapper
{
    return [[JSONKeyMapper alloc] initWithModelToJSONDictionary:@{
                                                                  @"ID":@"id",
                                                                  @"title":@"title",
                                                                  @"category":@"category",
                                                                  @"thumbURL":@"thumb_url",
                                                                  @"pageURL":@"page_url"
                                                                  }];
}

@end

@implementation NewsModel

@end


