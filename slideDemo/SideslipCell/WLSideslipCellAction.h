//
//  WLSlideslipDefine.h
//  EUTv5
//
//  Created by edz on 2020/7/13.
//  CopWLight © 2020 Louis. All rights reserved.
//
//

#import <UIKit/UIKit.h>
#import "WLSlideslipDefine.h"

@class WLSideslipCellAction;

typedef void (^WLSideslipCellActionHandler)(WLSideslipCellAction * _Nonnull action,
                                            NSIndexPath * _Nonnull indexPath);


/**
    创建扩展按钮用的Action，需要在cell代理中返回。
 */
@interface WLSideslipCellAction : NSObject

/**
 WLSideslipCellActionStyleDefault = 0,
 WLSideslipCellActionStyleDestructive = WLSideslipCellActionStyleDefault, // 删除 红底
 WLSideslipCellActionStyleNormal
 */
@property (nonatomic, assign) WLSideslipCellActionStyle style;
@property (nonatomic, copy, nullable) NSString *title;          // 文字内容
@property (nonatomic, strong, nullable) UIImage *image;         // 按钮图片. 默认无图
@property (nonatomic, assign) CGFloat fontSize;                 // 字体大小. 默认17
@property (nonatomic, strong, nullable) UIColor *titleColor;    // 文字颜色. 默认白色
@property (nonatomic, copy, nullable) UIColor *backgroundColor; // 背景颜色. 默认透明
@property (nonatomic, assign) CGFloat margin;                   // 内容左右间距. 默认15

@property (nonatomic, copy) WLSideslipCellActionHandler _Nullable  handler;

+ (instancetype _Nullable )rowActionWithStyle:(WLSideslipCellActionStyle)style
                                        title:(nullable NSString *)title
                                      handler:(WLSideslipCellActionHandler _Nullable )handler;

-(CGFloat)actonViewWidth;

@end
