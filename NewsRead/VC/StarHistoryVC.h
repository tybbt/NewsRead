//
//  StarHistoryVC.h
//  NewsRead
//
//  Created by tybbt on 2018/6/18.
//  Copyright © 2018年 tybbt. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol StarVCDismiss <NSObject>
- (void)dismissWithCancel;
- (void)dismissWithChooseHistory:(NSString *)URL;
@end

@interface StarHistoryVC : UIViewController
@property (nonatomic, weak) id<StarVCDismiss> delegate;
@end
