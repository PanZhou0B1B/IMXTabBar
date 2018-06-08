//
//  UIView+IMXTransitionKit.m
//  IMXTransitionKit
//
//  Created by zhoupanpan on 2018/4/12.
//  Copyright © 2018年 panzhow. All rights reserved.
//

#import "UIView+IMXTransitionKit.h"

@implementation UIView (IMXTransitionKit)
- (void)imx_showShadow:(CGSize)offset{
    self.layer.shadowOffset = offset;
    self.layer.shadowColor = [[UIColor blackColor] CGColor];
    self.layer.shadowRadius = 4.0f;
    self.layer.shadowOpacity = 0.20f;
    self.layer.shadowPath = [[UIBezierPath bezierPathWithRect:self.layer.bounds] CGPath];
}
- (void)imx_hideShadow{
    self.layer.shadowOpacity = 0.0f;
}
+ (UIWindow *)imx_window{
    UIWindow * window = [[UIApplication sharedApplication] keyWindow];
    if (window.windowLevel != UIWindowLevelNormal)
    {
        NSArray *windows = [[UIApplication sharedApplication] windows];
        for(UIWindow * tmpWin in windows)
        {
            if (tmpWin.windowLevel == UIWindowLevelNormal)
            {
                window = tmpWin;
                break;
            }
        }
    }
    return window;
}
@end
