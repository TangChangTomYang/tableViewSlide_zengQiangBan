//
//  WLSlideslipDefine.h
//  EUTv5
//
//  Created by edz on 2020/7/13.
//  CopWLight © 2020 Louis. All rights reserved.
//

#ifndef WLSlideslipDefine_h
#define WLSlideslipDefine_h

typedef NS_ENUM(NSInteger, WLSideslipCellActionStyle) {
    WLSideslipCellActionStyleDefault = 0,
    WLSideslipCellActionStyleDestructive = WLSideslipCellActionStyleDefault, // 删除 红底
    WLSideslipCellActionStyleNormal // 正常 灰底
};


typedef NS_ENUM(NSInteger, WLSideslipCellState) {
    WLSideslipCellStateNormal,
    WLSideslipCellStateAnimating,
    WLSideslipCellStateOpen
};





#endif /* WLSlideslipDefine_h */
