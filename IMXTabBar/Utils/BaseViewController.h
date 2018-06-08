//
//  BsaseViewController.h
//  IMXTabBar
//
//  Created by zhoupanpan on 2018/4/23.
//  Copyright © 2018年 panzhow. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TabBarRouteKit.h"
#import "IMXTitleView.h"

@interface BaseViewController : UIViewController
@property (nonatomic,assign,getter=isHideNavigation)BOOL hideNavigation;

@property (nonatomic,strong)IMXTitleView *titleView;

- (void)navigationCanDragBack:(BOOL)canDragBack;
@end
