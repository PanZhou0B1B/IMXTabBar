//
//  IMXTransitionManager.h
//  IMXTransitionKit
//
//  Created by zhoupanpan on 2018/4/12.
//  Copyright © 2018年 panzhow. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#define IMXTransitionMgr [IMXTransitionManager sharedInstance]

typedef NS_ENUM(NSInteger, IMXTransitionType) {
    IMXTransitionTypePushPop = 0,
};

@interface IMXTransitionManager : NSObject

+ (IMXTransitionManager *)sharedInstance;
- (void)regitstDefaultPushTransition:(NSString *)name;
- (void)regitstDefaultPopTransition:(NSString *)name;
//默认去重（已存在时，则不重复添加）
- (void)registTransitionFromCtrl:(NSString *)from toCtrl:(NSString *)to fromTran:(NSString *)fromTran toTran:(NSString *)toTran;
- (id<UIViewControllerAnimatedTransitioning>)defaultPushTransition;
- (id<UIViewControllerAnimatedTransitioning>)defaultPopTransition;
- (id<UIViewControllerAnimatedTransitioning>)transitionFromCtrl:(id)fromCtrl toCtrl:(id)toCtrl;
- (id<UIViewControllerAnimatedTransitioning>)reverseTransitionFromCtrl:(id)fromCtrl toCtrl:(id)toCtrl;
- (void)removeTransitionFromCtrl:(NSString *)from toCtrl:(NSString *)to;

- (void)popSnapshotFromWindow;
- (UIView *)popSnapshot;
@end
