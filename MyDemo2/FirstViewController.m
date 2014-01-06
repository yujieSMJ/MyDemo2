//
//  FirstViewController.m
//  MyDemo2
//
//  Created by tech-Yu-Mac on 13-11-14.
//  Copyright (c) 2013年 yujie. All rights reserved.
//

#import "FirstViewController.h"
#import "SynchronousRequst.h"
#import "AsynchronousRequest.h"


@interface FirstViewController ()

@end

@implementation FirstViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
//    NSDictionary *data = [NSDictionary dictionaryWithObjectsAndKeys:uuid,@"_id",username,@"name",password,@"admin", nil];
//    if([NSJSONSerialization isValidJSONObject:data]){
//        NSData *data1 = [NSJSONSerialization dataWithJSONObject:data options:NSJSONWritingPrettyPrinted error:nil];
//        NSLog(@"%@",[NSString alloc]initWithData:data1 encoding:NSUTF8StringEncoding);
//    }
    NSMutableDictionary *dic = [[NSMutableDictionary alloc]init];
    [dic setObject:@"select" forKey:@"command"];
    [dic setObject:@"0" forKey:@"result"];
    [dic setObject:@"30" forKey:@"BrandID"];
    [dic setObject:@"brandID" forKey:@"field0"];
    [dic setObject:@"brandName" forKey:@"field1"];
    [dic setObject:@"shopID" forKey:@"good"];
    
    NSMutableDictionary *dic1 = [[NSMutableDictionary alloc]init];
    [dic1 setObject:@"1112" forKey:@"good"];
    [dic1 setObject:@"2221" forKey:@"job"];
    
    NSArray *arrayS = [NSArray arrayWithObjects:@"hahaha",@"heheheh", nil];
    
    NSMutableDictionary *dic2 = [[NSMutableDictionary alloc]init];
    [dic2 setObject:arrayS forKey:@"good"];
    [dic2 setObject:dic1 forKey:@"job"];
    
    NSMutableArray *arry = [NSMutableArray arrayWithObjects:dic,dic2,nil];
    
    
    
    NSData *data = [NSJSONSerialization dataWithJSONObject:arry options:NSJSONWritingPrettyPrinted error:nil];
    NSString *json = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
    //NSString *strl = [SynchronousRequst synchronousPost:@"http://10.255.102.81:65433/test.aspx" postJSON:json];
    NSLog(@"%@",json);
    
    
    
    
    //这是同步post请求
//    NSURL *url = [NSURL URLWithString:@"http://10.255.102.81:65433/test.aspx"];
//    //NSURL *url = [NSURL URLWithString:@"http://10.255.102.81:65433/test.aspx?type=30"];
//    
//    NSMutableURLRequest *request = [[NSMutableURLRequest alloc]initWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:10];
//    
//    [request setHTTPMethod:@"POST"];
//    //默认是get方式
//    //[request setHTTPMethod:@"GET"];
//    
//    NSString *str = @"[{'BrandID':301,'Bname':'优木123','ShopID':220}]";
//    
//    NSData *data = [str dataUsingEncoding:NSUTF8StringEncoding];
//    
//    [request setHTTPBody:data];
//    
//    NSData *received = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
//    NSString *strl = [[NSString alloc]initWithData:received encoding:NSUTF8StringEncoding];
//    NSLog(@"%@",strl);
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
//    NSString *str2 = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
//    NSLog(@"%@",str2);
//    //NSLog(@"1111");
//}
//
//-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response{
//    NSHTTPURLResponse *res = (NSHTTPURLResponse *)response;
//    NSLog(@"%@",[res allHeaderFields]);
//    //NSLog(@"22222");
//}
//
//-(void)connectionDidFinishLoading:(NSURLConnection *)connection{
//    //NSLog(@"333333");
//}
//
//-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error{
//    //NSLog(@"%@",[error localizedDescription]);
//}

@end
