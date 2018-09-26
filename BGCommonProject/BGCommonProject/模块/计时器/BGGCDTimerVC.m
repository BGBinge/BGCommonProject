//
//  BGGCDTimerVC.m
//  BGCommonProject
//
//  Created by 冉彬 on 2018/9/26.
//  Copyright © 2018年 Binge. All rights reserved.
//

#import "BGGCDTimerVC.h"
#import "BGGCDTimer.h"
#import "NSStringVerificationVC.h"

@interface BGGCDTimerVC ()
{
    BOOL _isRun;
    NSString *_timerIdStr;
}

@end

@implementation BGGCDTimerVC

- (void)viewDidLoad {
    [super viewDidLoad];
    _isRun = NO;
    self.timeNum = 0;
    self.timeLabel.text = [NSString stringWithFormat:@"%02d",self.timeNum/100];
    self.numLabel.text = [NSString stringWithFormat:@"%02d",self.timeNum%100];
    [self.startBtn setTitle:@"开始" forState:0];
    self.startBtn.backgroundColor = [UIColor greenColor];
    self.endBtn.backgroundColor = [UIColor redColor];
    self.endBtn.hidden = YES;
    
    CORNER_VR(self.startBtn, 50);
    CORNER_VR(self.endBtn, 30);
    
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)startBtnAction:(UIButton *)sender
{
    self.endBtn.hidden = NO;
    if (_isRun)
    {
        [BGGCDTimer cancelTask:_timerIdStr];
        [self.startBtn setTitle:@"开始" forState:0];
        self.startBtn.backgroundColor = [UIColor greenColor];
        
        
    }
    else
    {
        _timerIdStr = [BGGCDTimer doTask:^{
            //通知主线程刷新
            dispatch_async(dispatch_get_main_queue(), ^{
                self.timeNum ++;
                self.timeLabel.text = [NSString stringWithFormat:@"%02d",self.timeNum/100];
                self.numLabel.text = [NSString stringWithFormat:@"%02d",self.timeNum%100];
            });
            
        } start:0.01 interval:0.01 repeats:YES async:YES];
        
        [self.startBtn setTitle:@"暂停" forState:0];
        self.startBtn.backgroundColor = [UIColor blueColor];
    }
    
    _isRun = !_isRun;
}

- (IBAction)endBtnAction:(UIButton *)sender
{
    self.endBtn.hidden = YES;
    _isRun = NO;
    [BGGCDTimer cancelTask:_timerIdStr];
    self.timeNum = 0;
    self.timeLabel.text = [NSString stringWithFormat:@"%02d",self.timeNum/100];
    self.numLabel.text = [NSString stringWithFormat:@"%02d",self.timeNum%100];
    [self.startBtn setTitle:@"开始" forState:0];
    self.startBtn.backgroundColor = [UIColor greenColor];
    NSStringVerificationVC *vc = [[NSStringVerificationVC alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
    
}
@end
