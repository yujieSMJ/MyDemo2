//
//  SynchronousRequst.m
//  MyDemo2
//
//  Created by Mac3 on 13-12-26.
//  Copyright (c) 2013年 yujie. All rights reserved.
//

#import "SynchronousRequst.h"

@implementation SynchronousRequst

+(NSString *)synchronousGet:(NSString *)requestUrl{
    NSURL *url = [NSURL URLWithString:requestUrl];
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc]initWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:10];
    
    NSData *received = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    NSString *strl = [[NSString alloc]initWithData:received encoding:NSUTF8StringEncoding];
    return strl;
}

+(NSString *)synchronousGet:(NSString *)requestUrl cachePolicy:(NSURLRequestCachePolicy)cachePolicy timeoutInterval:(NSTimeInterval)timeoutInterval{
    NSURL *url = [NSURL URLWithString:requestUrl];
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc]initWithURL:url cachePolicy:cachePolicy timeoutInterval:timeoutInterval];
    
    NSData *received = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    NSString *strl = [[NSString alloc]initWithData:received encoding:NSUTF8StringEncoding];
    return strl;
}

//
+(NSString *)synchronousPost:(NSString *)requestUrl postJSON:(NSString *)postString{
    NSURL *url = [NSURL URLWithString:requestUrl];
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc]initWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:10];
    
    [request setHTTPMethod:@"POST"];
    //默认是get方式
    //[request setHTTPMethod:@"GET"];
    
    NSData *data = [postString dataUsingEncoding:NSUTF8StringEncoding];
    
    [request setHTTPBody:data];
    
    NSData *received = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    NSString *strl = [[NSString alloc]initWithData:received encoding:NSUTF8StringEncoding];

    return strl;
}

+(NSString *)synchronousPost:(NSString *)requestUrl postJSON:(NSString *)postString cachePolicy:(NSURLRequestCachePolicy)cachePolicy timeoutInterval:(NSTimeInterval)timeoutInterval{
    NSURL *url = [NSURL URLWithString:requestUrl];
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc]initWithURL:url cachePolicy:cachePolicy timeoutInterval:timeoutInterval];
    
    [request setHTTPMethod:@"POST"];
    //默认是get方式
    //[request setHTTPMethod:@"GET"];
    
    NSData *data = [postString dataUsingEncoding:NSUTF8StringEncoding];
    
    [request setHTTPBody:data];
    
    NSData *received = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    NSString *strl = [[NSString alloc]initWithData:received encoding:NSUTF8StringEncoding];
    
    return strl;
}

@end
