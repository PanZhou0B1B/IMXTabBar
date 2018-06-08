//
//  HomeViewController.m
//  IMXTabBar
//
//  Created by zhoupanpan on 2018/4/20.
//  Copyright © 2018年 panzhow. All rights reserved.
//

#import "HomeViewController.h"
#import "NextSubViewController.h"
#import <Masonry/Masonry.h>
@interface HomeViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)UITableView *listView;
@property (nonatomic,strong)NSMutableArray *lists;
@end

@implementation HomeViewController

- (void)dealloc{
}
#pragma mark ======  public  ======

#pragma mark ======  life cycle  ======
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"Home";
    self.hideNavigation = YES;
    
    [self.view addSubview:self.listView];
    [self.lists addObject:@"push to next ctrl"];
    [self.listView reloadData];

    self.view.backgroundColor = [UIColor darkGrayColor];
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}
#pragma mark ======  delegate  ======
#pragma mark - UITableView Datasource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.lists.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"Cell";

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];

    if(cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    NSString *title = self.lists[indexPath.row];
    cell.textLabel.text = title;

    return cell;
}

#pragma mark - UITableView Delegate methods

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    NextSubViewController *ctrl = [NextSubViewController new];
    [TabBarRouteKit imxPushViewCtrl:ctrl animated:YES];
}
#pragma mark ======  event  ======

#pragma mark ======  private  ======

#pragma mark ======  getter & setter  ======
- (UITableView *)listView{
    if(!_listView){
        _listView = [[UITableView alloc] initWithFrame:self.view.bounds];
        _listView.delegate = self;
        _listView.dataSource = self;
    }
    return _listView;
}
- (NSMutableArray *)lists{
    if(!_lists){
        _lists = [[NSMutableArray alloc] init];
    }
    return _lists;
}


@end
