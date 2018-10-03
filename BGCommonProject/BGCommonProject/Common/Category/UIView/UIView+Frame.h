//
//  UIView+Frame.h
//  BGCommonProject
//
//  Created by 冉彬 on 2018/10/3.
//  Copyright © 2018年 Binge. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Frame)

@property (nonatomic) CGFloat frameX;
@property (nonatomic) CGFloat frameY;
@property (nonatomic) CGFloat width;
@property (nonatomic) CGFloat height;
@property (nonatomic) CGFloat maxY;
@property (nonatomic) CGFloat maxX;
@property (nonatomic) CGFloat centerX;
@property (nonatomic) CGFloat centerY;
// 下面属性调用set方法时会改变控件的高或者宽
@property (nonatomic) CGFloat top;
@property (nonatomic) CGFloat left;
@property (nonatomic) CGFloat bottom;
@property (nonatomic) CGFloat right;

@end
