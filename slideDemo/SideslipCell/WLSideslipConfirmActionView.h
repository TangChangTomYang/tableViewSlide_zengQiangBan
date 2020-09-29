//
//  WLSlideslipDefine.h
//  EUTv5
//
//  Created by edz on 2020/7/13.
//  CopWLight © 2020 Louis. All rights reserved.
//
//

#import <UIKit/UIKit.h>
#import "WLSideslipCellAction.h"
 
@interface WLSideslipConfirmActionView : UIView
@property (nonatomic, strong) WLSideslipCellAction *action;

@property (nonatomic,weak) id targetCell;
@end
 
