//
//  SecondViewController.h
//  MyDemo2
//
//  Created by tech-Yu-Mac on 13-11-14.
//  Copyright (c) 2013年 yujie. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SecondViewController : UIViewController<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UIButton *_push;
@property (weak, nonatomic) IBOutlet UIButton *_clear;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *_btnClick;
@property (weak, nonatomic) IBOutlet UITextField *username;
@property (weak, nonatomic) IBOutlet UITextField *password;

@end
