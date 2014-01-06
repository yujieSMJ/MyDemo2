//
//  ThirdViewController.m
//  MyDemo2
//
//  Created by tech-Yu-Mac on 13-11-14.
//  Copyright (c) 2013年 yujie. All rights reserved.
//

#import "ThirdViewController.h"
#import "JumpViewController.h"
#import "FirstXmlParser.h"
#import "CustomCell.h"
#import "FirstXmlParser.h"

@interface ThirdViewController ()

@end

@implementation ThirdViewController

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
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(reloadview:) name:@"reloadViewController" object:nil];
    
    FirstXmlParser *parser = [FirstXmlParser new];
    [parser start];
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)_push2Click:(UIButton *)sender {
    JumpViewController *jump = [[JumpViewController alloc]initWithNibName:@"JumpViewController" bundle:nil];
    [self.navigationController pushViewController:jump animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)reloadview:(NSNotification *)notification
{
    NSMutableArray *resulet = [notification object];
    self.listDate = resulet;
    NSLog(@"the first array's count is %d",self.listDate.count);
    [self.tableview reloadData];
    
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.listDate count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    static NSString *CellTableIdentifier = @"CellTableIdentifier";
//    CustomCell *cell = [tableView dequeueReusableCellWithIdentifier:CellTableIdentifier];
//    if(cell == nil)
//    {
//        cell = [[CustomCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellTableIdentifier];
//        
//    }
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }

    
    NSUInteger row = [indexPath row];
    NSDictionary *dict = [self.listDate objectAtIndex:row];
    NSLog(@"my dictionary is %@",[dict description]);
    //cell.title.text = [dict objectForKey:@"id"];
    //cell.span.text = [dict objectForKey:@"span"];
    cell.textLabel.text = [dict objectForKey:@"span"];
    cell.detailTextLabel.text = [dict objectForKey:@"ul"];

    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

@end
