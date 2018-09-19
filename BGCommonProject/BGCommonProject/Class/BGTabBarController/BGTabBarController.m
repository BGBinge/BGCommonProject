//
//  BGTabBarController.m
//  BGCommonProject
//
//  Created by 冉彬 on 2018/9/18.
//  Copyright © 2018年 冉彬. All rights reserved.
//

#import "BGTabBarController.h"
#import "BGTabBar.h"

#import "VUserCenterVC.h"
#import "VChatVC.h"
#import "VFindVC.h"
#import "VHomeVC.h"



@interface BGTabBarController () <BGTabBarDelegate>
@property (nonatomic, strong) VHomeVC *homeVC;
@property (nonatomic, strong) VFindVC *findVC;
@property (nonatomic, strong) VChatVC *chatVC;
@property (nonatomic, strong) VUserCenterVC *userVC;

@end

@implementation BGTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setNavigationControllerAndAddChildVC:self.homeVC];
    [self setNavigationControllerAndAddChildVC:self.findVC];
    [self setNavigationControllerAndAddChildVC:self.chatVC];
    [self setNavigationControllerAndAddChildVC:self.userVC];
    
    BGTabBar *tabBar = [[BGTabBar alloc] initWithFrame:self.tabBar.frame];
    //透明效果
    tabBar.translucent = YES;
    tabBar.myDelegate = self;
    [self setValue:tabBar forKey:@"tabBar"];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



-(void)setNavigationControllerAndAddChildVC:(UIViewController *)vc
{
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
    nav.navigationBar.translucent = YES;
    [self addChildViewController:nav];
}


#pragma mark - Get
-(VHomeVC *)homeVC
{
    if (!_homeVC)
    {
        VHomeVC *vc = [[VHomeVC alloc] init];
        vc.title = @"首页";
        vc.tabBarItem.image = [[UIImage imageNamed:@"tabBar_home"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        vc.tabBarItem.selectedImage = [[UIImage imageNamed:@"tabBar_home_sel"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        [vc.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor redColor]} forState:UIControlStateSelected];
        vc.tabBarItem.title = @"首页";
        _homeVC = vc;
    }
    return _homeVC;
}


-(VFindVC *)findVC
{
    if (!_findVC)
    {
        VFindVC *vc = [[VFindVC alloc] init];
        vc.title = @"发现";
        vc.tabBarItem.image = [[UIImage imageNamed:@"tabBar_find"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        vc.tabBarItem.selectedImage = [[UIImage imageNamed:@"tabBar_find_sel"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        [vc.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor redColor]} forState:UIControlStateSelected];
        vc.tabBarItem.title = @"发现";
        _findVC = vc;
    }
    return _findVC;
}


-(VChatVC *)chatVC
{
    if (!_chatVC)
    {
        VChatVC *vc = [[VChatVC alloc] init];
        vc.title = @"消息";
        vc.tabBarItem.image = [[UIImage imageNamed:@"tabBar_chat"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        vc.tabBarItem.selectedImage = [[UIImage imageNamed:@"tabBar_chat_sel"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        [vc.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor redColor]} forState:UIControlStateSelected];
        vc.tabBarItem.title = @"消息";
        _chatVC = vc;
    }
    return _chatVC;
}


-(VUserCenterVC *)userVC
{
    if (!_userVC)
    {
        VUserCenterVC *vc = [[VUserCenterVC alloc] init];
        vc.title = @"我的";
        vc.tabBarItem.image = [[UIImage imageNamed:@"tabBar_user"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        vc.tabBarItem.selectedImage = [[UIImage imageNamed:@"tabBar_user_sel"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        [vc.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor redColor]} forState:UIControlStateSelected];
        vc.tabBarItem.title = @"我的";
        _userVC = vc;
    }
    return _userVC;
}


#pragma mark - BGTabBarDelegate
/**
 *  点击了加号按钮
 */
- (void)centerBtnAction
{
    UIAlertController *promptAlert = [UIAlertController alertControllerWithTitle:@"提示" message:@"点击了加号按钮" preferredStyle:UIAlertControllerStyleAlert];
    [promptAlert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil]];
    [self presentViewController:promptAlert animated:YES completion:nil];
}




@end
