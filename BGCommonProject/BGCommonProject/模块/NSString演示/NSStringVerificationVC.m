//
//  NSStringVerificationVC.m
//  BGCommonProject
//
//  Created by 冉彬 on 2018/9/19.
//  Copyright © 2018年 冉彬. All rights reserved.
//

#import "NSStringVerificationVC.h"
#import "NSString+Verification.h"
#import "NSTimer+GCDLoad.h"

@interface NSStringVerificationVC ()<UITextFieldDelegate>

@end

@implementation NSStringVerificationVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setLabelColor:(id)object
{
    UITextField *tf = (UITextField *)object;
    if (tf)
    {
        NSString *str = tf.text;
        if (str.length > 0)
        {
            if ([str isEmail])
            {
                self.eLabel.textColor = [UIColor redColor];
            }
            else
            {
                self.eLabel.textColor = [UIColor blackColor];
            }
            
            if ([str isRealName])
            {
                self.nameLabel.textColor = [UIColor redColor];
            }
            else
            {
                self.nameLabel.textColor = [UIColor blackColor];
            }
            
            if ([str isOnlyNumber])
            {
                self.numLabel.textColor = [UIColor redColor];
            }
            else
            {
                self.numLabel.textColor = [UIColor blackColor];
            }
            
            if ([str isOnlyChinese])
            {
                self.hanLabel.textColor = [UIColor redColor];
            }
            else
            {
                self.hanLabel.textColor = [UIColor blackColor];
            }
            
            if ([str isVerifyCode])
            {
                self.yanLable.textColor = [UIColor redColor];
            }
            else
            {
                self.yanLable.textColor = [UIColor blackColor];
            }
            
            if ([str isBankCardNumber])
            {
                self.bankLabel.textColor = [UIColor redColor];
            }
            else
            {
                self.bankLabel.textColor = [UIColor blackColor];
            }
        }
        else
        {
            self.yanLable.textColor = [UIColor blackColor];
            self.nameLabel.textColor = [UIColor blackColor];
            self.nickLabel.textColor = [UIColor blackColor];
            self.numLabel.textColor = [UIColor blackColor];
            self.hanLabel.textColor = [UIColor blackColor];
            self.eLabel.textColor = [UIColor blackColor];
        }
        
        
    }
}


#pragma mark - UITextFieldDelegate
-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    
    [NSTimer doTask:^{
//        NSLog(@"时间戳5：%@", [self getNowTimeTimestamp]);
    } start:0.0000003 interval:1.0000001 repeats:YES async:YES];

    [self performSelector:@selector(setLabelColor:) withObject:textField afterDelay:0.3];
    return YES;
}




-(NSString *)getNowTimeTimestamp{
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init] ;
    
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    
    [formatter setDateFormat:@"YYYY-MM-dd HH:mm:ss SSSSSSS"]; // ----------设置你想要的格式,hh与HH的区别:分别表示12小时制,24小时制
    
    //设置时区,这个对于时间的处理有时很重要
    
    NSTimeZone* timeZone = [NSTimeZone timeZoneWithName:@"Asia/Shanghai"];
    
    [formatter setTimeZone:timeZone];
    
    NSDate *datenow = [NSDate date];//现在时间,你可以输出来看下是什么格式
    
    NSString *timeSp = [NSString stringWithFormat:@"%ld", (long)([datenow timeIntervalSince1970]*1000000.0)];
    
    return timeSp;
}

-(NSString *)getNowTimeTimestamp2{
    
    
    
    NSDate* dat = [NSDate dateWithTimeIntervalSinceNow:0];
    
    NSTimeInterval a=[dat timeIntervalSince1970];
    
    NSString*timeString = [NSString stringWithFormat:@"%0.f", a];//转为字符型
    
    ;
    
    return timeString;
    
}




@end
