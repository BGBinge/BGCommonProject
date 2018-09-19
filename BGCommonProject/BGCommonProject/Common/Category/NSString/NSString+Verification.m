//
//  NSString+Verification.m
//  BGComonProject
//
//  Created by 冉彬 on 2018/9/17.
//  Copyright © 2018年 冉彬. All rights reserved.
//

#import "NSString+Verification.h"

@implementation NSString (Verification)



/**
 验证手机号码
 
 @return YES/NO
 */
- (BOOL)isMobileNumber
{
    NSString* const MOBILE = @"^1(3|4|5|7|8)\\d{9}$";
    
    NSPredicate* predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    return [predicate evaluateWithObject:self];
}


/**
 有效的验证码(根据自家的验证码位数进行修改)
 
 @return YES/NO
 */
- (BOOL)isVerifyCode
{
    NSString *pattern = @"^[0-9]{6}";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pattern];
    return [predicate evaluateWithObject:self];
}


/**
 有效的真实姓名
 
 @return YES/NO
 */
- (BOOL)isRealName
{
    NSString *nicknameRegex = @"^[\u4e00-\u9fa5]{2,8}$";
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",nicknameRegex];
    
    return [predicate evaluateWithObject:self];
}


/**
 有效的银行卡号
 
 @return YES/NO
 */
- (BOOL)isBankCardNumber
{
    NSString* const BANKCARD = @"^(\\d{16}|\\d{19})$";
    
    NSPredicate* predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", BANKCARD];
    return [predicate evaluateWithObject:self];
}


/**
 有效的邮箱
 
 @return YES/NO
 */
- (BOOL)isEmail
{
    
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    
    return [emailTest evaluateWithObject:self];
    
}



/**
 有效昵称

 @return YES/NO
 */
- (BOOL)validateNickName
{
    // 字母，数字，汉字 1到16位
    NSString *userNameRegex = @"^[A-Za-z0-9\u4e00-\u9fa5]{1,16}+$";
    
    NSPredicate *userNamePredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",userNameRegex];
    
    return [userNamePredicate evaluateWithObject:self];
}


/**
 有效的字母数字密码
 
 @return YES/NO
 */
- (BOOL)isAlphaNumberPassword
{
    NSString *regex = @"^(?!\\d+$|[a-zA-Z]+$)\\w{6,12}$";
    NSPredicate *identityCardPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [identityCardPredicate evaluateWithObject:self];
}


/**
 检测有效身份证15位
 
 @return YES/NO
 */
- (BOOL)isIdentifyFifteen
{
    NSString * identifyTest=@"^[1-9]\\d{7}((0\\d)|(1[0-2]))(([0|1|2]\\d)|3[0-1])\\d{3}$";
    NSPredicate*identifyPredicate=[NSPredicate predicateWithFormat:@"SELF MATCHES %@",identifyTest];
    return [identifyPredicate evaluateWithObject:self];
}


/**
 检测有效身份证18位
 
 @return YES/NO
 */
- (BOOL)isIdentifyEighteen
{
    NSString * identifyTest=@"^[1-9]\\d{5}[1-9]\\d{3}((0\\d)|(1[0-2]))(([0|1|2]\\d)|3[0-1])\\d{3}([0-9]|X)$";
    NSPredicate*identifyPredicate=[NSPredicate predicateWithFormat:@"SELF MATCHES %@",identifyTest];
    return [identifyPredicate evaluateWithObject:self];
}


/**
 是否为纯数字
 
 @return YES/NO
 */
- (BOOL)isOnlyNumber
{
    BOOL res = YES;
    NSCharacterSet* tmpSet = [NSCharacterSet characterSetWithCharactersInString:@"0123456789"];
    int i = 0;
    while (i < self.length) {
        NSString * string = [self substringWithRange:NSMakeRange(i, 1)];
        NSRange range = [string rangeOfCharacterFromSet:tmpSet];
        if (range.length == 0) {
            res = NO;
            break;
        }
        i++;
    }
    
    return res;
}


/**
 是否只有中文
 
 @return YES/NO
 */
- (BOOL)isOnlyChinese
{
    NSString * chineseTest=@"^[\u4e00-\u9fa5]{0,}$";
    NSPredicate*chinesePredicate=[NSPredicate predicateWithFormat:@"SELF MATCHES %@",chineseTest];
    return [chinesePredicate evaluateWithObject:self];
}

@end
