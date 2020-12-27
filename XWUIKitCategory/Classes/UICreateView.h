//
//  UICreateView.h
//  GoOverSeas
//
//  Created by xiaobu on 2019/7/10.
//  Copyright © 2019 xiaobu. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface UICreateView : NSObject

/**
 创建UITableView

 @param rect frame
 @param style style
 @param object object
 @return tableview
 */
+ (UITableView *)initWithFrame:(CGRect)rect
                         Style:(UITableViewStyle)style
                        Object:(id)object;

/**
 创建UITableView 识别多个手势的

 @param rect frame
 @param style style
 @param object object
 @return tableview
 */
+ (UITableView *)initWithRecognizeSimultaneouslyFrame:(CGRect)rect
                                                Style:(UITableViewStyle)style
                                               Object:(id)object;


/**
 UICollectionView

 @param rect fame
 @param layout layout
 @param object object
 @return CollectionView
 */
+ (UICollectionView *)initWithFrame:(CGRect)rect
                             Layout:(UICollectionViewFlowLayout *)layout
                             Object:(id)object;

@end

NS_ASSUME_NONNULL_END
