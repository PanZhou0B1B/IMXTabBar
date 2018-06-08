//
//  NextSubViewController.m
//  IMXTabBar
//
//  Created by zhoupanpan on 2018/4/23.
//  Copyright © 2018年 panzhow. All rights reserved.
//

#import "NextSubViewController.h"
#import "SubViewController.h"

@interface NextSubViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)UITableView *listView;
@property (nonatomic,strong)NSMutableArray *lists;

@end

@implementation NextSubViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //self.title = @"sub ctrl";
    self.view.backgroundColor = [UIColor whiteColor];
    //[self.navigationController setNavigationBarHidden:NO animated:NO];

    [self.view addSubview:self.listView];
    [self.lists addObject:@"push0"];
    [self.lists addObject:@"push1"];
    [self.lists addObject:@"push2"];
    [self.lists addObject:@"push3"];
    [self.listView reloadData];
    self.titleView.showBack = YES;
    self.titleView.searchKey = @"next next";
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];

    self.titleView.showBack = YES;
    self.titleView.searchKey = @"ext next";
}
- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
}
- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
}
- (void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

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

    SubViewController *ctrl = [SubViewController new];
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
