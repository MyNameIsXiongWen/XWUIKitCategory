//
//  UITextField+Category.h
//  MANKUProject
//
//  Created by xiaobu on 2019/8/9.
//  Copyright © 2018年 MANKU. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextField (Category)

+ (UITextField *(^)(CGRect tfFrame))tfFrame;
- (UITextField *(^)(NSString *tfText))tfText;
- (UITextField *(^)(NSString *tfPlaceholder))tfPlaceholder;
- (UITextField *(^)(UIFont *tfFont))tfFont;
- (UITextField *(^)(UIColor *tfTextColor))tfTextColor;
- (UITextField *(^)(UIColor *tfBorderColor))tfBorderColor;
- (UITextField *(^)(CGFloat tfCornerRadius))tfCornerRadius;

@end
