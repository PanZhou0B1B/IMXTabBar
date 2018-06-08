//
//  IMXBaseNaviDelegate.h
//  IMXTransitionKit
//
//  Created by zhoupanpan on 2018/4/12.
//  Copyright © 2018年 panzhow. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface IMXBaseNaviDelegate : NSObject
+ (id <UINavigationControllerDelegate>)sharedInstance;
- (void)setupWithNavi:(UINavigationController *)navi;
@end
