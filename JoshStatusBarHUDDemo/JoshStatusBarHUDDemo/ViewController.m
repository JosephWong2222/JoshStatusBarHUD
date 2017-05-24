//
//  ViewController.m
//  JoshStatusBarHUDDemo
//
//  Created by JacksonWong on 2017/5/24.
//  Copyright © 2017年 JosephWong2. All rights reserved.
//

#import "ViewController.h"
#import "JoshStatusBarHUD.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)success {
    [JoshStatusBarHUD showSuccess:@"成功"];
}

- (IBAction)fail {
    [JoshStatusBarHUD showError:@"失败"];
}

- (IBAction)loading {
    [JoshStatusBarHUD showLoading:@"正在加载中"];
}

- (IBAction)showMsg {
    [JoshStatusBarHUD showMessage:@"没有图片哦"];
}

- (IBAction)hide {
    [JoshStatusBarHUD hide];
}


@end
