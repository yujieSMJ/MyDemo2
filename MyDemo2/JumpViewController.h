//
//  JumpViewController.h
//  MyDemo2
//
//  Created by tech-Yu-Mac on 13-11-14.
//  Copyright (c) 2013年 yujie. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JumpViewController : UIViewController
@property (nonatomic,retain) NSString *name1;
@property (nonatomic,retain) NSString *passwords1;
@property (weak, nonatomic) IBOutlet UITextField *username1;
@property (weak, nonatomic) IBOutlet UITextField *password1;

@end
