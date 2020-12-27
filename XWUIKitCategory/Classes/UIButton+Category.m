//
//  UIButton+Category.m
//  MANKUProject
//
//  Created by xiaobu on 2019/7/23.
//  Copyright © 2018年 MANKU. All rights reserved.
//

#import "UIButton+Category.h"
#import <objc/runtime.h>

@implementation UIButton (Category)
static const NSString *KEY_HIT_TEST_EDGE_INSETS = @"HitTestEdgeInsets";
static const NSString *KEY_BTN_IDENTIFIER = @"btnIdentifier";
static const NSString *KEY_BTN_BADGELABEL = @"btnBadgeLabel";

+ (UIButton *(^)(void))btnInit {
    return  ^() {
        return UIButton.new;
    };
}

+ (UIButton *(^)(CGRect))btnFrame {
    return  ^(CGRect btnFrame) {
        return [[UIButton alloc] initWithFrame:btnFrame];
    };
}

- (UIButton *(^)(NSString *))btnTitle {
    return ^(NSString *btnTitle) {
        [self setTitle:btnTitle forState:UIControlStateNormal];
        return self;
    };
}

- (UIButton *(^)(NSString *))btnSelectedTitle {
    return ^(NSString *btnSelectedTitle) {
        [self setTitle:btnSelectedTitle forState:UIControlStateSelected];
        return self;
    };
}

- (UIButton *(^)(UIImage *))btnImage {
    return ^(UIImage *btnImage) {
        [self setImage:btnImage forState:UIControlStateNormal];
        return self;
    };
}

- (UIButton *(^)(UIImage *))btnSelectedImage {
    return ^(UIImage *btnSelectedImage) {
        [self setImage:btnSelectedImage forState:UIControlStateSelected];
        return self;
    };
}

- (UIButton *(^)(UIFont *))btnFont {
    return ^(UIFont *btnFont) {
        self.titleLabel.font = btnFont;
        return self;
    };
}

- (UIButton *(^)(UIColor *))btnTitleColor {
    return ^(UIColor *btnTitleColor) {
        [self setTitleColor:btnTitleColor forState:UIControlStateNormal];
        return self;
    };
}

- (UIButton *(^)(UIColor *))btnBkgColor {
    return ^(UIColor *btnBkgColor) {
        self.backgroundColor = btnBkgColor;
        return self;
    };
}

- (UIButton *(^)(CGFloat ))btnCornerRadius {
    return ^(CGFloat btnCornerRadius) {
        self.layer.cornerRadius = btnCornerRadius;
        self.layer.masksToBounds = YES;
        return self;
    };
}

- (UIButton *(^)(UIColor *))btnBorderColor {
    return ^(UIColor *btnBorderColor) {
        self.layer.borderColor = btnBorderColor.CGColor;
        self.layer.borderWidth = 0.5;
        return self;
    };
}

- (UIButton *(^)(id, SEL))btnAction {
    return ^(id target, SEL btnSEL) {
        [self addTarget:target action:btnSEL forControlEvents:UIControlEventTouchUpInside];
        return self;
    };
}

+ (void)initialize {
    UIButton.appearance.exclusiveTouch = YES;
}

- (void)setBtnIdentifier:(NSString *)btnIdentifier {
    objc_setAssociatedObject(self, &KEY_BTN_IDENTIFIER, btnIdentifier, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (NSString *)btnIdentifier {
    return objc_getAssociatedObject(self, &KEY_BTN_IDENTIFIER);
}

- (void)setBtnBadgeLabel:(UILabel *)btnBadgeLabel {
    [self addSubview:btnBadgeLabel];
    objc_setAssociatedObject(self, &KEY_BTN_BADGELABEL, btnBadgeLabel, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UILabel *)btnBadgeLabel {
    return objc_getAssociatedObject(self, &KEY_BTN_BADGELABEL);
}

- (void)setHitTestEdgeInsets:(UIEdgeInsets)hitTestEdgeInsets {
    NSValue *value = [NSValue value:&hitTestEdgeInsets withObjCType:@encode(UIEdgeInsets)];
    objc_setAssociatedObject(self, &KEY_HIT_TEST_EDGE_INSETS, value, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIEdgeInsets)hitTestEdgeInsets {
    NSValue *value = objc_getAssociatedObject(self, &KEY_HIT_TEST_EDGE_INSETS);
    if(value) {
        UIEdgeInsets edgeInsets; [value getValue:&edgeInsets]; return edgeInsets;
    }
    else {
        return UIEdgeInsetsZero;
    }
}

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
    if (UIEdgeInsetsEqualToEdgeInsets(self.hitTestEdgeInsets, UIEdgeInsetsZero) || !self.enabled || self.hidden) {
        return [super pointInside:point withEvent:event];
    }
    
    CGRect relativeFrame = self.bounds;
    CGRect hitFrame = UIEdgeInsetsInsetRect(relativeFrame, self.hitTestEdgeInsets);
    return CGRectContainsPoint(hitFrame, point);
}

@end
