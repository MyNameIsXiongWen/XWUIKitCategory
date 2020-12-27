//
//  UIView+Category.h
//  MANKUProject
//
//  Created by xiaobu on 2019/7/23.
//  Copyright © 2018年 MANKU. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Category)

+ (UIView *(^)(void))viewInit;
+ (UIView *(^)(CGRect viewFrame))viewFrame;
- (UIView *(^)(CGFloat cornerRadius))cornerRadius;
- (UIView *(^)(UIColor *bkgColor))bkgColor;
- (UIView *(^)(UIColor *borderColor))borderColor;
- (UIView *(^)(id target, SEL viewSEL))viewAction;
/**
 * view.top
 */
@property (nonatomic, assign) CGFloat top;
/**
 * view.bottom
 */
@property (nonatomic, assign) CGFloat bottom;
/**
 * view.left
 */
@property (nonatomic, assign) CGFloat left;
/**
 * view.right
 */
@property (nonatomic, assign) CGFloat right;
/**
 * view.width
 */
@property (nonatomic, assign) CGFloat width;
/**
 * view.height
 */
@property (nonatomic, assign) CGFloat height;
/**
 * view.center.x
 */
@property (nonatomic, assign) CGFloat centerX;
/**
 * view.center.y
 */
@property (nonatomic, assign) CGFloat centerY;

@property (assign, nonatomic) CGFloat    x;
@property (assign, nonatomic) CGFloat    y;
@property (assign, nonatomic) CGPoint    origin;

@end
