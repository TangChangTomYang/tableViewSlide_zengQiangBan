//
//  ViewController.m
//  slideDemo
//
//  Created by cib-dev-iMac-2 on 2020/9/27.
//  CopWLight © 2020 cib-dev-iMac-2. All rights reserved.
//

#import "WLTestSildSlideViewController.h"
#import "WLTestCell.h"
#import "UITableView+WLSideslipCell.h"

@interface WLTestSildSlideViewController ()<UITableViewDelegate, UITableViewDataSource, WLSideslipCellDelegate>
@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) NSMutableArray *textArrM;


// tableViewDelegateProxy 的主要功能是 拦截 系统回调 UITableViewDelegate 方法
// 阻止 UITableViewDelegate 的回调
//@property (nonatomic, strong) WLTableViewDelegateHook *tableViewDelegateProxy;

@end

@implementation WLTestSildSlideViewController

-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        
        // 设置 tableViewDelegate后就可以侧滑了
        _tableView.tableViewDelegate =   self;
        _tableView.dataSource = self;
    }
    return _tableView;
}

-(NSMutableArray *)textArrM{
    if (!_textArrM) {
        _textArrM = [NSMutableArray array];
        for (int i=0; i<20; i++) {
        [_textArrM addObject:[NSString stringWithFormat:@"info-%d",i]];
        }
    }
    return _textArrM;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.tableView];
  
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.textArrM.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    WLTestCell *cell = [tableView dequeueReusableCellWithIdentifier:@"aaa"];
    if (!cell) {
        cell = [[WLTestCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"aaa"];
        cell.sideslipDelegate = self;
    }
    cell.textLabel.text = self.textArrM[indexPath.row];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}



///---------------------


/**
 *  告知当前位置的cell是否需要侧滑按钮
 *
 *  @param sideslipCell 当前响应的cell
 *  @param indexPath    cell在tableView中的位置
 *
 *  @return YES 表示当前cell可以侧滑, NO 不可以
 */
- (BOOL)sideslipCell:(WLSideslipCell *)sideslipCell canSideslipActionAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
    return  indexPath.row % 2 == 0;
}

/**
 *  返回侧滑事件
 *
 *  @param sideslipCell 当前响应的cell
 *  @param indexPath    cell在tableView中的位置
 *
 *  @return 数组为空, 则没有侧滑事件
 */
- (nullable NSArray<WLSideslipCellAction *> *)sideslipCell:(WLSideslipCell *)sideslipCell editActionsForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSMutableArray<WLSideslipCellAction *> *arrM = [NSMutableArray array];
    WLSideslipCellAction *follow = [WLSideslipCellAction rowActionWithStyle:WLSideslipCellActionStyleNormal title:@"取消" handler:^(WLSideslipCellAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
        
         [sideslipCell hiddenAllSideslip];
        NSLog(@"----clickTitle: %@, at index: %ld", action.title, (long)indexPath.row);
    }];
    
    
    WLSideslipCellAction *delete = [WLSideslipCellAction rowActionWithStyle:WLSideslipCellActionStyleDestructive title:@"删除" handler:^(WLSideslipCellAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
        
        NSLog(@"----clickTitle: %@, at index: %ld", action.title, (long)indexPath.row);
    }];
    
    
    [arrM addObject:follow];
    [arrM addObject:delete];
    
    
    return arrM;
    
}

/**
 *  选中了侧滑按钮
 *
 *  @param sideslipCell 当前响应的cell
 *  @param indexPath    cell在tableView中的位置
 *  @param index        选中的是第几个action
 *  return 如果你想展示另一个View，那么返回他。如果返回nil，则会直接收起侧滑菜单
 *  需要注意如果你返回了一个View，那么整个侧滑容器将会对其进行适配(宽度)
 */
- (WLSideslipCellAction *)sideslipCell:(WLSideslipCell *)sideslipCell
              confirmActionAtIndexPath:(NSIndexPath *)indexPath
                             forAction:(WLSideslipCellAction *)action{
    
    if ([action.title isEqualToString:@"删除"]) {
        __weak typeof(self) weakSelf = self;
        WLSideslipCellAction *action = [WLSideslipCellAction rowActionWithStyle:WLSideslipCellActionStyleDestructive
                                                                          title:@"确认 删除"
                                                                        handler:^(WLSideslipCellAction * _Nonnull action,
                                                                                  NSIndexPath * _Nonnull actioIndexPath) {
                                                                            
                                                                            
                                                                            
                                                                            [self.textArrM removeObjectAtIndex:actioIndexPath.row];
                                                                            [weakSelf.tableView deleteRowsAtIndexPaths:@[actioIndexPath] withRowAnimation:(UITableViewRowAnimationAutomatic)];
                                                                            
                                                                            
                                                                        }];
        
        return action;
    }
    return nil;
    
}
/**
 
 */

-(void)dealloc{
    NSLog(@"%s", __func__);
}

@end
