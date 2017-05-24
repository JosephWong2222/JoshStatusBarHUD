//
//  JoshStatusBarHUD.h
//  JoshStatusBarHUD
//
//  Created by JacksonWong on 2017/5/23.
//  Copyright © 2017年 JosephWong2. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JoshStatusBarHUD : NSObject
/**
 * 展示图片和信息
 */
+ (void)showMessage:(NSString *)msg WithImage:(UIImage*)img;
/**
 * 展示成功信息
 */
+ (void)showSuccess:(NSString *)msg;
/**
 * 展示失败信息
 */
+ (void)showError:(NSString *)msg;
/**
 * 正在加载
 */
+ (void)showLoading:(NSString *)msg;
/**
 * 文字信息
 */
+ (void)showMessage:(NSString *)msg;
/**
 * 隐藏
 */
+ (void)hide;


@end
