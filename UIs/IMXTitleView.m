//
//  IMXTitleView.m
//  IMXTabBar
//
//  Created by zhoupanpan on 2018/4/24.
//  Copyright © 2018年 panzhow. All rights reserved.
//

#import "IMXTitleView.h"
#import <Masonry/Masonry.h>

@interface IMXTitleView()
@property (nonatomic,strong)UILabel *titleLB;
@property (nonatomic,strong)UITextField *searchTF;
@property (nonatomic,strong)UIButton *backBtn;
@end

@implementation IMXTitleView

- (void)dealloc{
}
#pragma mark ======  public  ======
- (void)setTitle:(NSString *)title{
    _title = [title copy];
    self.titleLB.text = title;
}
- (void)setSearchKey:(NSString *)searchKey{
    _searchKey = [searchKey copy];
    self.searchTF.placeholder = searchKey;
}
- (void)setShowBack:(BOOL)showBack{
    _showBack = showBack;
    self.backBtn.hidden = !showBack;
}
#pragma mark ======  life cycle  ======
- (instancetype)init{
    self = [super init];
    if (self) {
        [self UIconfig];
    }
    return self;
}
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        [self UIconfig];
    }
    return self;
}
- (CGSize)intrinsicContentSize {
    return UILayoutFittingExpandedSize;
}
#pragma mark ======  delegate  ======

#pragma mark ======  event  ======

#pragma mark ======  private  ======
- (void)UIconfig{
    [self addSubview:self.titleLB];
    [self.titleLB mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self);
        make.top.equalTo(self);
        make.right.equalTo(self);
        make.bottom.equalTo(self);
    }];
    [self addSubview:self.searchTF];
    [self.searchTF mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self);
        make.top.equalTo(self);
        make.right.equalTo(self);
        make.bottom.equalTo(self);
    }];
    [self addSubview:self.backBtn];
    [self.backBtn mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self);
        make.top.equalTo(self);
        make.width.mas_equalTo(44);
        make.bottom.equalTo(self);
    }];
}
#pragma mark ======  getter & setter  ======
- (UILabel *)titleLB{
    if(!_titleLB){
        _titleLB = [UILabel new];
        _titleLB.textColor = [UIColor blackColor];
        _titleLB.textAlignment = NSTextAlignmentCenter;
    }
    return _titleLB;
}
- (UITextField *)searchTF{
    if(!_searchTF){
        _searchTF = [UITextField new];
        _searchTF.textColor = [UIColor redColor];
        _searchTF.textAlignment = NSTextAlignmentCenter;
    }
    return _searchTF;
}
- (UIButton *)backBtn{
    if(!_backBtn){
        _backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_backBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_backBtn setTitle:@"back" forState:UIControlStateNormal];
        _backBtn.hidden = YES;
    }
    return _backBtn;
}

@end
