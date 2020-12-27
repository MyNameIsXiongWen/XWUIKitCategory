//
//  UILabel+Category.m
//  MANKUProject
//
//  Created by xiaobu on 2019/7/23.
//  Copyright © 2018年 MANKU. All rights reserved.
//

#import "UILabel+Category.h"

@implementation UILabel (Category)

+ (UILabel *(^)(void))labelInit {
    return ^(void) {
        return [[UILabel alloc] init];
    };
}

+ (UILabel *(^)(CGRect))labelFrame {
    return ^(CGRect labelFrame) {
        return [[UILabel alloc] initWithFrame:labelFrame];
    };
}

- (UILabel *(^)(NSString *))labelText {
    return ^(NSString *labelText) {
        self.text = labelText;
        return self;
    };
}

- (UILabel *(^)(UIColor *))labelTitleColor {
    return ^(UIColor *labelTitleColor) {
        self.textColor = labelTitleColor;
        return self;
    };
}

- (UILabel *(^)(UIColor *))labelBkgColor {
    return ^(UIColor *labelBkgColor) {
        self.backgroundColor = labelBkgColor;
        return self;
    };
}

- (UILabel *(^)(NSInteger))labelNumberOfLines {
    return ^(NSInteger number) {
        self.numberOfLines = number;
        return self;
    };
}

- (UILabel *(^)(UIFont *))labelFont {
    return ^(UIFont *labelFont) {
        self.font = labelFont;
        return self;
    };
}

- (UILabel *(^)(NSTextAlignment ))labelTextAlignment {
    return ^(NSTextAlignment alignment) {
        self.textAlignment = alignment;
        return self;
    };
}

- (UILabel *(^)(UIColor *))labelBorderColor {
    return ^(UIColor *labelBorderColor) {
        self.layer.borderColor = labelBorderColor.CGColor;
        self.layer.borderWidth = 0.5;
        return self;
    };
}

- (UILabel *(^)(CGFloat))labelCornerRadius {
    return ^(CGFloat labelCornerRadius) {
        self.layer.cornerRadius = labelCornerRadius;
        self.layer.masksToBounds = YES;
        return self;
    };
}

- (UILabel *(^)(id, SEL))labelAction {
    return ^(id target, SEL labelSEL) {
        self.userInteractionEnabled = YES;
        [self addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:target action:labelSEL]];
        return self;
    };
}

@end
