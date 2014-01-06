//
//  AppDelegate.m
//  MyDemo2
//
//  Created by tech-Yu-Mac on 13-11-12.
//  Copyright (c) 2013年 yujie. All rights reserved.
//

#import "AppDelegate.h"
#import "sqlite3.h"
#define DBFILE_NAME @"NotesList.sqliste3"

@implementation AppDelegate
{
    sqlite3 *db;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    [[NSBundle mainBundle]loadNibNamed:@"Root" owner:self options:nil];
    
    self.window.rootViewController = self.TarBarController;
    [self createOrSelectDateBase];
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}
//创建数据库
-(void) createOrSelectDateBase{
    /*
    //获取数据库所在文件路径
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documents = [paths objectAtIndex:0];
    NSString *writableDBPath = [documents stringByAppendingPathComponent:@"DB"];
    */
    NSString *DBFilePath = [NSString stringWithFormat:@"%@/Documents/dbDemo",NSHomeDirectory()];
    NSLog(@"%@",DBFilePath);
    
    
    if(sqlite3_open([DBFilePath UTF8String], &db) != SQLITE_OK)
    {
        sqlite3_close(db);
        NSLog(@"数据库db打开失败");
    }
    else
    {
        char *err;
        NSString *createSQL = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS Note (cdate TEXT PRIMARY KEY, content TEXT);"];
        if(sqlite3_exec(db, [createSQL UTF8String], nil, nil, &err) !=SQLITE_OK)
        {
            sqlite3_close(db);
            NSAssert1(NO, @"建表失败！,%s", err);
        }
        sqlite3_close(db);
    }
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
