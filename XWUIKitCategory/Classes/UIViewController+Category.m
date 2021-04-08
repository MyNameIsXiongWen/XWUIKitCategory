//
//  UIViewController+Category.m
//  ManKuIPad
//
//  Created by xiaobu on 2019/9/15.
//  Copyright © 2018年 jason. All rights reserved.
//
//使用时 在导航栏的拓展里初始化一个XWNavgationView，然后复制给kNavigationView
//- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated

#import "UIViewController+Category.h"
#import <objc/runtime.h>

@implementation UIViewController (Category)

#pragma mark ------------自定义导航条-------------
- (XWNavgationView *)kNavigationView {
    return objc_getAssociatedObject(self, @"kNavigationView");
}

- (void)setKNavigationView:(XWNavgationView *)kNavigationView {
    objc_setAssociatedObject(self, @"kNavigationView", kNavigationView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

#pragma mark ------------事件-------------
//左侧按钮事件
- (void)leftNavBtnAction:(UIButton *)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
//右侧按钮事件
- (void)rightNavBtnAction:(UIButton *)sender {
    
}
//右侧按钮事件
- (void)rightAnthorNavBtnAction:(UIButton *)sender {
    
}

@end
