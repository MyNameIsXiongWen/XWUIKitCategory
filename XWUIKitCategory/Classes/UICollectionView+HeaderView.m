//
//  UICollectionView+HeaderView.m
//  GoOverSeas
//
//  Created by xiaobu on 2019/7/18.
//  Copyright © 2019 xiaobu. All rights reserved.
//

#import "UICollectionView+HeaderView.h"
#import "UIView+Category.h"
#import "NSObject+Category.h"
#import <objc/runtime.h>

static const NSString *kCollectionHeaderViewKey = @"xw_collectionHeaderView";
static const NSString *kCollectionFooterViewKey = @"xw_collectionFooterView";
static const NSString *kCollectionHeaderViewOffsetKey = @"xw_collectionHeaderViewOffset";
static const NSString *kCollectionFooterViewOffsetKey = @"xw_collectionFooterViewOffset";

@implementation UICollectionView (HeaderView)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self method_exchange:@selector(layoutSubviews) with:@selector(xw_layoutSubviews)];
    });
}

- (void)xw_layoutSubviews {
    [self xw_layoutSubviews];
    self.xw_collectionHeaderView.y = -self.xw_collectionHeaderView.height - self.xw_collectionHeaderViewOffset;
    self.xw_collectionFooterView.y = self.contentSize.height + self.xw_collectionFooterViewOffset;
}

- (void)setXw_collectionHeaderView:(UIView *)xw_collectionHeaderView {
    UIView *headerView = self.xw_collectionHeaderView;
    if (headerView != xw_collectionHeaderView) {
        UIEdgeInsets contentInsets = self.contentInset;
        contentInsets.top -=  headerView.height;
        [headerView removeFromSuperview];
        contentInsets.top += xw_collectionHeaderView.height;
        self.contentInset = contentInsets;
        [self addSubview:xw_collectionHeaderView];
        objc_setAssociatedObject(self, &(kCollectionHeaderViewKey), xw_collectionHeaderView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
}

- (void)setXw_collectionFooterView:(UIView *)xw_collectionFooterView {
    UIView *footerView = self.xw_collectionFooterView;
    if (footerView != xw_collectionFooterView) {
        UIEdgeInsets contentInsets = self.contentInset;
        contentInsets.bottom -=  footerView.height;
        [footerView removeFromSuperview];
        contentInsets.bottom += xw_collectionFooterView.height;
        self.contentInset = contentInsets;
        [self addSubview:xw_collectionFooterView];
        objc_setAssociatedObject(self, &(kCollectionFooterViewKey), xw_collectionFooterView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
}

- (void)setXw_collectionHeaderViewOffset:(CGFloat)xw_collectionHeaderViewOffset {
    objc_setAssociatedObject(self, &(kCollectionHeaderViewOffsetKey), @(xw_collectionHeaderViewOffset), OBJC_ASSOCIATION_ASSIGN);
    [self setNeedsLayout];
}

- (void)setXw_collectionFooterViewOffset:(CGFloat)xw_collectionFooterViewOffset {
    objc_setAssociatedObject(self, &(kCollectionFooterViewOffsetKey), @(xw_collectionFooterViewOffset), OBJC_ASSOCIATION_ASSIGN);
    [self setNeedsLayout];
}

- (UIView *)xw_collectionHeaderView {
    return objc_getAssociatedObject(self, &(kCollectionHeaderViewKey));
}

- (UIView *)xw_collectionFooterView {
    return objc_getAssociatedObject(self, &(kCollectionFooterViewKey));
}

- (CGFloat)xw_collectionHeaderViewOffset {
    NSNumber *number = objc_getAssociatedObject(self, &(kCollectionHeaderViewOffsetKey));
    return number.floatValue;
}

- (CGFloat)xw_collectionFooterViewOffset {
    NSNumber *number = objc_getAssociatedObject(self, &(kCollectionFooterViewOffsetKey));
    return number.floatValue;
}

@end
