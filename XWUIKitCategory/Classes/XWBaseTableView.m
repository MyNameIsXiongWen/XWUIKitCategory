//
//  XWBaseTableView.m
//  FSScrollViewNestTableViewDemo
//
//  Created by xiaobu on 2019/5/23.
//  Copyright © 2019年 xiaobu. All rights reserved.
//

#import "XWBaseTableView.h"

@implementation XWBaseTableView

/**
 同时识别多个手势

 @param gestureRecognizer gestureRecognizer description
 @param otherGestureRecognizer otherGestureRecognizer description
 @return return value description
 */
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
//    if ([gestureRecognizer isKindOfClass:UIPanGestureRecognizer.class]) {
//        UIPanGestureRecognizer *gesture = (UIPanGestureRecognizer *)gestureRecognizer;
//        CGFloat translationY = [gesture translationInView:self].y;
//        if (translationY == 0) {
//            return NO;
//        }
//    }
    return YES;
}

@end
