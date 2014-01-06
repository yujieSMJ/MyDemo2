//
//  JumpViewController.m
//  MyDemo2
//
//  Created by tech-Yu-Mac on 13-11-14.
//  Copyright (c) 2013年 yujie. All rights reserved.
//

#import "JumpViewController.h"
#import "sqlite3.h"

@interface JumpViewController ()

@end

@implementation JumpViewController
{
    sqlite3 *db;
}

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
    [self selectDate];
    
    // Do any additional setup after loading the view from its nib.
}

-(void)selectDate{
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
        sqlite3_stmt *statement;
        
        if(sqlite3_prepare(db, [query UTF8String], -1, &statement, nil)==SQLITE_OK)
        {
            if (sqlite3_step(statement)==SQLITE_ROW) {
                
                self.name1 = [[NSString alloc] initWithUTF8String:(char *)sqlite3_column_text(statement, 0)];
                self.passwords1 = [[NSString alloc] initWithUTF8String:(char *)sqlite3_column_text(statement, 1)];
                
                NSLog(@"%@",self.name1);
                NSLog(@"%@",self.passwords1);
                self.username1.text = self.name1;
                self.password1.text = self.passwords1;
            }
            sqlite3_finalize(statement);
        }
        sqlite3_close(db);

    }
    

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
