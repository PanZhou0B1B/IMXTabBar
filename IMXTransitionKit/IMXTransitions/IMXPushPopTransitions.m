//
//  IMXPushPopTransitions.m
//  IMXTransitionKit
//
//  Created by zhoupanpan on 2018/4/12.
//  Copyright © 2018年 panzhow. All rights reserved.
//

#import "IMXPushPopTransitions.h"
#import "UIView+IMXTransitionKit.h"

@implementation IMXPushPopTransitions

@end

@implementation IMXPushTransition
- (void)dealloc{

}
- (NSTimeInterval)transitionDuration:(id <UIViewControllerContextTransitioning>)transitionContext{
    return 0.5f;
}
- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext{
//    UIViewController *fromViewCtrl = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
//    UIViewController *toViewCtrl = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];

    UIView* toView = nil;
    UIView* fromView = nil;
    fromView = [transitionContext viewForKey:UITransitionContextFromViewKey];
    toView = [transitionContext viewForKey:UITransitionContextToViewKey];

    [[transitionContext containerView]  addSubview:toView];

    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    CGFloat height = [UIScreen mainScreen].bounds.size.height;

    toView.frame = CGRectMake(width, 0, width, height);
    [toView imx_showShadow:CGSizeMake(-4, 0)];
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        toView.frame = CGRectMake(0, 0, width, height);
        fromView.layer.transform = CATransform3DMakeScale(0.98, 0.98, 1);
    } completion:^(BOOL finished) {
        [toView imx_hideShadow];
        fromView.layer.transform = CATransform3DIdentity;
        [transitionContext completeTransition:YES];
    }];

}
@end

@implementation IMXPopTransition
- (void)dealloc{

}
- (NSTimeInterval)transitionDuration:(id <UIViewControllerContextTransitioning>)transitionContext{
    return 0.5f;
}
- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext{
    UIView* toView = nil;
    UIView* fromView = nil;
    fromView = [transitionContext viewForKey:UITransitionContextFromViewKey];
    toView = [transitionContext viewForKey:UITransitionContextToViewKey];
    [[transitionContext containerView] insertSubview:toView belowSubview:fromView];

    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    CGFloat height = [UIScreen mainScreen].bounds.size.height;

    fromView.frame = CGRectMake(0, 0, width, height);
    toView.layer.transform = CATransform3DMakeScale(0.98, 0.98, 1);
    [fromView imx_showShadow:CGSizeMake(-4, 0)];
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        fromView.frame = CGRectMake(width, 0, width, height);
        toView.layer.transform = CATransform3DMakeScale(1, 1, 1);
    } completion:^(BOOL finished) {
        toView.layer.transform = CATransform3DIdentity;
        [fromView imx_hideShadow];
        [transitionContext completeTransition:!transitionContext.transitionWasCancelled];
    }];
}

@end

