//
//  WLSlideslipDefine.h
//  EUTv5
//
//  Created by edz on 2020/7/13.
//  CopWLight © 2020 Louis. All rights reserved.
//
//

#import "WLTableViewDelegateHook.h"
#import "WLSideslipCell.h"
#import "UITableView+WLSideslipCell.h"

 
 
 
@implementation WLTableViewDelegateHook

+(instancetype)hookWithTableViewDelegate:(id)tableViewDelegate tableView:(UITableView *)tableView{
    
   WLTableViewDelegateHook *tableViewDelegateHook = [WLTableViewDelegateHook alloc];
    tableViewDelegateHook.tableViewDelegate = tableViewDelegate;
    tableViewDelegateHook.tableView = tableView;
    return tableViewDelegateHook;
}

- (BOOL)isKindOfClass:(Class)aClass {
    
    return [NSStringFromClass(aClass) isEqualToString:NSStringFromClass([self class])];
}

-(BOOL)isMemberOfClass:(Class)aClass{
    return  [NSStringFromClass(aClass) isEqualToString:NSStringFromClass([self class])];
}
 

// 需要hook 的属于 delegate 的方法
-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    
    if (self.tableView.sideslip) {
        [self.tableView hiddenAllSideslip];
    }
    
    if ([self.tableViewDelegate respondsToSelector:@selector(scrollViewWillBeginDragging:)]) {
        [self.tableViewDelegate scrollViewWillBeginDragging:scrollView];
    }
    
}

// 需要hook 的属于 delegate 的方法
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.tableView.sideslip) {
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
        [self.tableView hiddenAllSideslip];
        return;
    }
    
    
    if ([self.tableViewDelegate respondsToSelector:@selector(tableView:didSelectRowAtIndexPath:)]) {
        [self.tableViewDelegate tableView:tableView didSelectRowAtIndexPath:indexPath];
    }
}



// 将 没有hook 的, 属于delegate 的方法 转发出去
-(NSMethodSignature *)methodSignatureForSelector:(SEL)sel{
    // 返回指定 对象的方法签名, 由指定对象 去处理这个方法的执行
    return  [self.tableViewDelegate methodSignatureForSelector:sel];
}

-(void)forwardInvocation:(NSInvocation *)invocation{
    [invocation invokeWithTarget:self.tableViewDelegate];
}
 
 
-(void)dealloc{
    NSLog(@"%s", __func__);
}

 

@end
