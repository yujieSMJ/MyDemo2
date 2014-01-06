//
//  AsynchronousRequest.m
//  MyDemo2
//
//  Created by Mac3 on 13-12-26.
//  Copyright (c) 2013年 yujie. All rights reserved.
//

#import "AsynchronousRequest.h"

@implementation AsynchronousRequest

+(NSURLRequest *)AsynchronousGet:(NSString *)requestUrl{
    NSURL *url = [NSURL URLWithString:requestUrl];
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc]initWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:10];
    
    return request;
}

+(NSURLRequest *)AsynchronousGet:(NSString *)requestUrl cachePolicy:(NSURLRequestCachePolicy)cachePolicy timeoutInterval:(NSTimeInterval)timeoutInterval{
    NSURL *url = [NSURL URLWithString:requestUrl];
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc]initWithURL:url cachePolicy:cachePolicy timeoutInterval:timeoutInterval];
    
    return request;
}

+(NSMutableURLRequest *)AsynchronousPost:(NSString *)requestUrl postJSON:(NSString *)postString{
    NSURL *url = [NSURL URLWithString:requestUrl];
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc]initWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:10];
    
    [request setHTTPMethod:@"POST"];
    
    NSData *data = [postString dataUsingEncoding:NSUTF8StringEncoding];
    
    [request setHTTPBody:data];
    
    return request;
}

+(NSMutableURLRequest *)AsynchronousPost:(NSString *)requestUrl postJSON:(NSString *)postString cachePolicy:(NSURLRequestCachePolicy)cachePolicy timeoutInterval:(NSTimeInterval)timeoutInterval{
    NSURL *url = [NSURL URLWithString:requestUrl];
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc]initWithURL:url cachePolicy:cachePolicy timeoutInterval:timeoutInterval];
    
    [request setHTTPMethod:@"POST"];
    
    NSData *data = [postString dataUsingEncoding:NSUTF8StringEncoding];
    
    [request setHTTPBody:data];
    
    return request;
}

@end
