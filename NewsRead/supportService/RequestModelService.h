//
//  RequestModelServiceImpl.h
//  NewsRead
//
//  Created by tybbt on 2018/6/16.
//  Copyright © 2018年 tybbt. All rights reserved.
//

#import <UIKit/UIKit.h>

@class NewsModel;

typedef void(^JsonBack)(NSString * json);

@interface RequestModelService : NSObject
+ (void)GetJsonModel: (JsonBack)completion;
+ (NewsModel *)JsonToNewsModel: (NSString *)json;
+ (UIImage *)getThumbnailWithPath: (NSURL *)thumbPath;
@end
