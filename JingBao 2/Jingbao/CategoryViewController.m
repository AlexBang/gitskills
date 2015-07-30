//
//  CategoryViewController.m
//  Jingbao
//
//  Created by mac on 15/7/11.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "CategoryViewController.h"
#import "Size.h"
#import "CategoryViewCell.h"
#import "Header.h"
#import "NetworkHandler.h"
#import "CategoryModel.h"
#import "CategorydetailView.h"
#import "UIImageView+WebCache.h"

@interface CategoryViewController ()
@property (nonatomic,retain)NSMutableArray * categoryArr;//分类数组
@property (nonatomic,retain)NSMutableArray * categoryArray;//商品列表数组
- (void)showViewControllerWithString:(NSString*)gc_id;
@end

@implementation CategoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString * str1 = HOSTS;
    NSString * str2 = MOBILE;
    NSString * str3 = CATEGORY_API;
    NSString * string = [str1 stringByAppendingString:str2];
    NSString * urlString = [string stringByAppendingString:str3];
    
    NSURL * url1 = [NSURL URLWithString:urlString];
    NetworkHandler * networkH = [[NetworkHandler alloc]init];
    [networkH getCAtegoryListWithURL:url1 competion:^(id list5) {
        self.categoryArr = list5;
        NSLog(@"%ld",self.categoryArr.count);
        [self.categorytabelView reloadData];
    }];
    self.navigationController.navigationBar.hidden = YES;
        //搜索框
    _searchBar = [[UISearchBar alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/3, 15, SCREEN_WIDTH*0.68, 40)];
    
    [_searchBar setBackgroundColor:[UIColor colorWithRed:129.00/255.0 green:203.00/255.0 blue:197.00/255.0 alpha:1.0]];
    _searchBar.backgroundImage = [UIImage imageNamed:@"bj-3.png"];
    UIView * headerV= [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 60)];
    headerV.backgroundColor = [UIColor colorWithRed:129.00/255.0 green:203.00/255.0 blue:197.00/255.0 alpha:1.0];
    
    UIImageView * imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 15, SCREEN_WIDTH, SCREEN_HEIGHT/14)];
    imageView.image = [UIImage imageNamed:@"img_LOGO.png"];
    [headerV addSubview:imageView];
    
    [headerV addSubview:_searchBar];
    
    [self.view addSubview:headerV];
    self.categorytabelView = [[UITableView alloc]initWithFrame:CGRectMake(0, SCREEN_HEIGHT/9, SCREEN_HEIGHT/8, SCREEN_HEIGHT-150) style:UITableViewStylePlain];
    
    self.categorytabelView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    self.categorytabelView.showsVerticalScrollIndicator = NO;
    self.categorytabelView.delegate = self;
    self.categorytabelView.dataSource = self;
    ;
    
    [self.view addSubview:self.categorytabelView];
    //从一开始加载页面就加载视图
    NSString * Str1 = HOSTS;
    NSString * Str2 = MOBILE;
    NSString * Str3 = CATEGORY_LIST;
    NSString * String = [Str1 stringByAppendingString:Str2];
    NSString * String1 = [String stringByAppendingString:Str3];
    NSString * urlString2 = [NSString stringWithFormat:@"%@1",String1];
    NSLog(@"%@",urlString2);
    //调用显示页面的方法，把第一个视图的URLstring传进去
    
    [self showViewControllerWithString:urlString2];
   
    
    //创建集合视图
    
    UICollectionViewFlowLayout * flowLayout = [[UICollectionViewFlowLayout alloc]init];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    
    flowLayout.minimumInteritemSpacing = 5;
    flowLayout.minimumLineSpacing = 10;
    self.categoryCollection = [[UICollectionView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/5, SCREEN_HEIGHT/9, 6.5*SCREEN_WIDTH/8, SCREEN_HEIGHT) collectionViewLayout:flowLayout];
    //self.categoryCollection.contentSize = CGSizeMake(6.5*SCREEN_WIDTH/8, 40*self.categoryArray.count/2+40);
    self.categoryCollection.bounces = NO;
    self.categoryCollection.delegate = self;
    self.categoryCollection.dataSource = self;
    self.categoryCollection.backgroundColor = [UIColor whiteColor];
        [self.categoryCollection registerClass:[CategoryViewCell class] forCellWithReuseIdentifier:@"cell"];
     [self.categoryCollection registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"ReusableView"];
    
    [self.view addSubview:self.categoryCollection];
   
    
}
//重写model方法
- (void)setCategoryModel:(CategoryModel *)categoryModel
{
    if (_categoryModel != categoryModel) {
        _categoryModel = categoryModel;
    }
    
}
//取数据展示分类列表信息
- (void)showViewControllerWithString:(NSString*)gc_id;
{
    NSString * str1 = HOSTS;
    NSString * str2 = MOBILE;
    NSString * str3 = CATEGORY_LIST;
    NSString * string = [str1 stringByAppendingString:str2];
    NSString * string1 = [string stringByAppendingString:str3];
    NSString * urlString = [NSString stringWithFormat:@"%@%@",string1,gc_id];
    NetworkHandler * networkH = [[NetworkHandler alloc]init];
    [networkH getCAtegoryListWithURL:[NSURL URLWithString:urlString] competion:^(id list) {
        self.categoryArray = list;
        [self.categoryCollection reloadData];
    }];
    
    NSLog(@"%@",urlString);
   
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
    return self.categoryArray.count;
    
    
}

//设置元素内容
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * identify = @"cell";
    CategoryViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:identify forIndexPath:indexPath];
    [cell sizeToFit];
    if (!cell) {
        
    }
    
    self.categoryModel = self.categoryArray[indexPath.row];
    [cell.imgView sd_setImageWithURL:[NSURL URLWithString:self.categoryModel.pic] placeholderImage:nil];
    cell.nameLable.text = self.categoryModel.gc_name;
    cell.priceLabel.text = self.categoryModel.gc_id;
   
    return cell;
}
//点击cell事件
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    CategorydetailView * detailView = [[CategorydetailView alloc]init];
    self.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:detailView animated:YES];
     self.hidesBottomBarWhenPushed = NO;
    NSString * str1 = HOSTS;
    NSString * str2 = MOBILE;
    NSString * str3 = CATE_API;
    //拼接字符串属性传值传过去
    NSString * string = [str1 stringByAppendingString:str2];
    detailView.urlString = [string stringByAppendingString:str3];
    NSLog(@"%@",detailView.urlString);
    
    
}

#pragma mark -- UICollectionViewDelegateFlowLayout
//定义每个UICollectionView的大小

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake((SCREEN_WIDTH-15)/3.8, (SCREEN_WIDTH-15)/3.8);
}
//定义每个UICollectionView的间距
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0,5,5,5);
}
//定义每个UICollectionView的纵向间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 40;
}
#pragma mark -- UICollectionViewDelegate

//返回这个UICollectionView是否可以被选择
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}

#pragma mark --- tabel view delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.categoryArr.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        
    }
     cell.textLabel.font = [UIFont fontWithName:nil size:13];
    self.categoryModel = [self.categoryArr objectAtIndex:indexPath.section];
    cell.textLabel.text = self.categoryModel.gc_name;

    //设置字体的颜色
    cell.selectedBackgroundView = [[UIView alloc] initWithFrame:cell.frame];
    cell.selectedBackgroundView.backgroundColor = [UIColor whiteColor];
    cell.selectionStyle = UITableViewCellSelectionStyleDefault;
    
    cell.textLabel.highlightedTextColor = [UIColor redColor];
    
    
    
    return cell;
}
#pragma mark ---tabel view datasource
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 2;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.categoryModel = [self.categoryArr objectAtIndex:indexPath.section];
    [self showViewControllerWithString:self.categoryModel.gc_id];
    NSLog(@"======%@",self.categoryModel.gc_id);
    
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
