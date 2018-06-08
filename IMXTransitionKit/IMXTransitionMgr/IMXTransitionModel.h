//
//  IMXTransitionModel.h
//  IMXTransitionKit
//
//  Created by zhoupanpan on 2018/4/12.
//  Copyright © 2018年 panzhow. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, IMXTransitionDir) {
    IMXTransitionDirBoth = 0,
    IMXTransitionDirFrom,
    IMXTransitionDirTo
};

@interface IMXTransitionModel : NSObject
@property (nonatomic,copy)NSString *name;
@property (nonatomic,copy)NSString *fromClass;
@property (nonatomic,copy)NSString *toClass;
@property (nonatomic,copy)NSString *fromTranName;
@property (nonatomic,copy)NSString *toTranName;
@property (nonatomic,assign)IMXTransitionDir dir;

@end
