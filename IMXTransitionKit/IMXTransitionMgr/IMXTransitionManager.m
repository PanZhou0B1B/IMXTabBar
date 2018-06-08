//
//  IMXTransitionManager.m
//  IMXTransitionKit
//
//  Created by zhoupanpan on 2018/4/12.
//  Copyright © 2018年 panzhow. All rights reserved.
//

#import "IMXTransitionManager.h"
#import "UIView+IMXTransitionKit.h"
#import "IMXTransitionModel.h"

@interface IMXTransitionManager()
@property (nonatomic,strong)NSMutableArray *transionModels;

@property (nonatomic,copy)NSString *defaultPushTran;
@property (nonatomic,copy)NSString *defaultPopTran;

@property (nonatomic,strong)UIView *popSnapshotView;
@end

@implementation IMXTransitionManager

- (void)dealloc{
}
#pragma mark ======  public  ======
+ (IMXTransitionManager *)sharedInstance
{
    static IMXTransitionManager *instance=nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[IMXTransitionManager alloc] init];
    });
    return instance;
}
- (void)regitstDefaultPushTransition:(NSString *)name{
    if(!name) { return; }

    self.defaultPushTran = name;
}
- (void)regitstDefaultPopTransition:(NSString *)name{
    if(!name) { return; }

    self.defaultPopTran = name;
}
- (void)registTransitionFromCtrl:(NSString *)from toCtrl:(NSString *)to fromTran:(NSString *)fromTran toTran:(NSString *)toTran{
    NSString *name = [self trimString:[NSString stringWithFormat:@"%@%@",from,to]];
    [self registTransition:IMXTransitionTypePushPop name:name fromCtrl:from toCtrl:to fromTran:fromTran toTran:toTran direction:IMXTransitionDirBoth];
}
- (id<UIViewControllerAnimatedTransitioning>)defaultPushTransition{
    if(!self.defaultPushTran) { return nil; }
    Class tranClass = NSClassFromString(self.defaultPushTran);
    if(!tranClass) { return nil; }
    return [[tranClass alloc] init];
}
- (id<UIViewControllerAnimatedTransitioning>)defaultPopTransition{
    if(!self.defaultPopTran) { return nil; }

    Class tranClass = NSClassFromString(self.defaultPopTran);
    if(!tranClass) { return nil; }
    return [[tranClass alloc] init];
}
- (id<UIViewControllerAnimatedTransitioning>)transitionFromCtrl:(id)fromCtrl toCtrl:(id)toCtrl{
    NSString *transtion = [self transitionFromCtrl:fromCtrl toCtrl:toCtrl reverse:NO];
    Class tranClass = NSClassFromString(transtion);
    if(!tranClass) { return nil; }
    return [[tranClass alloc] init];
}
- (id<UIViewControllerAnimatedTransitioning>)reverseTransitionFromCtrl:(id)fromCtrl toCtrl:(id)toCtrl{
    NSString *transtion = [self transitionFromCtrl:fromCtrl toCtrl:toCtrl reverse:YES];
    Class tranClass = NSClassFromString(transtion);
    if(!tranClass) { return nil; }
    return [[tranClass alloc] init];
}
- (void)removeTransitionFromCtrl:(NSString *)from toCtrl:(NSString *)to{
    NSString *name = [self trimString:[NSString stringWithFormat:@"%@%@",from,to]];
    [self removeTransition:name];
}
- (void)popSnapshotFromWindow{
    self.popSnapshotView = [[UIView imx_window] snapshotViewAfterScreenUpdates:NO];
}
- (UIView *)popSnapshot{
    return self.popSnapshotView;
}
#pragma mark ======  life cycle  ======

#pragma mark ======  delegate  ======

#pragma mark ======  event  ======

#pragma mark ======  private  ======
- (void)registTransition:(IMXTransitionType)type name:(NSString *)name fromCtrl:(NSString *)from toCtrl:(NSString *)to fromTran:(NSString *)fromTran toTran:(NSString *)toTran direction:(IMXTransitionDir)dir{
    if([self isExistTransion:name]){
        return;
    }
    IMXTransitionModel *model = [IMXTransitionModel new];
    model.fromClass = from;
    model.toClass = to;
    model.fromTranName = fromTran;
    model.toTranName = toTran;
    model.dir = dir;
    model.name = name;

    [self.transionModels addObject:model];
}
- (NSString *)transitionFromCtrl:(id)fromCtrl toCtrl:(id)toCtrl reverse:(BOOL)isReverse{
    NSString *name = nil;
    if(isReverse){
        name = [self trimString:[NSString stringWithFormat:@"%@%@",NSStringFromClass([toCtrl class]),NSStringFromClass([fromCtrl class])]];
    }else{
        name = [self trimString:[NSString stringWithFormat:@"%@%@",NSStringFromClass([fromCtrl class]),NSStringFromClass([toCtrl class])]];
    }

    IMXTransitionModel *model = [self modelForName:name];
    if(!model){
        return nil;
    }
    if(isReverse){
        return model.toTranName;
    }else{
        return model.fromTranName;
    }
}
- (BOOL)isExistTransion:(NSString *)name{
    if(!name) { return NO; }

    __block NSInteger index = -1;
    [self.transionModels enumerateObjectsUsingBlock:^(IMXTransitionModel * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if([obj.name isEqualToString:name]){
            index = idx;
            *stop = YES;
        }
    }];
    if(index >= 0){
        return YES;
    }
    return NO;
}
- (void)removeTransition:(NSString *)name{
    if(!name) { return; }

    __block NSInteger index = -1;
    [self.transionModels enumerateObjectsUsingBlock:^(IMXTransitionModel * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if([obj.name isEqualToString:name]){
            index = idx;
            *stop = YES;
        }
    }];
    if(index >= 0){
        [self.transionModels removeObjectAtIndex:index];
    }
}
- (IMXTransitionModel *)modelForName:(NSString *)name{
    if(!name) { return nil; }

    __block IMXTransitionModel *model = nil;
    [self.transionModels enumerateObjectsUsingBlock:^(IMXTransitionModel * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if([obj.name isEqualToString:name]){
            model = obj;
            *stop = YES;
        }
    }];
    return model;
}
- (NSString *)trimString:(NSString *)string{
    NSCharacterSet *set = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    return [string stringByTrimmingCharactersInSet:set];
}
#pragma mark ======  getter & setter  ======
- (NSMutableArray *)transionModels{
    if(!_transionModels){
        _transionModels = [[NSMutableArray alloc] init];
    }
    return _transionModels;
}

@end
