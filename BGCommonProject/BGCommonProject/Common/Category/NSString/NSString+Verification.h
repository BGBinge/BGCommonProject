//
//  NSString+Verification.h
//  BGComonProject
//
//  Created by 冉彬 on 2018/9/17.
//  Copyright © 2018年 冉彬. All rights reserved.
//

#import <Foundation/Foundation.h>


// 字符串的各种验证
@interface NSString (Verification)



/**
 验证手机号码

 @return YES/NO
 */
- (BOOL)isMobileNumber;


/**
 有效的真实姓名
 
 @return YES/NO
 */
- (BOOL)isRealName;


/**
 有效的验证码(根据自家的验证码位数进行修改)

 @return YES/NO
 */
- (BOOL)isVerifyCode;


/**
 有效的银行卡号

 @return YES/NO
 */
- (BOOL)isBankCardNumber;


/**
 有效的邮箱

 @return YES/NO
 */
- (BOOL)isEmail;


/**
 有效昵称
 
 @return YES/NO
 */
- (BOOL)validateNickName;


/**
 有效的字母数字密码

 @return YES/NO
 */
- (BOOL)isAlphaNumberPassword;




/**
 检测有效身份证15位
 
 @return YES/NO
 */
- (BOOL)isIdentifyFifteen;


/**
 检测有效身份证18位
 
 @return YES/NO
 */
- (BOOL)isIdentifyEighteen;


/**
 是否为纯数字

 @return YES/NO
 */
- (BOOL)isOnlyNumber;


/**
 是否只有中文
 
 @return YES/NO
 */
- (BOOL)isOnlyChinese;



@end
