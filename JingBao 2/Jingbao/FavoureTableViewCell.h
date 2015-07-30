//
//  FavoureTableViewCell.h
//  Jingbao
//
//  Created by mac on 15/7/7.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CollectionModel.h"
@interface FavoureTableViewCell : UITableViewCell<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (nonatomic,retain)UICollectionView * collectionView;
@property (nonatomic,retain)CollectionModel * collection;
@property (nonatomic,retain)NSMutableArray * collectionArr;
@end
