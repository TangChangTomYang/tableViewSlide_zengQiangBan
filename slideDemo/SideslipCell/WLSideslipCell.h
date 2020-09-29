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

#import "WLSideslipContainerView.h"
#import "WLSideslipConfirmActionView.h"
 

 
@class WLSideslipCell;
@protocol WLSideslipCellDelegate <NSObject>
@optional;
/**
 *  选中了侧滑按钮
 *
 *  @param sideslipCell 当前响应的cell
 *  @param indexPath    cell在tableView中的位置
 *  @param index        选中的是第几个action
 *  return 如果你想展示另一个View，那么返回他。如果返回nil，则会直接收起侧滑菜单
 *  需要注意如果你返回了一个View，那么整个侧滑容器将会对其进行适配(宽度)
 */
//- (UIView *)sideslipCell:(WLSideslipCell *)sideslipCell rowAtIndexPath:(NSIndexPath *)indexPath didSelectedAtIndex:(NSInteger)index;

- (WLSideslipCellAction *)sideslipCell:(WLSideslipCell *)sideslipCell confirmActionAtIndexPath:(NSIndexPath *)indexPath forAction:(WLSideslipCellAction *)action;

/**
 *  告知当前位置的cell是否需要侧滑按钮
 *
 *  @param sideslipCell 当前响应的cell
 *  @param indexPath    cell在tableView中的位置
 *
 *  @return YES 表示当前cell可以侧滑, NO 不可以
 */
- (BOOL)sideslipCell:(WLSideslipCell *)sideslipCell canSideslipActionAtIndexPath:(NSIndexPath *)indexPath;

/**
 *  返回侧滑事件
 *
 *  @param sideslipCell 当前响应的cell
 *  @param indexPath    cell在tableView中的位置
 *
 *  @return 数组为空, 则没有侧滑事件
 */
- (nullable NSArray<WLSideslipCellAction *> *)sideslipCell:(WLSideslipCell *)sideslipCell editActionsForRowAtIndexPath:(NSIndexPath *)indexPath;
@end





 
@interface WLSideslipCell : UITableViewCell <UIGestureRecognizerDelegate>
@property (nonatomic) BOOL sideslip; //当前cell的侧滑是否被展示中
/**
 WLSideslipCellStateNormal,
 WLSideslipCellStateAnimating,
 WLSideslipCellStateOpen
 */
@property (nonatomic) WLSideslipCellState state; //当前cell的状态
@property (nonatomic) NSArray <WLSideslipCellAction *> *actions;



//@property (nonatomic) UIView *nextShowView;//点击侧滑按钮后，若有需要持有用户返回的新View

@property (nonatomic) WLSideslipConfirmActionView *confirmActionView;//点击侧滑按钮后，若有需要持有用户返回的新View
@property (nonatomic, strong) WLSideslipContainerView *btnContainView;


 
@property (nonatomic, weak) id<WLSideslipCellDelegate> sideslipDelegate;



/**
 *  隐藏所有侧滑按钮
 */
- (void)hiddenAllSideslip;


/**
 隐藏当前cell的侧滑按钮
 */
- (void)hiddenSideslip;


/**
 展示当前cell的侧滑按钮
 */
- (void)showSideslip;
@end


 
