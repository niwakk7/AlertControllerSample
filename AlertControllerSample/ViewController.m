//
//  ViewController.m
//  AlertControllerSample
//
//  Created by 丹羽　幸生 on 2014/10/02.
//  Copyright (c) 2014年 ___FULLUSERNAME___. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITextFieldDelegate>

@property (nonatomic, retain)   NSString *text;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn1.frame = CGRectMake(80, 180, 160, 30);
    [btn1 setTitle:@"1 message Alert" forState:UIControlStateNormal];
    [btn1 addTarget:self action:@selector(btn1Pushed) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:btn1];
    
    UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn2.frame = CGRectMake(110, btn1.frame.origin.y + btn1.frame.size.height + 20, 100, 30);
    [btn2 setTitle:@"Text Alert" forState:UIControlStateNormal];
    [btn2 addTarget:self action:@selector(btn2Pushed) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:btn2];
}

- (void)btn1Pushed
{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Title" message:@"message" preferredStyle:UIAlertControllerStyleAlert];
    
    [alert addAction:[UIAlertAction actionWithTitle:@"OK"
                                              style:UIAlertActionStyleDefault
                                            handler:^(UIAlertAction *action) {
                                                NSLog(@"OK pushed");
                                                
                                            }]];
    
    [self presentViewController:alert animated:YES completion:nil];
    
    [alert addAction:[UIAlertAction actionWithTitle:@"Cancel"
                                              style:UIAlertActionStyleDestructive
                                            handler:^(UIAlertAction *action) {
                                                NSLog(@"Cancel pushed");
                                            }]];
}

- (void)btn2Pushed
{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Title" message:@"message" preferredStyle:UIAlertControllerStyleAlert];
    
    [alert addAction:[UIAlertAction actionWithTitle:@"OK"
                                              style:UIAlertActionStyleDefault
                                            handler:^(UIAlertAction *action) {
                                                NSLog(@"OK pushed");
                                                
                                            }]];
    
    [alert addTextFieldWithConfigurationHandler:^(UITextField *textField) {
        textField.placeholder = @"text input";
        textField.delegate = self;
    }];
    
    [self presentViewController:alert animated:YES completion:nil];
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    self.text = textField.text;
    
    NSLog(@"text editing finished");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

