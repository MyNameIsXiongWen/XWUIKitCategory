//
//  UILabel+Category.h
//  MANKUProject
//
//  Created by xiaobu on 2019/7/23.
//  Copyright © 2018年 MANKU. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (Category)

+ (UILabel *(^)(void))labelInit;
+ (UILabel *(^)(CGRect labelFrame))labelFrame;
- (UILabel *(^)(NSString *labelText))labelText;
- (UILabel *(^)(UIFont *labelFont))labelFont;
- (UILabel *(^)(UIColor *labelTitleColor))labelTitleColor;
- (UILabel *(^)(UIColor *labelBkgColor))labelBkgColor;
- (UILabel *(^)(NSInteger number))labelNumberOfLines;
- (UILabel *(^)(NSTextAlignment alignment))labelTextAlignment;
- (UILabel *(^)(UIColor *tfBorderColor))labelBorderColor;
- (UILabel *(^)(CGFloat tfCornerRadius))labelCornerRadius;
- (UILabel *(^)(id target, SEL labelSEL))labelAction;

@end
