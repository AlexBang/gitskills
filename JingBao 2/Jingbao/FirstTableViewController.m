//
//  FirstTableViewController.m
//  Jingbao
//
//  Created by mac on 15/7/8.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "FirstTableViewController.h"
#import "Size.h"
#import "First.h"
#import "Home2Model.h"
#import "Home3Model.h"
#import "CollectionModel.h"
#import "LogoTableViewCell.h"
#import "ScrollerViewCell.h"
#import "ButtonTableViewCell.h"
#import "BrandTableViewCell.h"
#import "HeaderTableViewCell.h"
#import "FavoureTableViewCell.h"
#import "SpecialsellTableViewCell.h"
#import "InvestTableViewCell.h"
#import "FinanceTableViewCell.h"
#import "LogoView.h"
#import "NetworkHandler.h"
#import "Header.h"
#import "UIImageView+WebCache.h"
#import "FavouriteCollectionViewCell.h"
#import "GoodsdetailViewController.h"

@interface FirstTableViewController ()
@property (nonatomic,strong)UIScrollView * scrollView;
@property (nonatomic,strong)UIPageControl * pageControl;
@property (nonatomic,strong)NSMutableArray * firstArr;
@property (nonatomic,strong)NSMutableArray * foureArr;
@property (nonatomic,strong)NSMutableArray * thirdArr;
@property (nonatomic,strong)NSMutableArray * collectionArr;
@property (nonatomic,strong)NSTimer * timer;
@end

@implementation FirstTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    NSString * str1 = HOSTS;
    NSString * str2 = MOBILE;
    NSString * str3 = HOME_API;
    NSString * string = [str1 stringByAppendingString:str2];
    NSString * urlString = [string stringByAppendingString:str3];
    NSLog(@"%@",urlString);
    NSURL * url = [NSURL URLWithString:urlString];
    NetworkHandler * networkH = [[NetworkHandler alloc]init];
    [networkH getFirstListWithURL:url competion:^(id list) {
        self.firstArr = list;
        [self.tableView reloadData];
    }];
    [networkH getHome3ListWithURL:url competion:^(id list3) {
        self.foureArr = list3;
        [self.tableView reloadData];
    }];
    
    [networkH getHome2ListWithURL:url competion:^(id list2) {
        self.thirdArr = list2;
        [self.tableView reloadData];
    }];
    [networkH getCollectionListWithURL:url competion:^(id list4) {
        self.collectionArr = list4;
        [self.tableView reloadData];
        
    }];
    
}

- (void)setFirst:(First *)first
{
    if (_first!= first) {
        _first = first;
    }
}
- (void)setHome3:(Home3Model *)home3
{
    if (_home3 != home3) {
        _home3 = home3;
    }
}
- (void)setHome2:(Home2Model *)home2
{
    if (_home2 != home2) {
        _home2 = home2;
    }
}
- (void)setCollection:(CollectionModel *)collection
{
    if (_collection != collection) {
        _collection = collection;
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    // Return the number of rows in the section.
    return 6;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

     if (indexPath.row == 0){
        ScrollerViewCell * scrollerCell = [tableView dequeueReusableCellWithIdentifier:@"scrollerCell"];
        if (!scrollerCell) {
            scrollerCell = [[ScrollerViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"scrollerCell"];
            
            }
         
         
         [scrollerCell scrollerViewWithimg:self.firstArr];
         for (int i = 0 ; i < self.firstArr.count; i++) {
             UIImageView * imgView = [[UIImageView alloc]initWithFrame:CGRectMake(i*SCREEN_WIDTH, 0, SCREEN_WIDTH, SCREEN_HEIGHT/4)];
             self.first = [self.firstArr objectAtIndex:i];
             
             imgView.contentMode = UIViewContentModeScaleAspectFill;
             [imgView sd_setImageWithURL:[NSURL URLWithString:self.first.image] placeholderImage:nil];
             [scrollerCell.scrollView addSubview:imgView];
         }
        
        scrollerCell.selectionStyle = UITableViewCellSelectionStyleNone;
        return scrollerCell;
    }else if (indexPath.row == 1){
        ButtonTableViewCell * btnCell = [tableView dequeueReusableCellWithIdentifier:@"btnCell"];
        if (!btnCell) {
            btnCell = [[ButtonTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"btnCell"];
        }
        btnCell.selectionStyle = UITableViewCellSelectionStyleNone;
        return btnCell;
    }else if (indexPath.row == 2){
        HeaderTableViewCell * headerCell = [tableView dequeueReusableCellWithIdentifier:@"brandCell"];
        if (!headerCell) {
            headerCell = [[HeaderTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"brandCell"];
            
        }
        
        self.home3 = self.foureArr[8];
        [headerCell.imgView1 sd_setImageWithURL:[NSURL URLWithString:self.home3.image] placeholderImage:nil];
        self.home3 = self.foureArr[9];
        [headerCell.imgView2 sd_setImageWithURL:[NSURL URLWithString:self.home3.image] placeholderImage:nil];
        self.home3 = self.foureArr[10];
        [headerCell.imgView3 sd_setImageWithURL:[NSURL URLWithString:self.home3.image] placeholderImage:nil];
        self.home3 = self.foureArr[11];
        [headerCell.imgView4 sd_setImageWithURL:[NSURL URLWithString:self.home3.image] placeholderImage:nil];
        
        headerCell.selectionStyle = UITableViewCellSelectionStyleNone;
        return headerCell;
    }else if (indexPath.row == 3){
        BrandTableViewCell * brandCell = [tableView dequeueReusableCellWithIdentifier:@"brandCell"];
        if (!brandCell) {
            brandCell = [[BrandTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"brandCell"];
            
        }
        
        self.home2 = [self.thirdArr objectAtIndex:indexPath.row];
        //NSLog(@"%@",self.home2.rectangle1_image);
        [brandCell.imgView1 sd_setImageWithURL:[NSURL URLWithString:self.home2.square_image] placeholderImage:nil];
        [brandCell.imgView2 sd_setImageWithURL:[NSURL URLWithString:self.home2.rectangle1_image] placeholderImage:nil];
        [brandCell.imgView3 sd_setImageWithURL:[NSURL URLWithString:self.home2.rectangle2_image] placeholderImage:nil];
        brandCell.selectionStyle = UITableViewCellSelectionStyleNone;
        return brandCell;
    }else if (indexPath.row == 4){
        SpecialsellTableViewCell * specialCell = [tableView dequeueReusableCellWithIdentifier:@"specialCell"];
        if (specialCell == nil) {
            specialCell = [[SpecialsellTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"specialCell"];
        }
        
        self.home2 = [self.thirdArr objectAtIndex:indexPath.row];
        [specialCell.imgView1 sd_setImageWithURL:[NSURL URLWithString:self.home2.square_image] placeholderImage:nil];
        [specialCell.imgView2 sd_setImageWithURL:[NSURL URLWithString:self.home2.rectangle1_image] placeholderImage:nil];
        [specialCell.imgView3 sd_setImageWithURL:[NSURL URLWithString:self.home2.rectangle2_image] placeholderImage:nil];
        specialCell.selectionStyle =UITableViewCellSelectionStyleNone;
        return specialCell;
    }else{
        FavoureTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
        if (!cell) {
            cell = [[FavoureTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        }
        cell.collectionView.delegate = self;
        cell.collectionView.dataSource = self;
 
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;

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
    cell.nameLable.text = self.collection.goods_name;
    cell.priceLabel.text = self.collection.goods_promotion_price;
    return cell;
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

//点击cell事件
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    GoodsdetailViewController * goodsDetailVC = [[GoodsdetailViewController alloc]init];
    self.collection = self.collectionArr[indexPath.row];
    
    goodsDetailVC.goods_idString = [NSString stringWithFormat:@"%ld",self.collection.goods_id];

    
  
    
    //这里的bar隐藏顺序是这样的 写错了顺序隐藏不了，我也不知道为什么（待定 暂时这么写吧）
    self.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:goodsDetailVC animated:YES];
    
    
    self.navigationController.navigationBarHidden = YES;
    
    self.hidesBottomBarWhenPushed = NO;
    
   
}

#pragma mark ---- tabel view delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{

     if (indexPath.row == 0)
    {
        return SCREEN_HEIGHT/4;
    }else if (indexPath.row == 1) {
        return SCREEN_HEIGHT/4;
    }else if (indexPath.row == 2){
        return SCREEN_HEIGHT/2.8;
    }else if (indexPath.row == 3 ){
        return SCREEN_HEIGHT/2.9;
        
    }else if (indexPath.row == 4){
        
        return SCREEN_HEIGHT/3;
    }else
    {
        return (60+((SCREEN_WIDTH-20)/2+50))*self.collectionArr.count/2;
    }
    
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    LogoView * logo = [[LogoView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT/10)];
    return logo;
    
    
   
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return SCREEN_HEIGHT/11;
}




/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
