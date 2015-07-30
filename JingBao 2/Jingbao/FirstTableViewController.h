//
//  FirstTableViewController.h
//  Jingbao
//
//  Created by mac on 15/7/8.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "First.h"
#import "Home3Model.h"
#import "Home2Model.h"
#import "CollectionModel.h"
@interface FirstTableViewController : UITableViewController<UIScrollViewDelegate,UITableViewDelegate,UITableViewDataSource,UICollectionViewDataSource,UICollectionViewDelegate>
@property (nonatomic,retain)UISearchBar * searchBar;
@property (nonatomic,strong)First * first;
@property (nonatomic,retain)UICollectionView * collectionView;
@property (nonatomic,strong)Home3Model * home3;
@property (nonatomic,strong)Home2Model * home2;
@property (nonatomic,strong)CollectionModel * collection;
@end
