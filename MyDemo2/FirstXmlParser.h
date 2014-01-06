//
//  FirstXmlParser.h
//  MyDemo2
//
//  Created by tech-Yu-Mac on 13-11-15.
//  Copyright (c) 2013年 yujie. All rights reserved.
//
//使用ios系统自带的nsxml方式解析xml文件
#import <Foundation/Foundation.h>

@interface FirstXmlParser : NSObject<NSXMLParserDelegate>

//解析出的数据，内部是字典类型
@property(strong,nonatomic) NSMutableArray *firstDates;
//当前标签的名字
@property(strong,nonatomic) NSString *currentTagName;

//开始解析
-(void)start;

@end
