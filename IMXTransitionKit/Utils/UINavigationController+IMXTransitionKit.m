//
//  UINavigationController+IMXTransitionKit.m
//  IMXTransitionKit
//
//  Created by zhoupanpan on 2018/4/17.
//  Copyright © 2018年 panzhow. All rights reserved.
//

#import "UINavigationController+IMXTransitionKit.h"
#import <objc/runtime.h>
static char const * const IMXPermitInteractKey = "IMXPermitInteractKey";

@implementation UINavigationController (IMXTransitionKit)

- (void)setPermitInteract:(BOOL)permitInteract{
    NSNumber *number = [NSNumber numberWithBool: permitInteract];
    objc_setAssociatedObject(self, IMXPermitInteractKey, number , OBJC_ASSOCIATION_RETAIN);
}
- (BOOL)permitInteract{
    NSNumber *number = objc_getAssociatedObject(self, IMXPermitInteractKey);
    return [number boolValue];
}
@end
