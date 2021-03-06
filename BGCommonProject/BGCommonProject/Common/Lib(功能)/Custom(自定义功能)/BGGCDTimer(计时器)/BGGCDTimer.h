//
//  BGGCDTimer.h
//  BGCommonProject
//
//  Created by 冉彬 on 2018/9/26.
//  Copyright © 2018年 Binge. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BGGCDTimer : NSObject


/**
 开始任务
 
 @param task 任务
 @param start 开始时间（多少秒后）
 @param interval 执行间隔
 @param repeats 是否重复
 @param async 是否异步
 @return 唯一标示
 */
+ (NSString *)doTask:(void(^)(void))task start:(NSTimeInterval)start interval:(NSTimeInterval)interval repeats:(BOOL)repeats async:(BOOL)async;



/**
 延迟开始任务

 @param task 任务
 @param start 开始时间（多少秒后）
 @return 唯一标示
 */
+ (NSString *)doTask:(void(^)(void))task start:(NSTimeInterval)start;


/**
 根据timer的唯一标示，取消对应的timer。

 @param timerIdentifier 唯一标示
 */
+ (void)cancelTask:(NSString *)timerIdentifier;


@end
