//
//  NSStoreNewsData.m
//  NewsRead
//
//  Created by tybbt on 2018/6/18.
//  Copyright © 2018年 tybbt. All rights reserved.
//

#import "NSStoreNewsData.h"
#import "NewsModel.h"

@implementation NSStoreNewsData

- (instancetype)initWithNewsModel: (News *)info
{
    self = [super init];
    if (self) {
        self.title = info.title;
        self.category = info.category;
        self.pageURL = info.pageURL;
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:self.title forKey:@"title"];
    [aCoder encodeObject:self.category forKey:@"category"];
    [aCoder encodeObject:self.pageURL forKey:@"URL"];
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if (self) {
        self.title = [aDecoder decodeObjectForKey:@"title"];
        self.category = [aDecoder decodeObjectForKey:@"category"];
        self.pageURL = [aDecoder decodeObjectForKey:@"URL"];
    }
    return self;
}

@end
