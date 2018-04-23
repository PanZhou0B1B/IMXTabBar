//
//  MsgViewController.m
//  IMXTabBar
//
//  Created by zhoupanpan on 2018/4/20.
//  Copyright © 2018年 panzhow. All rights reserved.
//

#import "MsgViewController.h"

@interface MsgViewController ()

@end

@implementation MsgViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
     self.title = @"Message";
    self.hideNavigation = YES;
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:YES];

    self.view.backgroundColor = [UIColor lightTextColor];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
