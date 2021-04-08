//
//  UITextField+Category.m
//  MANKUProject
//
//  Created by xiaobu on 2019/8/9.
//  Copyright © 2018年 MANKU. All rights reserved.
//

#import "UITextField+Category.h"
#import <objc/runtime.h>

static const NSString *KEY_MAX_LENGTH = @"maxLength";
@implementation UITextField (Category)

+ (UITextField *(^)(void))tfInit {
    return ^{
        return [[UITextField alloc] init];
    };
}

+ (UITextField *(^)(CGRect))tfFrame {
    return ^(CGRect tfFrame) {
        return [[UITextField alloc] initWithFrame:tfFrame];
    };
}

- (UITextField *(^)(NSString *))tfText {
    return ^(NSString *tfText) {
        self.text = tfText;
        return self;
    };
}

- (UITextField *(^)(NSString *))tfPlaceholder {
    return ^(NSString *tfPlaceholder) {
        self.placeholder = tfPlaceholder;
        return self;
    };
}

- (UITextField *(^)(UIFont *))tfFont {
    return ^(UIFont *tfFont) {
        self.font = tfFont;
        return self;
    };
}

- (UITextField *(^)(UIColor *))tfTextColor {
    return ^(UIColor *tfTextColor) {
        self.textColor = tfTextColor;
        return self;
    };
}

- (UITextField *(^)(UIColor *))tfBorderColor {
    return ^(UIColor *tfBorderColor) {
        self.layer.borderColor = tfBorderColor.CGColor;
        self.layer.borderWidth = 0.5;
        return self;
    };
}

- (UITextField *(^)(CGFloat))tfCornerRadius {
    return ^(CGFloat tfCornerRadius) {
        self.layer.cornerRadius = tfCornerRadius;
        self.layer.masksToBounds = YES;
        return self;
    };
}

- (UITextField *(^)(NSTextAlignment))tfTextAlignment {
    return ^(NSTextAlignment alignment) {
        self.textAlignment = alignment;
        return self;
    };
}

- (UITextField *(^)(id, SEL))tfAction {
    return ^(id target, SEL tfSEL) {
        [self addTarget:target action:tfSEL forControlEvents:UIControlEventEditingChanged];
        return self;
    };
}

- (UITextField *(^)(NSInteger))tfMaxLength {
    return ^(NSInteger tfMaxLength) {
        self.maxLength = tfMaxLength;
        return self;
    };
}

- (void)setMaxLength:(NSInteger)maxLength {
    [self addTarget:self action:@selector(textFieldValueChanged:) forControlEvents:UIControlEventEditingChanged];
    objc_setAssociatedObject(self, &KEY_MAX_LENGTH, @(maxLength), OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (NSInteger)maxLength {
    return [objc_getAssociatedObject(self, &KEY_MAX_LENGTH) integerValue];
}

- (void)textFieldValueChanged:(UITextField *)textField {
    if (textField.text.length > self.maxLength) {
        textField.text = [textField.text substringToIndex:self.maxLength];
    }
}

@end
