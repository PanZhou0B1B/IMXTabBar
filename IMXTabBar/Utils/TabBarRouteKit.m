//
//  TabBarRouteKit.m
//  IMXTabBar
//
//  Created by zhoupanpan on 2018/4/23.
//  Copyright © 2018年 panzhow. All rights reserved.
//

#import "TabBarRouteKit.h"
#import "IMXTabBarViewController.h"

@implementation TabBarRouteKit

+ (UINavigationController *)imxRootNaviCtrl{
    UINavigationController * rootNavi =(UINavigationController *)[[UIApplication sharedApplication] keyWindow].rootViewController;
    if(rootNavi && [NSStringFromClass([rootNavi class]) isEqualToString:@"UINavigationController"]){
        return rootNavi;
    }else{
        return nil;
    }
}
+ (void)imxPushViewCtrl:(UIViewController*)viewController animated:(BOOL)animated{
    UINavigationController * rootNavi = [self imxRootNaviCtrl];
    [rootNavi pushViewController:viewController animated:animated];
}
+ (void)dhbackToTabbar{
    UINavigationController * rootNavi = [self imxRootNaviCtrl];
    [rootNavi popToRootViewControllerAnimated:YES];
}
+ (void)dhbackToTabbar_Home{
    [self dhbackToTabbar];
    IMX_Show_TabBar_AtIndex(0);
}
@end
