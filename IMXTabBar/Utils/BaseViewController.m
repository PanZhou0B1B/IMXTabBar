//
//  BaseViewController.m
//  IMXTabBar
//
//  Created by zhoupanpan on 2018/4/23.
//  Copyright © 2018年 panzhow. All rights reserved.
//

#import "BaseViewController.h"
#import "IMXTransitionKit.h"

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
    self.permitSlide = YES;
    self.navigationItem.hidesBackButton = YES;
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self refreshNavi];
    self.titleView.hidden = NO;
}
- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
}
- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self refreshNavi];
    if(self.permintHideTitleView){
        self.titleView.hidden = YES;
    }
}
- (void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
}
- (void)setTitle:(NSString *)title{
    [super setTitle:title];

    self.titleView.title = title;
}


#pragma mark ======  delegate  ======

#pragma mark ======  event  ======

#pragma mark ======  private  ======

#pragma mark ======  getter & setter  ======
- (IMXTitleView *)titleView{
    if(!_titleView){
        _titleView = [[IMXTitleView alloc] initWithFrame:CGRectMake(6, 0, [UIScreen mainScreen].bounds.size.width-12, 44)];
        self.navigationItem.titleView = _titleView;
    }
    return _titleView;
}


@end
