//
//  VHomeVC.m
//  BGCommonProject
//
//  Created by 冉彬 on 2018/9/18.
//  Copyright © 2018年 冉彬. All rights reserved.
//

#import "VHomeVC.h"
#import "NSStringVerificationVC.h"
#import "BGGCDTimerVC.h"
#import "ViewFrameVC.h"
#import "BGNetWorkingVC.h"

@interface VHomeVC ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *dataAry;
@property (nonatomic, strong) NSArray *vcAry;

@end

@implementation VHomeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tableView];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Get
- (UITableView *)tableView
{
    if (!_tableView)
    {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_W, SCREEN_H) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}

-(NSArray *)dataAry
{
    if (!_dataAry)
    {
        _dataAry = @[
                     @"字符串验证",
                     @"计时器",
                     @"UIView+Frame",
                     @"网络请求"
                     ];
    }
    return _dataAry;
}

-(NSArray *)vcAry
{
    if (!_vcAry)
    {
        _vcAry = @[
                     [[NSStringVerificationVC alloc] init],
                     [[BGGCDTimerVC alloc] init],
                     [[ViewFrameVC alloc] init],
                     [[BGNetWorkingVC alloc] init]
                     ];
    }
    return _vcAry;
}



#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataAry.count;
}

 - (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    if (!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UITableViewCell"];
    }
    cell.textLabel.text = self.dataAry[indexPath.row];
//    cell.imageView.image = [UIImage imageNamed:@"tabBar_centerBtn_image"];
    return cell;
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row) {
        case 0:
        {
            NSStringVerificationVC *vc = [[NSStringVerificationVC alloc] init];
            vc.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 1:
        {
            BGGCDTimerVC *vc = [[BGGCDTimerVC alloc] init];
            vc.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 2:
        {
            ViewFrameVC *vc = [[ViewFrameVC alloc] init];
            vc.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 3:
        {
            BGNetWorkingVC *vc = [[BGNetWorkingVC alloc] init];
            vc.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 4:
        {
            BGNetWorkingVC *vc = [[BGNetWorkingVC alloc] init];
            vc.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 5:
        {
            BGNetWorkingVC *vc = [[BGNetWorkingVC alloc] init];
            vc.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 6:
        {
            BGNetWorkingVC *vc = [[BGNetWorkingVC alloc] init];
            vc.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        default:
            break;
    }
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}







#pragma mark - Navigation
 // In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
}





@end
