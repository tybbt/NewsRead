//
//  BaseCustomCell.m
//  NewsRead
//
//  Created by tybbt on 2018/6/17.
//  Copyright © 2018年 tybbt. All rights reserved.
//

#import "BaseCustomCell.h"
#import "NewsModel.h"
#import "RequestModelService.h"

typedef NS_ENUM(NSInteger, AttributeStringStyle){
    AttributeStringStyleTitle,
    AttributeStringStyleCategory
};

@interface BaseCustomCell()

@end

@implementation BaseCustomCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self createUI];
    }
    return self;
}

- (void)createUI
{
    [self addSubview:self.title];
    [self addSubview:self.category];
    [self addSubview:self.thumbnailView];
    
    [self bringSubviewToFront:self.title];
    [self bringSubviewToFront:self.category];
}

- (void)setCellInfo: (News *)info TextColor: (UIColor *)color
{
    [self.title setAttributedText:[self getAttributedString:info.title withStyle:AttributeStringStyleTitle withTextColor:color]];
    [self.category setAttributedText:[self getAttributedString:info.category withStyle:AttributeStringStyleCategory withTextColor:color]];
    [self.thumbnailView setImage:[RequestModelService getThumbnailWithPath:[NSURL URLWithString:info.thumbURL]]];
}

- (NSMutableAttributedString *)getAttributedString: (NSString *)str withStyle: (AttributeStringStyle)style withTextColor: (UIColor *)color
{
    NSMutableAttributedString * attrString;
    switch (style) {
        case AttributeStringStyleTitle:{
            attrString = [[NSMutableAttributedString alloc] initWithString:str];
            NSDictionary * attributeStyle = @{NSFontAttributeName: [UIFont boldSystemFontOfSize:16],
                                              NSForegroundColorAttributeName: color};
            [attrString setAttributes:attributeStyle range:NSMakeRange(0, attrString.length)];
        }
            break;
        case AttributeStringStyleCategory:
        {
            attrString = [[NSMutableAttributedString alloc] initWithString:str];
            NSDictionary * attributeStyle = @{NSFontAttributeName: [UIFont boldSystemFontOfSize:11],
                                              NSForegroundColorAttributeName: color};
            [attrString setAttributes:attributeStyle range:NSMakeRange(0, attrString.length)];
        }
            break;
            
        default:
            break;
    }
    return attrString;
}

- (UILabel *)title
{
    if(!_title)
    {
        _title = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.bounds)-110, 40)];
        _title.numberOfLines = 2;
        [_title setText:@"title"];
    }
    return _title;
}

- (UILabel *)category
{
    if(!_category)
    {
        _category = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 60, 20)];
        [_category setText:@"category"];
        
    }
    return _category;
}

- (UIImageView *)thumbnailView
{
    if(!_thumbnailView)
    {
        _thumbnailView = [[UIImageView alloc] init];
        _thumbnailView.contentMode = UIViewContentModeScaleAspectFill;
        _thumbnailView.clipsToBounds = YES;
        [_thumbnailView setImage:[UIImage imageNamed:@"placeHolder"]];
        
    }
    return _thumbnailView;
}

@end
