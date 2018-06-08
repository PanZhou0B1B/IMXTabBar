//
//  IMXBaseNaviDelegate.m
//  IMXTransitionKit
//
//  Created by zhoupanpan on 2018/4/12.
//  Copyright © 2018年 panzhow. All rights reserved.
//

#import "IMXBaseNaviDelegate.h"
#import "UINavigationController+IMXTransitionKit.h"
#import "UIViewController+IMXTransitionKit.h"
@interface IMXBaseNaviDelegate()<UINavigationControllerDelegate>
@property (nonatomic,weak)UINavigationController *navigationCtrl;

@property (nonatomic,strong,) UIPanGestureRecognizer *pan;
@property (nonatomic, assign,getter=isHasPanAdded) BOOL hasPanAdded;
@property (nonatomic,strong) UIPercentDrivenInteractiveTransition *interactionCtrl;

@end
@implementation IMXBaseNaviDelegate
- (void)dealloc{
}
#pragma mark ======  public  ======
+ (id <UINavigationControllerDelegate>)sharedInstance
{
    static id instance=nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    return instance;
}
- (void)setupWithNavi:(UINavigationController *)navi{
    navi.delegate = self;
    self.navigationCtrl = navi;
    self.navigationCtrl.permitInteract = YES;
    self.navigationCtrl.interactivePopGestureRecognizer.enabled = NO;
    [self dataConfig];
}
#pragma mark ======  life cycle  ======
- (instancetype)init{
    self = [super init];
    if (self) {
        _hasPanAdded = NO;
    }
    return self;
}
#pragma mark ======  delegate  ======
- (id<UIViewControllerInteractiveTransitioning>)navigationController:(UINavigationController *)navigationController interactionControllerForAnimationController:(id<UIViewControllerAnimatedTransitioning>)animationController{
    BOOL permitPan = self.navigationCtrl.permitInteract ;
    if(permitPan){
        return self.interactionCtrl;
    }
    return nil;
}
#pragma mark ======  event  ======
- (void)panAction:(UIPanGestureRecognizer *)pan{
    UIViewController *topCtrl = self.navigationCtrl.topViewController;
    BOOL permitPan = self.navigationCtrl.permitInteract;// && topCtrl.permitSlide;
    if(!permitPan){
        return;
    }
    CGFloat process = [pan translationInView:self.navigationCtrl.view].x / ([UIScreen mainScreen].bounds.size.width);

    process = MIN(1.0,(MAX(0.0, process)));

    if (pan.state == UIGestureRecognizerStateBegan) {

        //触发pop转场动画
        if(topCtrl.permitSlide){
            self.interactionCtrl = [UIPercentDrivenInteractiveTransition new];
            [self.navigationCtrl popViewControllerAnimated:YES];
        }else{
            return;
        }


    }else if (pan.state == UIGestureRecognizerStateChanged){
        [self.interactionCtrl updateInteractiveTransition:process];
    }else if (pan.state == UIGestureRecognizerStateEnded
              || pan.state == UIGestureRecognizerStateCancelled){
        if (process > 0.5) {
            [ self.interactionCtrl finishInteractiveTransition];
        }else{
            [ self.interactionCtrl cancelInteractiveTransition];
        }
        self.interactionCtrl = nil;
    }
}
#pragma mark ======  private  ======
- (void)dataConfig{
    if(!self.isHasPanAdded){
        [self.navigationCtrl.view addGestureRecognizer:self.pan];
        self.hasPanAdded = YES;
    }
}
#pragma mark ======  getter & setter  ======
- (UIPanGestureRecognizer *)pan{
    if(!_pan){
        _pan = [[UIPanGestureRecognizer alloc] init];
        [_pan addTarget:self action:@selector(panAction:)];
    }
    return _pan;
}

@end
