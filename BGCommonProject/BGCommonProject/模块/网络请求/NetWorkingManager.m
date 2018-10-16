//
//  NetWorkingManager.m
//  BGCommonProject
//
//  Created by 冉彬 on 2018/10/9.
//  Copyright © 2018年 Binge. All rights reserved.
//

#import "NetWorkingManager.h"


@implementation NetWorkingError
@end
@implementation NetWorkingResult
@end


@implementation NetWorkingManager

/**
 获取天气信息
 
 @param city 城市
 @param block 回调
 */
+(void)getWeatherWithCity:(NSString *)city block:(BGNetWorkingBlock)block
{
    NSDictionary *parametersDict = @{
                                     @"city": city
                                     };
    [self postRequestWithAction:@"weatherApi" param:parametersDict block:block];
}



/**
 post请求
 
 @param action 操作
 @param param 参数
 @param block 回调block
 */
+(void)postRequestWithAction:(NSString *)action param:(NSDictionary *)param block:(BGNetWorkingBlock)block
{
    NSString *us = @"https://www.apiopen.top";
    NSString *urlStr = [NSString stringWithFormat:@"%@/%@", us, action];
    [BGNetWorking BG_postRequestWithURL:[NSURL URLWithString:urlStr] param:param completeBlock:^(NSData *obj,  NSError *error) {
        if (error)
        {
            NetWorkingError *err;
            err.codeNum = NetWorkingErrorCode_fail;
            err.describe = @"网络错误！";
            block(nil, err);
        }
        else
        {
            NetWorkingResult *result = [self checkResultData:obj];
            block(result.obj, result.errorModel);
        }
    }];
    
}



/**
 校验请求结果

 @param data 请求返回的数据
 @return 结果
 */
+(NetWorkingResult *)checkResultData:(NSData *)data
{
    NetWorkingResult *result = [[NetWorkingResult alloc] init];
    NSDictionary *dic;
    NSError *error;
    @try {
        
        dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
    } @catch (NSException *exception) {
        result.errorModel = [self getNoStandardError];
        result.obj = nil;
        return result;
    } @finally {
        if (error || !dic) {
            result.errorModel = [self getNoStandardError];
            result.obj = nil;
            return result;
        }
    }
    
    int codeNum;
    @try {
        codeNum = [dic[@"code"] intValue];
    } @catch (NSException *exception) {
        result.errorModel = [self getNoStandardError];
        result.obj = nil;
        return result;
    } @finally {
        if (codeNum == 200)
        {
            result.errorModel = nil;
            result.obj = dic[@"data"];
            return result;
        }
        else
        {
            NSString *msg = dic[@"msg"];
            NetWorkingError *er = [NetWorkingError new];
            er.codeNum = NetWorkingErrorCode_noStandard;
            er.describe = msg;
            result.errorModel = er;
            result.obj = nil;
            return result;
        }
    }
    
    
}


+(NetWorkingError *)getNoStandardError
{
    NetWorkingError *er = [NetWorkingError new];
    er.codeNum = NetWorkingErrorCode_noStandard;
    er.describe = @"网络错误!";
    return er;
}



@end
