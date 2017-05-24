//
//  JoshStatusBarHUD.m
//  JoshStatusBarHUD
//
//  Created by JacksonWong on 2017/5/23.
//  Copyright © 2017年 JosephWong2. All rights reserved.
//0.0.0

#import "JoshStatusBarHUD.h"

#define JoshMessageFont [UIFont systemFontOfSize:12]

#define JoshAnimationTime 0.25

#define JoshStatusBarHeight 20

#define JoshScreenWidth [UIApplication sharedApplication].keyWindow.frame.size.width

@implementation JoshStatusBarHUD

static UIWindow *window_;

static NSTimer *timer_;


/**
 * 展示窗口
 */
+ (void)showWindow {
    
    //创建窗口
    window_ = [[UIWindow alloc] init];
    window_.backgroundColor = [UIColor blackColor];
    CGFloat width = JoshScreenWidth;
    
    window_.frame = CGRectMake(0, -JoshStatusBarHeight, width, JoshStatusBarHeight);
    window_.windowLevel = UIWindowLevelAlert;
    window_.hidden = NO;
    //创建动画
 
    [UIView animateWithDuration:JoshAnimationTime animations:^{
        window_.frame = CGRectMake(0, 0, width, JoshStatusBarHeight);
    }];
}

/**
 * 展示图片和信息
 *@param msg 文字
 *@param img 图片
 */
+ (void)showMessage:(NSString *)msg WithImage:(UIImage*)img {
    //首先把上次的定时器清空，因为window是全局变量，防止window突然消失
    [timer_ invalidate];
    //创建窗口，让全局变量window_有值
    window_.hidden = YES;
    [self showWindow];
    //设置窗口内按钮的文字和图片内容
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.titleLabel.font = JoshMessageFont;
    [button setTitle:msg forState:UIControlStateNormal];
    if (img) {
        [button setImage:img forState:UIControlStateNormal];
    }
    button.frame = window_.bounds;
    //设置定时器,并且开始定时
    timer_ = [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(hide) userInfo:nil repeats:NO];
    [window_ addSubview:button];
}

/**
 * 展示成功信息
 */
+ (void)showSuccess:(NSString *)msg {
    [self showMessage:@"成功" WithImage:[UIImage imageNamed:@"JoshStatusBarHUD.bundle/success"]];
}

/**
 * 展示失败信息
 */
+ (void)showError:(NSString *)msg {
    [self showMessage:@"失败" WithImage:[UIImage imageNamed:@"JoshStatusBarHUD.bundle/error"]];
}

/**
 * 正在加载
 */
+ (void)showLoading:(NSString *)msg {
    //停止定时器
    [timer_ invalidate];
    timer_ = nil;
    //显示窗口
    [self showWindow];
    //添加文字
    UILabel *label = [[UILabel alloc] init];
    label.text = msg;
    label.font = JoshMessageFont;
    label.textAlignment = NSTextAlignmentCenter;
    label.frame = window_.bounds;
    label.textColor = [UIColor whiteColor];
    [window_ addSubview:label];
    
    
    //添加activityView
    UIActivityIndicatorView *activity = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    [activity startAnimating];
    CGFloat msgWidth = [msg sizeWithAttributes:@{NSFontAttributeName:JoshMessageFont}].width;
    CGFloat centerX = (window_.frame.size.width - msgWidth) * 0.5 - 20;
    CGFloat centerY = window_.frame.size.height * 0.5;
    activity.center = CGPointMake(centerX, centerY);
    [window_ addSubview:activity];
}

/**
 * 文字信息
 */
+ (void)showMessage:(NSString *)msg {
    [self showMessage:@"文字信息" WithImage:nil];
}

/**
 * 隐藏
 */
+ (void)hide {
    [UIView animateWithDuration:JoshAnimationTime animations:^{
        window_.frame = CGRectMake(0,- JoshStatusBarHeight, JoshScreenWidth, JoshStatusBarHeight);
    } completion:^(BOOL finished) {
        window_ = nil;
    }];

}

@end
