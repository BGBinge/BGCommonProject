//
//  BGNetWorkingVC.m
//  BGCommonProject
//
//  Created by 冉彬 on 2018/10/9.
//  Copyright © 2018年 Binge. All rights reserved.
//

#import "BGNetWorkingVC.h"

@interface BGNetWorkingVC ()

@end

@implementation BGNetWorkingVC

- (void)viewDidLoad {
    [super viewDidLoad];
    WeakSelf;
    [NetWorkingManager getWeatherWithCity:@"成都" block:^(id obj, NetWorkingError *error) {
        if (error)
        {
            NSLog(@"%ld - %@", (long)error.codeNum, error.describe);
        }
        else
        {
            dispatch_async(dispatch_get_main_queue(), ^{
                
                NSLog(@"%@", obj);
                NSDictionary *dataDic = (NSDictionary *)obj;
                NSArray *ary = (NSArray *)(dataDic[@"forecast"]);
                weakSelf.ganmaoLabel.text = dataDic[@"ganmao"];
                NSDictionary *mDic = ary[0];
                weakSelf.timeLabel.text = mDic[@"date"];
                weakSelf.lowLabel.text = mDic[@"low"];
                weakSelf.highLabel.text = mDic[@"high"];
                weakSelf.flLabel.text = mDic[@"fengli"];
                weakSelf.fxLabel.text = mDic[@"fengxiang"];
                weakSelf.typeLabel.text = mDic[@"type"];
                
            });
        }
    }];
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/



@end
