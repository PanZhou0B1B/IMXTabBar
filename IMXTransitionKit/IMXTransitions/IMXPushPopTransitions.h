//
//  IMXPushPopTransitions.h
//  IMXTransitionKit
//
//  Created by zhoupanpan on 2018/4/12.
//  Copyright © 2018年 panzhow. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
/**
 简单的push、pop转场动画
 */
#define K_IMXPushTransition @"IMXPushTransition"
#define K_IMXPopTransition @"IMXPopTransition"
@interface IMXPushPopTransitions : NSObject

@end

@interface IMXPushTransition : NSObject<UIViewControllerAnimatedTransitioning>

@end
@interface IMXPopTransition : NSObject<UIViewControllerAnimatedTransitioning>

@end
