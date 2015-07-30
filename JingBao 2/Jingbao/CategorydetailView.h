//
//  CategorydetailView.h
//  Jingbao
//
//  Created by mac on 15/7/13.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GoodslistModel.h"
#import "GoodsdetailViewController.h"
#import "GoodsTableViewCell.h"
@interface CategorydetailView : UIViewController<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,retain)UISearchBar * searchBar;
@property (nonatomic,strong)UITableView * tabelView;
@property (nonatomic,copy)NSString * urlString;
@property (nonatomic,strong)UITableViewCell * goodsCell;
@property (nonatomic,strong)GoodslistModel * goodslist;

@end
