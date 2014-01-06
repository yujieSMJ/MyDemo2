//
//  SynchronousRequst.h
//  MyDemo2
//
//  Created by Mac3 on 13-12-26.
//  Copyright (c) 2013年 yujie. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SynchronousRequst : NSObject

/*!
 @method         synchronousGet:
 @discussion        同步get请求
 @param  requestUrl   请求的路径.
 @result    同步get请求，返回服务端反馈的数据
 */
+(NSString *)synchronousGet:(NSString *)requestUrl;

/*!
 @method         synchronousPost:postJSON：
 @discussion        同步post请求
 @param  requestUrl   请求的路径.
 @param  postString   表单信息.
 @result    同步post请求，返回服务端反馈的数据
 */
+(NSString *)synchronousPost:(NSString *)requestUrl postJSON:(NSString *)postString;

/*!
 @method         synchronousGet:cachePolicy：timeoutInterval:
 @discussion        同步post请求
 @param  requestUrl   请求的路径.
 @param  cachePolicy   缓存协议.
 @param  timeoutInterval    网络请求超时时间（秒）.
 @result    同步get请求，返回服务端反馈的数据
 */
+(NSString *)synchronousGet:(NSString *)requestUrl cachePolicy:(NSURLRequestCachePolicy)cachePolicy timeoutInterval:(NSTimeInterval)timeoutInterval;

/*!
 @method         synchronousPost:postJSON：cachePolicy：timeoutInterval:
 @discussion        同步post请求
 @param  requestUrl   请求的路径.
 @param  postString   表单信息.
 @param  cachePolicy   缓存协议.
 @param  timeoutInterval    网络请求超时时间（秒）.
 @result    同步Post请求，返回服务端反馈的数据
 */
+(NSString *)synchronousPost:(NSString *)requestUrl postJSON:(NSString *)postString cachePolicy:(NSURLRequestCachePolicy)cachePolicy timeoutInterval:(NSTimeInterval)timeoutInterval;

@end
