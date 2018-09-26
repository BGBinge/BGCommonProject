//
//  BGTabBar.m
//  BGCommonProject
//
//  Created by 冉彬 on 2018/9/18.
//  Copyright © 2018年 冉彬. All rights reserved.
//

#import "BGTabBar.h"


@interface BGTabBar ()

@property (nonatomic, strong) UIButton *centerBtn; // 中心加号按钮

@end



@implementation BGTabBar

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.centerBtn];
    }
    return self;
}

/**
 *  重新布局tabBar上面的控件
 */
- (void)layoutSubviews
{
    [super layoutSubviews];

    // tabbar个数（一般加 加号按钮 是5个）
    int tabBarBtnNum = 5;
    
    // 设置加号按钮的位置
    self.centerBtn.center = CGPointMake(CGRectGetWidth(self.frame) * 0.5, CGRectGetHeight(self.frame) * 0.1 + 8);
    
    // 设置其他tabbarButton的位置
    CGFloat tabBarBtnW = CGRectGetWidth(self.frame) / tabBarBtnNum;
    int tabBarBtnIndex = 0;
    for (UIView *childView in self.subviews)
    {
        if ([childView isKindOfClass:NSClassFromString(@"UITabBarButton")])
        {
            childView.frame = CGRectMake(tabBarBtnW * tabBarBtnIndex, childView.frame.origin.y, tabBarBtnW, childView.frame.size.height);
            tabBarBtnIndex += (tabBarBtnIndex == (tabBarBtnNum/2 - 1) ? 2 : 1);
        }
    }
}


/**
 重写hitTest方法以响应点击超出tabBar的加号按钮
 */
- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
    if (!self.clipsToBounds && !self.hidden && self.alpha > 0)
    {
        UIView *result = [super hitTest:point withEvent:event];
        if (result)
        {
            return result;
        }
        else
        {
            for (UIView *subview in self.subviews.reverseObjectEnumerator)
            {
                CGPoint subPoint = [subview convertPoint:point fromView:self];
                result = [subview hitTest:subPoint withEvent:event];
                if (result)
                {
                    return result;
                }
            }
        }
    }
    return nil;
}

/**
 * 点击了加号按钮
 */
- (void)centerBtnAction
{
    // 通知代理
    if ([self.delegate respondsToSelector:@selector(centerBtnAction)])
    {
        [self.myDelegate centerBtnAction];
    }
}


#pragma mark - Get

-(UIButton *)centerBtn
{
    if (!_centerBtn)
    {
        UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 80, 80)];
        [btn setImage:[UIImage imageNamed:@"tabBar_centerBtn_image"] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:@"tabBar_centerBtn_image_sel"] forState:UIControlStateHighlighted];
        [btn setTitle:@"" forState:0];
        [btn setTitleColor:[UIColor clearColor] forState:0];
        [btn addTarget:self action:@selector(centerBtnAction) forControlEvents:UIControlEventTouchUpInside];
        _centerBtn = btn;
    }
    return _centerBtn;
}


@end
