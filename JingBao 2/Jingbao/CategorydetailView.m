//
//  CategorydetailView.m
//  Jingbao
//
//  Created by mac on 15/7/13.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "CategorydetailView.h"
#import "CategoryViewController.h"
#import "Size.h"
#import "DetailTableCell.h"
#import "NetworkHandler.h"
#import "UIImageView+WebCache.h"
#import "MLKMenuPopover.h"
@interface CategorydetailView ()<MLKMenuPopoverDelegate>
@property (nonatomic,retain)NSMutableArray * goodslistArr;
@property(nonatomic,strong) MLKMenuPopover *menuPopover;
@property(nonatomic,strong) NSArray *menuItems;
@property (nonatomic,strong)UIButton * btn1;
@end

@implementation CategorydetailView

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationController.navigationBarHidden = YES;
    self.hidesBottomBarWhenPushed = YES;

    //搜索框
    UIView * headerV= [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT*120/1136)];
    headerV.backgroundColor = [UIColor colorWithRed:129.00/255.0 green:203.00/255.0 blue:197.00/255.0 alpha:1.0];
    
    _searchBar = [[UISearchBar alloc]initWithFrame:CGRectMake(80, 10, SCREEN_WIDTH*0.75, SCREEN_HEIGHT/14)];
    _searchBar.backgroundImage = [UIImage imageNamed:@"bj-3.png"];
    //_searchBar.tintColor = [UIColor colorWithRed:129.00/255.0 green:203.00/255.0 blue:197.00/255.0 alpha:1.0];
    //返回按钮
    UIButton * backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [backBtn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    backBtn.frame = CGRectMake(15, 10, 55, 55);
    [backBtn setBackgroundImage:[UIImage imageNamed:@"ic_next4.png"] forState:UIControlStateNormal];
    [headerV addSubview:backBtn];
    _searchBar.placeholder = @"搜索珠宝、商铺";
    _searchBar.backgroundColor = [UIColor colorWithRed:50.59/255.0 green:75.80/255.0 blue:69.77/255.0 alpha:1.0];
    [headerV addSubview:_searchBar];
    [self.view addSubview:headerV];
    //综合
    UIButton * btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn1.frame = CGRectMake(0, SCREEN_HEIGHT*120/1136, SCREEN_WIDTH*160/640, SCREEN_HEIGHT*70/1136);
    self.btn1 = btn1;
    btn1.tag = 100;
    [btn1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn1 addTarget:self action:@selector(clicked) forControlEvents:UIControlEventTouchUpInside];
    [btn1 setTitle:@"综合" forState:UIControlStateNormal];
    [self.view addSubview:btn1];
     
    //销量
    for (int i = 1; i < 4; i++) {
        
    
    UILabel * label = [[UILabel alloc]initWithFrame:CGRectMake(SCREEN_WIDTH*160/640*i, SCREEN_HEIGHT*140/1136, 2, SCREEN_HEIGHT * 30/1136)];
        label.backgroundColor = [UIColor lightGrayColor];
        [self.view addSubview:label];
    }
    UIButton * btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn2.frame = CGRectMake(SCREEN_WIDTH*160/640, SCREEN_HEIGHT*120/1136, SCREEN_WIDTH*160/640, SCREEN_HEIGHT*70/1136);
    [btn2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn2 addTarget:self action:@selector(clicked2) forControlEvents:UIControlEventTouchDown];
    [btn2 setTitle:@"销量" forState:UIControlStateNormal];
    [self.view addSubview:btn2];
   
    UIButton * btn3 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn3.frame = CGRectMake(SCREEN_WIDTH*320/640, SCREEN_HEIGHT*120/1136, SCREEN_WIDTH*160/640, SCREEN_HEIGHT*70/1136);
    [btn3 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn3 addTarget:self action:@selector(clicked3) forControlEvents:UIControlEventTouchUpInside];
    [btn3 setTitle:@"价格" forState:UIControlStateNormal];
    [self.view addSubview:btn3];
    
    
    UIButton * btn4 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn4.frame = CGRectMake(SCREEN_WIDTH*480/640, SCREEN_HEIGHT*120/1136, SCREEN_WIDTH*160/640, SCREEN_HEIGHT*70/1136);
    [btn4 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn4 addTarget:self action:@selector(clicked4) forControlEvents:UIControlEventTouchUpInside];
    [btn4 setTitle:@"筛选" forState:UIControlStateNormal];
    [self.view addSubview:btn4];
    
    
    
    _tabelView = [[UITableView alloc]initWithFrame:CGRectMake(0, SCREEN_HEIGHT * 190/1136, SCREEN_WIDTH, SCREEN_HEIGHT-SCREEN_HEIGHT * 190/1136)];
    self.tabelView.delegate = self;
    self.tabelView.dataSource = self;
     
    //self.tabelView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_tabelView];
    
    //请求商品列表数据,调用网络请求方法
    
    NetworkHandler * networkH = [[NetworkHandler alloc]init];
    [networkH getGoodListWithURL:[NSURL URLWithString:self.urlString] competion:^(id list) {
        self.goodslistArr = list;
        [self.tabelView reloadData];
    }];
    
}
//重写set方法
- (void)setGoodslist:(GoodslistModel *)goodslist{
    if (_goodslist != goodslist) {
        _goodslist = goodslist;
    }
}
- (void)clicked
{
    

    self.menuPopover = [[MLKMenuPopover alloc] initWithFrame:CGRectMake(0, SCREEN_HEIGHT * 190/1136, SCREEN_WIDTH, SCREEN_HEIGHT/5)];
        self.menuPopover.menuPopoverDelegate = self;
        [self.view addSubview:self.menuPopover];
    UIButton * btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn1.frame = CGRectMake(0, SCREEN_HEIGHT*120/1136, SCREEN_WIDTH*160/640, SCREEN_HEIGHT*70/1136);
    self.btn1 = btn1;
    btn1.tag = 100;
    [btn1 setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [btn1 addTarget:self action:@selector(cancle) forControlEvents:UIControlEventTouchUpInside];
    [btn1 setTitle:@"综合" forState:UIControlStateNormal];
    [self.btn1 removeFromSuperview];
    [self.view addSubview:btn1];
    
}
- (void)clicked2
{
    
}
- (void)clicked3
{
    
}
- (void)clicked4
{
    
}
- (void)cancle
{
    [self.menuPopover removeFromSuperview];
    [self layoutButton];
}
#pragma mark -
#pragma mark MLKMenuPopoverDelegate
- (void)layoutButton
{
    UIButton * btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn1.frame = CGRectMake(0, SCREEN_HEIGHT*120/1136, SCREEN_WIDTH*160/640, SCREEN_HEIGHT*70/1136);
    [btn1 setBackgroundImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
    [self.btn1 removeFromSuperview];
    [btn1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn1 addTarget:self action:@selector(clicked) forControlEvents:UIControlEventTouchUpInside];
    [btn1 setTitle:@"综合" forState:UIControlStateNormal];
    [self.view addSubview:btn1];

}

- (void)back
{
    [self.navigationController popViewControllerAnimated:YES];
     self.navigationController.navigationBarHidden = YES;
    
    
}




#pragma mark --- tabel view delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.goodslistArr.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    
    DetailTableCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[DetailTableCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    self.goodslist = self.goodslistArr[indexPath.row];
    [cell.imgView sd_setImageWithURL:[NSURL URLWithString:self.goodslist.goods_image_url] placeholderImage:nil];
    cell.nameLabel.text = self.goodslist.goods_name;
    cell.priceLabel.text = self.goodslist.goods_price;
    cell.evaluation_good_starLabel.text = [NSString stringWithFormat:@"好评%@",self.goodslist.evaluation_good_star];
    cell.goods_salenumLabel.text = [NSString stringWithFormat:@"%@人付款",self.goodslist.goods_salenum];
        return cell;
}
#pragma mark ---tabel view datasource
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return SCREEN_HEIGHT * 190/1136;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [UIView animateWithDuration:0.5 animations:^{
        self.menuPopover.frame = CGRectMake(0, SCREEN_HEIGHT * 190/1136, SCREEN_WIDTH, 0);
    } completion:^(BOOL finished) {
        
        [self.menuPopover removeFromSuperview];
    }];
    
    GoodsdetailViewController * goodsDetailVC = [[GoodsdetailViewController alloc]init];
    [self.navigationController pushViewController:goodsDetailVC animated:YES];
    self.goodslist = self.goodslistArr[indexPath.row];
   goodsDetailVC.goods_idString = [NSString stringWithFormat:@"%ld",self.goodslist.goods_id];
   
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 2;
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
