//
//  NetWorkingManager.h
//  BGCommonProject
//
//  Created by 冉彬 on 2018/10/9.
//  Copyright © 2018年 Binge. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BGNetWorking.h"

@class NetWorkingError;

typedef NS_ENUM(NSInteger, NetWorkingErrorCode){
    
    NetWorkingErrorCode_fail         =  9,  // 请求失败
    NetWorkingErrorCode_noStandard   = 10,  // 返回不是标准结果（比如返回一个html报错界面，或字符串。。。）
    NetWorkingErrorCode_errorStates  = 11,  // 服务器返回错误状态
};
typedef void (^BGNetWorkingBlock)(id obj, NetWorkingError *error);


// 错误类
@interface NetWorkingError : NSObject

@property (nonatomic, strong) NSString *describe; // 错误描述，用于提示用户
@property (nonatomic, assign) NetWorkingErrorCode codeNum; // 错误码

@end

// 结果类
@interface NetWorkingResult : NSObject

@property (nonatomic, strong) NetWorkingError *errorModel; // 错误
@property (nonatomic, strong) id obj; // 结果对象

@end



@interface NetWorkingManager : NSObject


/**
 获取天气信息

 @param city 城市
 @param block 回调
 */
+(void)getWeatherWithCity:(NSString *)city block:(BGNetWorkingBlock)block;



/**
 post请求

 @param action 操作
 @param param 参数
 @param block 回调block
 */
+(void)postRequestWithAction:(NSString *)action param:(NSDictionary *)param block:(BGNetWorkingBlock)block;


@end
