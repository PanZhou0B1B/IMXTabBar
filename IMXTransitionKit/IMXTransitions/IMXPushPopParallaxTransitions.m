//
//  IMXPushPopParallaxTransitions.m
//  IMXTransitionKit
//
//  Created by zhoupanpan on 2018/4/12.
//  Copyright © 2018年 panzhow. All rights reserved.
//

#import "IMXPushPopParallaxTransitions.h"
#import "UIView+IMXTransitionKit.h"
#import "IMXTransitionManager.h"
@implementation IMXPushPopParallaxTransitions

@end

@implementation IMXPushParallaxTransition
- (void)dealloc{

}
- (NSTimeInterval)transitionDuration:(id <UIViewControllerContextTransitioning>)transitionContext{
    return 0.5f;
}
- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext{
    UIViewController *fromViewCtrl = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toViewCtrl = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    CGRect fromViewInitialFrame = [transitionContext initialFrameForViewController:fromViewCtrl];
    CGRect toViewEndFrame = [transitionContext finalFrameForViewController:toViewCtrl];

    UIView* toView = nil;
    UIView* fromView = nil;
    fromView = [transitionContext viewForKey:UITransitionContextFromViewKey];
    toView = [transitionContext viewForKey:UITransitionContextToViewKey];

    [[transitionContext containerView]  addSubview:toView];

    CGFloat width = [UIScreen mainScreen].bounds.size.width;

    toView.frame = CGRectMake(width,toViewEndFrame.origin.y, toViewEndFrame.size.width, toViewEndFrame.size.height);
    fromView.frame = CGRectMake(0, fromViewInitialFrame.origin.y, fromViewInitialFrame.size.width, fromViewInitialFrame.size.height);//parallax
    [toView imx_showShadow:CGSizeMake(-4, 0)];
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        toView.frame = CGRectMake(0,toViewEndFrame.origin.y,toViewEndFrame.size.width, toViewEndFrame.size.height);
        fromView.frame = CGRectMake(-(width*0.60), fromViewInitialFrame.origin.y, fromViewInitialFrame.size.width, fromViewInitialFrame.size.height);//parallax
    } completion:^(BOOL finished) {
        [toView imx_hideShadow];
        [transitionContext completeTransition:YES];
    }];

}
@end

@implementation IMXPopParallaxTransition
- (void)dealloc{

}
- (NSTimeInterval)transitionDuration:(id <UIViewControllerContextTransitioning>)transitionContext{
    return 0.5f;
}
- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext{
    UIViewController *fromViewCtrl = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toViewCtrl = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    CGRect fromViewInitialFrame = [transitionContext initialFrameForViewController:fromViewCtrl];
    CGRect toViewEndFrame = [transitionContext finalFrameForViewController:toViewCtrl];


    UIView* toView = nil;
    UIView* fromView = nil;
    UIView *fromSnapshot = nil;
    fromView = [transitionContext viewForKey:UITransitionContextFromViewKey];
    toView = [transitionContext viewForKey:UITransitionContextToViewKey];
    fromSnapshot =  [IMXTransitionMgr popSnapshot];
    [[transitionContext containerView] insertSubview:toView belowSubview:fromView];
    if(fromSnapshot){
        //[[transitionContext containerView] addSubview:fromSnapshot];
        [[UIView imx_window] addSubview:fromSnapshot];
    }

    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    CGFloat height = [UIScreen mainScreen].bounds.size.height;

    fromView.frame = CGRectMake(0, fromViewInitialFrame.origin.y, fromViewInitialFrame.size.width, fromViewInitialFrame.size.height);
    fromSnapshot.frame = CGRectMake(0, 0, width, height);
    toView.frame = CGRectMake(-(width*0.60), toViewEndFrame.origin.y, toViewEndFrame.size.width, toViewEndFrame.size.height);//parallax
    [fromSnapshot imx_showShadow:CGSizeMake(-4, 0)];    
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        fromView.frame = CGRectMake(width,fromViewInitialFrame.origin.y, fromViewInitialFrame.size.width, fromViewInitialFrame.size.height);
        fromSnapshot.frame = CGRectMake(width, 0, width, height);;
        toView.frame = CGRectMake(0, toViewEndFrame.origin.y, toViewEndFrame.size.width, toViewEndFrame.size.height);//parallax
    } completion:^(BOOL finished) {
        [fromSnapshot imx_hideShadow];
        [fromSnapshot removeFromSuperview];
        [transitionContext completeTransition:!transitionContext.transitionWasCancelled];
    }];
}
@end
