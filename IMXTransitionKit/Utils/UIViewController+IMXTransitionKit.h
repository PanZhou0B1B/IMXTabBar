//
//  UIViewController+IMXTransitionKit.h
//  DHgate
//
//  Created by zhoupanpan on 2018/4/23.
//  Copyright © 2018年 dhgate. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (IMXTransitionKit)
///是否允许侧滑手势(Ctrl级别)
@property (nonatomic,assign)BOOL permitSlide;
///是否允许隐藏导航的titleView
@property (nonatomic,assign)BOOL permintHideTitleView;
@end
