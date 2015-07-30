//
//  GoodsdetailViewController.h
//  Jingbao
//
//  Created by mac on 15/7/15.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DetailModel.h"

@interface GoodsdetailViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,retain)UISearchBar * searchBar;
@property (nonatomic,retain)NSString * goods_idString;
@property (nonatomic,strong)UITableView * tabelView;
@property (nonatomic,strong)UIButton * btn;

@end
