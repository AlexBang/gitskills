//
//  CategoryViewController.h
//  Jingbao
//
//  Created by mac on 15/7/11.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CategoryModel.h"
@interface CategoryViewController : UIViewController<UITableViewDelegate,UITableViewDataSource,UICollectionViewDataSource,UICollectionViewDelegate>
@property (nonatomic,strong)UISearchBar * searchBar;
@property (nonatomic,strong)UITableView * categorytabelView;
@property (nonatomic,strong)UICollectionView * categoryCollection;
@property (nonatomic,strong)CategoryModel * categoryModel;

@end
