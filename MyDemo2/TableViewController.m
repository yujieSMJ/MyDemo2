//
//  TableViewController.m
//  MyDemo2
//
//  Created by tech-Yu-Mac on 13-11-14.
//  Copyright (c) 2013年 yujie. All rights reserved.
//

#import "TableViewController.h"
#import "sqlite3.h"
#import "FourViewController.h"

@interface TableViewController ()

@end

@implementation TableViewController
{
    sqlite3 *db;
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self selectDates];
    NSLog(@"%d",self.perName.count);
    
    //简单的数据绑定
    //NSBundle *bundle = [NSBundle mainBundle];
    //NSString *plistPath = [bundle pathForResource:@"MyDemo2-Info" ofType:@"plist"];
    
    //self.iTems = [[NSArray alloc]initWithContentsOfFile:plistPath];
    //self.iTems = @[@"ADFSDFEGFGHSHSTSTG",@"BFSGSRSRHRTTHT5S",@"CREYEYSRYSRGSFSDFGRSGDSHGFJYTJYJD",@"DGSDFSHRTHTYRJHTRS"];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)selectDates{
    NSString *DBFilePath = [NSString stringWithFormat:@"%@/Documents/dbDemo",NSHomeDirectory()];
    NSLog(@"%@",DBFilePath);
    
    
    if(sqlite3_open([DBFilePath UTF8String], &db) != SQLITE_OK)
    {
        sqlite3_close(db);
        NSLog(@"数据库db打开失败");
    }
    else
    {
        NSString *query =@"SELECT cdate, content FROM Note ORDER BY cdate";
//        NSString *counts = @"SELECT COUNT(*) FROM Note";
        sqlite3_stmt *statement;
//        if(sqlite3_prepare_v2(db, [counts UTF8String], -1, &statement, nil)== SQLITE_OK)
//        {
//            if(sqlite3_step(statement)==SQLITE_ROW){
//                int count=sqlite3_column_int(statement,0);
//                NSLog(@"the count is %d",count);
//                self.perName = [NSMutableArray arrayWithCapacity:count];
//                self.perPass = [NSMutableArray arrayWithCapacity:count];
//            }
//            
//        }
        self.perName = [NSMutableArray new];
        self.perPass = [NSMutableArray new];
        if(sqlite3_prepare(db, [query UTF8String], -1, &statement, nil)==SQLITE_OK)
        {
            NSMutableString *user;
            NSMutableString *pword;
            while (sqlite3_step(statement)==SQLITE_ROW) {
                
                user = [[NSMutableString alloc] initWithUTF8String:(char *)sqlite3_column_text(statement, 0)];
                pword = [[NSMutableString alloc] initWithUTF8String:(char *)sqlite3_column_text(statement, 1)];
                
                NSLog(@"%@",user);
                NSLog(@"%@",pword);
                [self.perName addObject:user];
                [self.perPass addObject:pword];
            }
            sqlite3_finalize(statement);
        }
        sqlite3_close(db);
        
    }
    
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
//#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return self.perName.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
//#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    // Configure the cell...
    /*
    NSUInteger row = [indexPath row];
    NSDictionary *rowDict = [self.iTems objectAtIndex:row];
    cell.textLabel.text = [rowDict objectForKey:@"Bundle name"];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
     */
    NSLog(@"indexPath.section is %d",indexPath.section);
    cell.textLabel.text = [self.perName objectAtIndex:indexPath.section];
    cell.detailTextLabel.text = [self.perPass objectAtIndex:indexPath.section];
    cell.imageView.image = [UIImage imageNamed:@"song.gif"];

    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here, for example:
    // Create the next view controller.
    <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];

    // Pass the selected object to the new view controller.
    
    // Push the view controller.
    [self.navigationController pushViewController:detailViewController animated:YES];
}
 
 */

@end
