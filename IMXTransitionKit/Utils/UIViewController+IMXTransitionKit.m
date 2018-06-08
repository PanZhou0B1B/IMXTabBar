//
//  UIViewController+IMXTransitionKit.m
//  DHgate
//
//  Created by zhoupanpan on 2018/4/23.
//  Copyright © 2018年 dhgate. All rights reserved.
//

#import "UIViewController+IMXTransitionKit.h"
#import <objc/runtime.h>
static char const * const IMXPermitSlideKey = "IMXPermitSlideKey";
static char const * const IMXPermintHideTitleViewKey = "IMXPermintHideTitleViewKey";

@implementation UIViewController (IMXTransitionKit)
- (void)setPermitSlide:(BOOL)permitSlide{
    NSNumber *number = [NSNumber numberWithBool: permitSlide];
    objc_setAssociatedObject(self, IMXPermitSlideKey, number , OBJC_ASSOCIATION_RETAIN);
}
- (BOOL)permitSlide{
    NSNumber *number = objc_getAssociatedObject(self, IMXPermitSlideKey);
    return [number boolValue];
}
- (void)setPermintHideTitleView:(BOOL)permintHideTitleView{
    NSNumber *number = [NSNumber numberWithBool: permintHideTitleView];
    objc_setAssociatedObject(self, IMXPermintHideTitleViewKey, number , OBJC_ASSOCIATION_RETAIN);
}
- (BOOL)permintHideTitleView{
    NSNumber *number = objc_getAssociatedObject(self, IMXPermintHideTitleViewKey);
    return [number boolValue];
}
@end
