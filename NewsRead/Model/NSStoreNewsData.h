//
//  NSStoreNewsData.h
//  NewsRead
//
//  Created by tybbt on 2018/6/18.
//  Copyright © 2018年 tybbt. All rights reserved.
//

#import <Foundation/Foundation.h>

@class News;
@interface NSStoreNewsData : NSObject <NSCoding>

@property (nonatomic, strong) NSString * title;
@property (nonatomic, strong) NSString * category;
@property (nonatomic, strong) NSString * pageURL;

- (instancetype)initWithNewsModel: (News *)info;
@end
