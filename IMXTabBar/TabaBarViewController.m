//
//  TabaBarViewController.m
//  IMXTabBar
//
//  Created by zhoupanpan on 2018/4/20.
//  Copyright © 2018年 panzhow. All rights reserved.
//

#import "TabaBarViewController.h"
#import "IMXTabBarKit.h"
@interface TabaBarViewController ()
@property (nonatomic,strong)NSArray *items;
@end

@implementation TabaBarViewController

- (void)dealloc{
}
#pragma mark ======  public  ======

#pragma mark ======  life cycle  ======
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self UIConfig];

    IMX_Show_TabBar_AtIndex(0);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark ======  delegate  ======

#pragma mark ======  event  ======

#pragma mark ======  private  ======
- (void)UIConfig{
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"TabbarConfig" withExtension:@"plist"];
    NSArray *itemsArray = [[NSArray alloc] initWithContentsOfURL:url];
    NSMutableArray *tmpItems = [[NSMutableArray alloc] init];
    for (NSDictionary *dic in itemsArray) {
        @autoreleasepool{
            IMXTabbarItemModel *model = [IMXTabbarItemModel new];
            model.selected = [[dic objectForKey:@"selected"] boolValue];
            model.itemImg = [UIImage imageNamed:[dic objectForKey:@"itemImg"]];
            model.itemSelectedImg = [UIImage imageNamed:[dic objectForKey:@"itemSelectedImg"]];
            model.itemTitle = [dic objectForKey:@"itemTitle"];
            model.pageClass = [dic objectForKey:@"pageClass"];
            model.rootNavi = [dic objectForKey:@"rootNavi"];

            model.normalColor = [UIColor colorWithRed:104/255.0 green:101/255.0 blue:94/255.0 alpha:1.0];
            model.highColor = [UIColor colorWithRed:243/255.0 green:178/255.0 blue:2/255.0 alpha:1.0];
            [tmpItems addObject:model];
        }
    }
    self.items = tmpItems;
    [self refreshTabBar:self.items];

}
#pragma mark ======  getter & setter  ======


@end
