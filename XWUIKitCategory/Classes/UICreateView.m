//
//  UICreateView.m
//  GoOverSeas
//
//  Created by xiaobu on 2019/7/10.
//  Copyright © 2019 xiaobu. All rights reserved.
//

#import "UICreateView.h"
#import "XWBaseTableView.h"

@implementation UICreateView

+ (UITableView *)initWithFrame:(CGRect)rect Style:(UITableViewStyle)style Object:(id)object {
    UITableView *tableView = [[UITableView alloc] initWithFrame:rect style:style];
    tableView.backgroundColor = UIColor.whiteColor;
    tableView.delegate = object;
    tableView.dataSource = object;
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    tableView.showsVerticalScrollIndicator = NO;
    return tableView;
}

+ (UITableView *)initWithRecognizeSimultaneouslyFrame:(CGRect)rect Style:(UITableViewStyle)style Object:(id)object {
    UITableView *tableView = [[XWBaseTableView alloc] initWithFrame:rect style:style];
    tableView.backgroundColor = UIColor.whiteColor;
    tableView.delegate = object;
    tableView.dataSource = object;
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    tableView.showsVerticalScrollIndicator = NO;
    return tableView;
}

+ (UICollectionView *)initWithFrame:(CGRect)rect Layout:(UICollectionViewFlowLayout *)layout Object:(id)object {
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:rect collectionViewLayout:layout];
    collectionView.backgroundColor = UIColor.whiteColor;
    collectionView.showsVerticalScrollIndicator = NO;
    collectionView.showsHorizontalScrollIndicator = NO;
    collectionView.delegate = object;
    collectionView.dataSource = object;
    return collectionView;
}

@end
