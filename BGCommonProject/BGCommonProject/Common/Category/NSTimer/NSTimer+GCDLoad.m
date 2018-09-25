//
//  NSTimer+GCDLoad.m
//  BGCommonProject
//
//  Created by 冉彬 on 2018/9/20.
//  Copyright © 2018年 Binge. All rights reserved.
//

#import "NSTimer+GCDLoad.h"

static NSMutableDictionary *timersDic;
static dispatch_semaphore_t semaphore;


@implementation NSTimer (GCDLoad)


+ (void)initialize {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        timersDic = [NSMutableDictionary dictionary];
        semaphore = dispatch_semaphore_create(1);
    });
}

+ (NSString *)doTask:(void (^)(void))task start:(NSTimeInterval)start interval:(NSTimeInterval)interval repeats:(BOOL)repeats async:(BOOL)async {
    // 没有任务、开始时间小于0、重复执行且间隔小于0， 视为无效操作
    if (!task || start < 0 || (interval <= 0 && repeats))  return nil;
    
    // 队列
    dispatch_queue_t queue = async ? dispatch_get_global_queue(0, 0) : dispatch_get_main_queue();
    
    // 创建timer
    dispatch_source_t timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    
    // 为timer设置时间（开始时间、执行间隔）参数
    dispatch_source_set_timer(timer, start * NSEC_PER_SEC, interval * NSEC_PER_SEC, 0);
    
    // 保证timersDic数据安全
    dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
    
    // timer identifier
    NSString *timerIdentifier = [NSString stringWithFormat:@"%zd-%@", timersDic.count, [self getNowTimeTimestamp]];
    [timersDic setObject:timer forKey:timerIdentifier];
//    NSLog(@"键值对：%@",timersDic);
    dispatch_semaphore_signal(semaphore);
    
    // 为timer设置task
    dispatch_source_set_event_handler(timer, ^{
        task();
        if (!repeats) {
            // 取消timer
            [self cancelTask:timerIdentifier];
        }
    });
    
    // 开始执行timer
    dispatch_resume(timer);
    
    return timerIdentifier;
}


+ (void)cancelTask:(NSString *)timerIdentifier {
    // 无效检测
    if (!timerIdentifier.length) return;
    
    // 保证timersDic数据安全
    dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
    
    dispatch_source_t timer = [timersDic objectForKey:timerIdentifier];
    if (timer) {
        dispatch_cancel(timer);
        [timersDic removeObjectForKey:timerIdentifier];
    }
    
    dispatch_semaphore_signal(semaphore);
}



/**
 获取当前时间戳

 @return 时间戳字符串
 */
+(NSString *)getNowTimeTimestamp
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
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


@end
