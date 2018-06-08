//
//  IMXPushPopParallaxTransitions.h
//  IMXTransitionKit
//
//  Created by zhoupanpan on 2018/4/12.
//  Copyright © 2018年 panzhow. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#define K_IMXPushParallaxTransition @"IMXPushParallaxTransition"
#define K_IMXPopParallaxTransition @"IMXPopParallaxTransition"

/**
 具有简单视差效果的push、pop转场动画
 */
@interface IMXPushPopParallaxTransitions : NSObject

@end

@interface IMXPushParallaxTransition : NSObject<UIViewControllerAnimatedTransitioning>

@end

@interface IMXPopParallaxTransition : NSObject<UIViewControllerAnimatedTransitioning>

@end
