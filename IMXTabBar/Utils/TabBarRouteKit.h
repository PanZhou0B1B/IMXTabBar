//
//  TabBarRouteKit.h
//  IMXTabBar
//
//  Created by zhoupanpan on 2018/4/23.
//  Copyright © 2018年 panzhow. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface TabBarRouteKit : NSObject
+ (UINavigationController *)imxRootNaviCtrl;
+ (void)imxPushViewCtrl:(UIViewController*)viewController animated:(BOOL)animated;
+ (void)dhbackToTabbar;
+ (void)dhbackToTabbar_Home;
@end
