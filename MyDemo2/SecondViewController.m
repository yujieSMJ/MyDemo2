//
//  SecondViewController.m
//  MyDemo2
//
//  Created by tech-Yu-Mac on 13-11-14.
//  Copyright (c) 2013年 yujie. All rights reserved.
//

#import "SecondViewController.h"
#import "JumpViewController.h"
#import "sqlite3.h"
#import "TableViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController
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
    // Do any additional setup after loading the view from its nib.
    self._push.tag = 0;
    self._clear.tag = 1;
    self.username.delegate = self;
    self.password.delegate = self;
    
    UIBarButtonItem *right = [[UIBarButtonItem alloc]initWithTitle:@"nest" style:UIBarButtonItemStyleDone target:self action:@selector(selects:)];
    self.navigationItem.rightBarButtonItem = right;
}

-(void) selects:(UIBarButtonItem *)buttons{
    TableViewController * jump = [[TableViewController alloc]initWithNibName:@"TableViewController" bundle:nil];
    [self.navigationController pushViewController:jump animated:YES];
}
- (IBAction)_pushClick:(UIButton *)sender {
    UIButton *btn = (UIButton *)sender;
    if(btn.tag==0)
    {
        if([self addDate])
        {
            JumpViewController * jump = [[JumpViewController alloc]initWithNibName:@"JumpViewController" bundle:nil];
            [self.navigationController pushViewController:jump animated:YES];
        }
    }else
    {
        self.username.text = nil;
        self.password.text = nil;
    }
    
}

-(BOOL)addDate{
    
    NSMutableString *username = [NSMutableString stringWithFormat:@"%@",self.username.text];
    NSMutableString *password = [NSMutableString stringWithFormat:@"%@",self.password.text];
    
    if(username.length >0 && password.length>0)
    {
    
        NSString *DBFilePath = [NSString stringWithFormat:@"%@/Documents/dbDemo",NSHomeDirectory()];
        NSLog(@"%@",DBFilePath);
        
        
        if(sqlite3_open([DBFilePath UTF8String], &db) != SQLITE_OK)
        {
            sqlite3_close(db);
            NSLog(@"数据库db打开失败");
            return NO;
        }
        else
        {
            NSString *sqlstr = @"INSERT OR REPLACE INTO note (cdate,content) VALUES (?,?)";
            
            sqlite3_stmt *statement;
            if(sqlite3_prepare_v2(db, [sqlstr UTF8String], -1, &statement, NULL) == SQLITE_OK)
            {
                sqlite3_bind_text(statement, 1, [username UTF8String], -1, NULL);
                sqlite3_bind_text(statement, 2, [password UTF8String], -1, NULL);
                
                if(sqlite3_step(statement) !=SQLITE_DONE)
                {
                    NSAssert(NO, @"插入数据失败！");
                    return NO;
                }
            }
            sqlite3_finalize(statement);
            
            sqlite3_close(db);
            NSLog(@"success!!!");
            return YES;
        }
    }else
    {
        //提示窗口
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"用户名和密码不能为空" delegate:nil cancelButtonTitle:@"Cancel" otherButtonTitles:@"Conform", nil];
        [alert show];
        return NO;
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

@end
