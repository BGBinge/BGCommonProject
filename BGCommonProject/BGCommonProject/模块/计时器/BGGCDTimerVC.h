//
//  BGGCDTimerVC.h
//  BGCommonProject
//
//  Created by 冉彬 on 2018/9/26.
//  Copyright © 2018年 Binge. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BGGCDTimerVC : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *numLabel;
@property (weak, nonatomic) IBOutlet UIButton *startBtn;
@property (weak, nonatomic) IBOutlet UIButton *endBtn;

@property (nonatomic, assign) int timeNum;

- (IBAction)startBtnAction:(UIButton *)sender;
- (IBAction)endBtnAction:(UIButton *)sender;
@end
