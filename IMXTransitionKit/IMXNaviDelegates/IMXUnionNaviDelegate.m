//
//  IMXUnionNaviDelegate.m
//  IMXTransitionKit
//
//  Created by zhoupanpan on 2018/4/12.
//  Copyright © 2018年 panzhow. All rights reserved.
//

#import "IMXUnionNaviDelegate.h"
#import "IMXTransitionManager.h"
#import "UIViewController+IMXTransitionKit.h"
@interface IMXUnionNaviDelegate ()

@end
@implementation IMXUnionNaviDelegate

- (void)dealloc{
}
#pragma mark ======  public  ======
#pragma mark ======  life cycle  ======

#pragma mark ======  delegate  ======
- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC{
    if (operation == UINavigationControllerOperationPush) {
        fromVC.permintHideTitleView = NO;
        toVC.permintHideTitleView = NO;
        id<UIViewControllerAnimatedTransitioning> transtion = [[IMXTransitionManager sharedInstance] transitionFromCtrl:fromVC toCtrl:toVC];
        if(transtion){
            return transtion;
        }
        return [IMXTransitionMgr defaultPushTransition];
    }else if(operation == UINavigationControllerOperationPop){
        [IMXTransitionMgr popSnapshotFromWindow];
        toVC.permintHideTitleView = NO;
        fromVC.permintHideTitleView = YES;
        id<UIViewControllerAnimatedTransitioning> transtion = [[IMXTransitionManager sharedInstance] reverseTransitionFromCtrl:fromVC toCtrl:toVC];
        if(transtion){
            return transtion;
        }
        return [IMXTransitionMgr defaultPopTransition];
    }
    return nil;
}
#pragma mark ======  event  ======

#pragma mark ======  private  ======

#pragma mark ======  getter & setter  ======


@end
