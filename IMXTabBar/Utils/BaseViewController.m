//
//  BaseViewController.m
//  IMXTabBar
//
//  Created by zhoupanpan on 2018/4/23.
//  Copyright © 2018年 panzhow. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)dealloc{
}
#pragma mark ======  public  ======
- (void)navigationCanDragBack:(BOOL)canDragBack{
    self.navigationController.interactivePopGestureRecognizer.enabled = canDragBack;
}
- (void)refreshNavi{
    UINavigationController *navi = [TabBarRouteKit imxRootNaviCtrl];
    if(self.isHideNavigation){
        [navi setNavigationBarHidden:YES animated:YES];
    }else{
        [navi setNavigationBarHidden:NO animated:YES];
    }
}
#pragma mark ======  life cycle  ======
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.hideNavigation = NO;
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self refreshNavi];
}
- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
}

#pragma mark ======  delegate  ======

#pragma mark ======  event  ======

#pragma mark ======  private  ======

#pragma mark ======  getter & setter  ======



@end
