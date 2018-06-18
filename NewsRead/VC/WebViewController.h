//
//  WebViewController.h
//  NewsRead
//
//  Created by tybbt on 2018/6/18.
//  Copyright © 2018年 tybbt. All rights reserved.
//

#import <UIKit/UIKit.h>
@class News;

@interface WebViewController : UIViewController
@property (nonatomic, copy) NSString * urlString;
@property (nonatomic, copy) News * model;
@end
