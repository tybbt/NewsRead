//
//  NewsModel.h
//  NewsRead
//
//  Created by tybbt on 2018/6/16.
//  Copyright © 2018年 tybbt. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@interface News : JSONModel
@property (nonatomic, assign) NSInteger ID;
@property (nonatomic, copy) NSString * title;
@property (nonatomic, copy) NSString * category;
@property (nonatomic, copy) NSString * thumbURL;
@property (nonatomic, copy) NSString * pageURL;
@end

@protocol News
@end

@interface NewsModel : JSONModel
@property (nonatomic, assign) int code;
@property (nonatomic, copy) NSArray<News> * data;
@property (nonatomic, copy) NSString * message;
@end


