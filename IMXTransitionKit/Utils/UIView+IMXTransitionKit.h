//
//  UIView+IMXTransitionKit.h
//  IMXTransitionKit
//
//  Created by zhoupanpan on 2018/4/12.
//  Copyright © 2018年 panzhow. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (IMXTransitionKit)
- (void)imx_showShadow:(CGSize)offset;
- (void)imx_hideShadow;
+ (UIWindow *)imx_window;
@end
