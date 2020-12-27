//
//  XWNavgationView.m
//  GoOverSeas
//
//  Created by xiaobu on 2019/7/27.
//  Copyright © 2019 xiaobu. All rights reserved.
//

#import "XWNavgationView.h"
#import "UIView+Category.h"
#import "UILabel+Category.h"
#import "UIButton+Category.h"

@interface XWNavgationView () {
    float ScreenW;
    float ScreenH;
    float StatusBarHeight;
}

@end

@implementation XWNavgationView

- (id)initWithFrame:(CGRect)frame {
    if (self == [super initWithFrame:frame]) {
        self.backgroundColor = UIColor.whiteColor;
        self.userInteractionEnabled = YES;
        ScreenW = UIScreen.mainScreen.bounds.size.width;
        ScreenH = UIScreen.mainScreen.bounds.size.height;
        StatusBarHeight = ((ScreenH > 736) ? 44 : 20);
        
        [self addSubview:self.titleView];
        [self addSubview:self.leftBtn];
        [self addSubview:self.rightBtn];
        [self addSubview:self.rightAnotherBtn];
        [self addSubview:self.redPointView];
    }
    return self;
}

- (void)setTitle:(NSString *)title {
    _title = title;
    self.titleLabel.text = title;
}

#pragma mark ------------UI-------------
- (UIView *)titleView {
    if (!_titleView) {
        _titleView = UIView.viewFrame(CGRectMake(85, StatusBarHeight, ScreenW - 170, 44));
        [_titleView addSubview:self.titleLabel];
    }
    return _titleView;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = UILabel.labelFrame(CGRectMake(0, 0, self.titleView.width, 44)).labelFont([UIFont boldSystemFontOfSize:18]).labelTitleColor(UIColor.blackColor).labelTextAlignment(NSTextAlignmentCenter);
    }
    return _titleLabel;
}

- (UIButton *)leftBtn {
    if (!_leftBtn) {
        _leftBtn = UIButton.btnFrame(CGRectMake(0, StatusBarHeight, 80, 44));
        _leftBtn.showsTouchWhenHighlighted = NO;
        _leftBtn.imageEdgeInsets = UIEdgeInsetsMake(0, -15, 0, 15);
    }
    return _leftBtn;
}

- (UIButton *)rightBtn {
    if (!_rightBtn) {
        _rightBtn = UIButton.btnFrame(CGRectMake(ScreenW-60, StatusBarHeight, 40, 44));
        _rightBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
        _rightBtn.showsTouchWhenHighlighted = NO;
    }
    return _rightBtn;
}

- (UIButton *)rightAnotherBtn {
    if (!_rightAnotherBtn) {
        _rightAnotherBtn = UIButton.btnFrame(CGRectMake(ScreenW-40-60, StatusBarHeight, 40, 44));
        _rightAnotherBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
        _rightAnotherBtn.showsTouchWhenHighlighted = NO;
    }
    return _rightAnotherBtn;
}

- (UIView *)redPointView {
    if (!_redPointView) {
        _redPointView = UIView.viewFrame(CGRectMake(ScreenW-25, StatusBarHeight+10, 6, 6)).bkgColor(UIColor.redColor).cornerRadius(3);
        _redPointView.hidden = YES;
    }
    return _redPointView;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
