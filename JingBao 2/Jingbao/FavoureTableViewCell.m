//
//  FavoureTableViewCell.m
//  Jingbao
//
//  Created by mac on 15/7/7.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "FavoureTableViewCell.h"
#import "Size.h"
#import "Header.h"
#import "FavouriteCollectionViewCell.h"
#import "CollectionModel.h"
#import "NetworkHandler.h"
#import "UIImageView+WebCache.h"
@implementation FavoureTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        UILabel * label = [[UILabel alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/2.5, 5, SCREEN_WIDTH, 15)];
        label.text = @"最新商品";
        label.backgroundColor = [UIColor redColor];
        [self.contentView addSubview:label];
        NSString * str1 = HOSTS;
        NSString * str2 = MOBILE;
        NSString * str3 = HOME_API;
        NSString * string = [str1 stringByAppendingString:str2];
        NSString * urlString = [string stringByAppendingString:str3];
        
        NSURL * url = [NSURL URLWithString:urlString];
        NetworkHandler * networkH = [[NetworkHandler alloc]init];
        
        [networkH getCollectionListWithURL:url competion:^(id list4) {
            self.collectionArr = list4;
            NSLog(@"00000000---%ld",self.collectionArr.count);
            [self.collectionView reloadData];
            
        }];
        //创建集合视图
        UICollectionViewFlowLayout * flowLayout = [[UICollectionViewFlowLayout alloc]init];
        [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];

        self.collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, ((SCREEN_WIDTH-20)/2+50)*2+60*2) collectionViewLayout:flowLayout];
        self.collectionView.delegate = self;
        self.collectionView.dataSource = self;
        
        self.collectionView.bounces = NO;
        self.collectionView.backgroundColor = [UIColor whiteColor];
        [self addSubview:self.collectionView];
        [self.collectionView registerClass:[FavouriteCollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
        [self.collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"ReusableView"];
    }
    return self;
}
- (void)setCollection:(CollectionModel *)collection
{
    if (_collection != collection) {
        _collection = collection;
    }
}
#pragma mark --- collectionView delegate
//设置分区
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
//每个分区上元素的个数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.collectionArr.count;
   
   
}

//设置元素内容
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * identify = @"cell";
    FavouriteCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:identify forIndexPath:indexPath];
    [cell sizeToFit];
    if (!cell) {
        
    }
    self.collection = self.collectionArr[indexPath.row];

    [cell.imgView sd_setImageWithURL:[NSURL URLWithString:self.collection.goods_image] placeholderImage:nil];
        return cell;
}
//点击cell事件
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{

    NSLog(@"选择%ld",indexPath.row);
}

#pragma mark -- UICollectionViewDelegateFlowLayout
//定义每个UICollectionView的大小

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake((SCREEN_WIDTH-20)/2, (SCREEN_WIDTH-20)/2+50);
}
//定义每个UICollectionView的间距
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0, 5, 30, 5);
}
//定义每个UICollectionView的纵向间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 60;
}
#pragma mark -- UICollectionViewDelegate

//返回这个UICollectionView是否可以被选择
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
