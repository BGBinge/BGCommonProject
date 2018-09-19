//
//  BGTabBar.h
//  BGCommonProject
//
//  Created by 冉彬 on 2018/9/18.
//  Copyright © 2018年 冉彬. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol BGTabBarDelegate <UITabBarDelegate>

@optional // 选择实现的代理方法

/**
 * 中心加号按钮被点击点击
 */
-(void)centerBtnAction;


@end

@interface BGTabBar : UITabBar

@property (nonatomic, weak) id<BGTabBarDelegate> myDelegate;

@end
