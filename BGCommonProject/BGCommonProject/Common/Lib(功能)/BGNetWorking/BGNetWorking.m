//
//  BGNetWorking.m
//  BGNSURLSessionProject
//
//  Created by 冉彬 on 2018/9/25.
//  Copyright © 2018年 Binge. All rights reserved.
//

#import "BGNetWorking.h"

@interface BGNetWorking ()



@end

@implementation BGNetWorking


/**
 Get请求

 @param URL URL
 @param param 参数字典
 @param completeBlock 完成后的回调block
 */
+(void)BG_getRequestWithURL:(NSURL *)URL param:(NSDictionary *)param completeBlock:(CompleteBlock)completeBlock
{
    [self BG_requestWithURL:URL type:BGRequestTypeGet param:param completeBlock:completeBlock];
}


/**
 Post请求
 
 @param URL URL
 @param param 参数字典
 @param completeBlock 完成后的回调block
 */
+(void)BG_postRequestWithURL:(NSURL *)URL param:(NSDictionary *)param completeBlock:(CompleteBlock)completeBlock
{
    [self BG_requestWithURL:URL type:BGRequestTypePost param:param completeBlock:completeBlock];
}


/**
 请求
 
 @param URL URL
 @param type 类型（Get Post）
 @param param 参数字典
 @param completeBlock 完成后的回调block
 */
+(void)BG_requestWithURL:(NSURL *)URL type:(BGRequestType)type param:(NSDictionary *)param completeBlock:(CompleteBlock)completeBlock
{
//    NSString *tStr = @"verify_auth_token ZXlKMGVYQWlPaUpLVjFRaUxDSmhiR2NpT2lKU1V6STFOaUlzSW1wMGFTSTZJamhqWVdFNE9ERmpOelJoTVdObU5qVXpaVFExTWpneFpUQmhPR00zTm1ZM0luMC5leUpwYzNNaU9pSmhjR2t1ZGpFdWFtMTJkR2x0WlM1amIyMGlMQ0poZFdRaU9pSmhjR2t1ZGpFdWFtMTJkR2x0WlM1amIyMGlMQ0pxZEdraU9pSTRZMkZoT0RneFl6YzBZVEZqWmpZMU0yVTBOVEk0TVdVd1lUaGpOelptTnlJc0ltbGhkQ0k2TVRVek56ZzNOVEl3TlN3aWJtSm1Jam94TlRNM09EYzFNakExTENKbGVIQWlPakUxTXpnME9EQXdNRFVzSW5WellXeDBhV1FpT2pNc0luVnpZV3gwZG5ScGJXVnVkVzBpT2pFd01EQXdNREVzSW5WellXeDBiVzlpYVd4bElqb2lJbjAuYnZublNsVnVJNjYzRFFfU2RDSUFESThsMEY1RURIUER6YktyVFV0VnpETDUwcGpCbU1nN2JsdU80NElxMERtTnFnMFkzY3VLajdMa2pSUWFodGtNdm5QekhRMTh0d19PNmp6bEtRQXVqazNLOFhRVFEtcE10V3J0YS1KTXhDU1UwbEh6SHlWeVlNODRJOUo0RWlWREd2cDNzUUZqci1QZnNpd0ZmV1UtWFpiYno3OGRQdkhyRWg3VUpuV29KYlNKN2V4REFVcS1tcTZoakYxcFF0eEIxNVFnQ01LcVA3VkRTLWVBRm9WODZFYnhXQ0labUtGaUNlc2tMZWl5VjBKNEl6OGRHT2ZsRXBfNHA4dC1oNmlPczdKb3o4cDVhSlNtdG1ycEY4VXJOdTZBTl9YVUFDcUttUE1VMHhNd3FOd0ZOM3NKLVpNTjlrVUV6X3dDQjVHLWpn";
    
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSDictionary *headDic = @{
//                              @"Authorization": tStr,
//                              @"Content-Type": @"application/json"
                              };
    [self startRequestWithURL:URL param:param type:type outTime:10.0 cachePolicy:NSURLSessionTaskPriorityDefault requwstHead:headDic configuration:configuration completeBlock:completeBlock];
}







/**
 基本请求
 
 @param URL URL
 @param param 参数字典
 @param type 类型（Get Post）
 @param outTime 超时时间
 @param cachePolicy 缓存策略
 @param requwstHead 请求头
 @param configuration 配置（请求头，超时时间也可以在这里设置）
 @param completeBlock 完成请求
 */
+(void)startRequestWithURL:(NSURL *)URL param:(NSDictionary *)param type:(BGRequestType)type outTime:(NSTimeInterval)outTime cachePolicy:(NSURLRequestCachePolicy)cachePolicy requwstHead:(NSDictionary *)requwstHead configuration:(NSURLSessionConfiguration *)configuration completeBlock:(CompleteBlock)completeBlock
{
    // 创建Request请求
    NSMutableURLRequest *request;
    
    // 设置请求方法以及参数
    if (type == BGRequestTypePost)
    {
        request = [NSMutableURLRequest requestWithURL:URL];
        [request setHTTPMethod:@"POST"];
        // 参数配置
        NSData *parameData = [[NSString BGNet_paramString:param] dataUsingEncoding:NSUTF8StringEncoding];
        [request setHTTPBody:parameData];
        
    }
    else
    {
        // 参数配置
        NSString *urlStr = [NSString stringWithFormat:@"%@?%@",[URL absoluteString],[NSString BGNet_paramString:param]];
        URL = [[NSURL alloc] initWithString:[urlStr BGNet_urlEncoding]];
        request = [NSMutableURLRequest requestWithURL:URL];
        [request setHTTPMethod:@"GET"];
        
    }
    
    // 设置请求超时 默认超时时间60s
    [request setTimeoutInterval:outTime];
    
    //    // 设置头部参数
    //    [request addValue:@"gzip" forHTTPHeaderField:@"Content-Encoding"];
    //    //或者下面这种方式 添加所有请求头信息
        request.allHTTPHeaderFields = requwstHead;
    
    //设置缓存策略
    [request setCachePolicy:cachePolicy];
    
    // 创建网络会话
    NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration];
    
    // 创建会话任务
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        completeBlock(data, nil);
    }];
    // 执行任务
    [task resume];
    
}


@end
