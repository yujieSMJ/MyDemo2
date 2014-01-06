//
//  ThirdViewController.h
//  MyDemo2
//
//  Created by tech-Yu-Mac on 13-11-14.
//  Copyright (c) 2013年 yujie. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ThirdViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UIButton *_push2;
@property(strong,nonatomic) NSMutableArray *listDate;
@property (weak, nonatomic) IBOutlet UITableView *tableview;

@end
