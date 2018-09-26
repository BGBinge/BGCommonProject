//
//  NSStringVerificationVC.m
//  BGCommonProject
//
//  Created by 冉彬 on 2018/9/19.
//  Copyright © 2018年 冉彬. All rights reserved.
//

#import "NSStringVerificationVC.h"
#import "NSString+Verification.h"

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
    [self performSelector:@selector(setLabelColor:) withObject:textField afterDelay:0.3];
    return YES;
}



- (IBAction)popBtnAction:(UIButton *)sender
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}
@end
