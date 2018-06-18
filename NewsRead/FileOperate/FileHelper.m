//
//  FileHelper.m
//  NewsRead
//
//  Created by tybbt on 2018/6/18.
//  Copyright © 2018年 tybbt. All rights reserved.
//

#import "FileHelper.h"

@implementation FileHelper

- (NSString *)getRootPath
{
    NSString * rootPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject;
    return rootPath;
}

- (NSString *)getStarListPath
{
    NSString * StarList = [[self getRootPath] stringByAppendingPathComponent:@"Star.data"];
    NSFileManager * manager = [NSFileManager defaultManager];
    if (![manager fileExistsAtPath:StarList]) {
        [manager createFileAtPath:StarList contents:nil attributes:nil];
    }
    return StarList;
}

- (NSString *)getImageReflectListPath
{
    NSString * ImageReflectList = [[self getRootPath] stringByAppendingPathComponent:@"ImgReflect.data"];
    NSFileManager * manager = [NSFileManager defaultManager];
    if (![manager fileExistsAtPath:ImageReflectList]) {
        [manager createFileAtPath:ImageReflectList contents:nil attributes:nil];
    }
    return ImageReflectList;
}

@end
