//
//  FirstXmlParser.m
//  MyDemo2
//
//  Created by tech-Yu-Mac on 13-11-15.
//  Copyright (c) 2013年 yujie. All rights reserved.
//

#import "FirstXmlParser.h"

@implementation FirstXmlParser

-(void)start{
    //获取xml文件路径
    NSString *path = [[NSBundle mainBundle]pathForResource:@"FirstUser" ofType:@"xml"];
    NSLog(@"the file's path is %@",path);
    NSURL *url = [NSURL fileURLWithPath:path];
    //开始解析文件
    //NSXMLParser是解析类，他有3个构造方法
    NSXMLParser *parser = [[NSXMLParser alloc]initWithContentsOfURL:url];//使用url对象创建解析对象
    //实现过程是先从资源文件中加载对象，获得url对象后再构造解析对象
    //也可以使用initwithdate方法创建
    //用initwithstream 使用io流来创建
    parser.delegate = self;
    [parser parse];
    
}
//文档解析开始的时候触发
- (void)parserDidStartDocument:(NSXMLParser *)parser{
    self.firstDates = [NSMutableArray new];
}
// sent when the parser begins parsing of the document.
//遇到开始标签时触发
-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict{
    //elementName就是解析元素名字，如果取出来的元素名称时div
    self.currentTagName = elementName;
    if([self.currentTagName isEqualToString:@"div"])
    {
        //取出元素的属性id
        NSString *_id = [attributeDict objectForKey:@"id"];
        NSMutableDictionary *dict = [NSMutableDictionary new];
        //将ID放入可变字典中
        [dict setObject:_id forKey:@"id"];
        [self.firstDates addObject:dict];
    }
}
//遇到字符串时触发的实例
-(void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
    //替换回车符和空格
    string = [string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    if([string isEqualToString:@""])
    {
        return;
    }
    NSMutableDictionary *dicts = [self.firstDates lastObject];
    
    if([self.currentTagName isEqualToString:@"h1"] && dicts)
    {
        [dicts setObject:string forKey:@"h1"];
    }
    if([self.currentTagName isEqualToString:@"ul"] && dicts)
    {
        [dicts setObject:string forKey:@"ul"];
    }
    if([self.currentTagName isEqualToString:@"a"] && dicts)
    {
        [dicts setObject:string forKey:@"a"];
    }
    if([self.currentTagName isEqualToString:@"span"] && dicts)
    {
        [dicts setObject:string forKey:@"span"];
    }
}

//遇到结束标签时触发
-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    self.currentTagName = Nil;
}
//文档结束的时候触发
//通过广播的方式将数据传递给对象
- (void)parserDidEndDocument:(NSXMLParser *)parser{
    [[NSNotificationCenter defaultCenter]postNotificationName:@"reloadViewController" object:self.firstDates userInfo:nil];
    self.firstDates = nil;
}



@end





