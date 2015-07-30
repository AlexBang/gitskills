//
//  GoodsdetailViewController.m
//  Jingbao
//
//  Created by mac on 15/7/15.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "GoodsdetailViewController.h"
#import "AFHTTPRequestOperationManager.h"
#import "AFHTTPSessionManager.h"


#import "Size.h"
#import "GoodsTableViewCell.h"
#import "NetworkHandler.h"
#import "DetailModel.h"
#import "GoodslistModel.h"
#import "TitleViewCell.h"
#import "ChoseViewCell.h"
#import "InfoTableViewCell.h"
#import "UIImageView+WebCache.h"
#import "ImgTableViewCell.h"
#import "ImgscrollerviewController.h"
#import "BuyViewController.h"
#import "ShopModel.h"
#import "SpecModel.h"
#import "Special.h"
#import "SpecialView.h"
#import "HJCAjustNumButton.h"
#import "OrderModel.h"
@interface GoodsdetailViewController ()
@property (nonatomic,strong)UIView * headerV;
@property (nonatomic,assign)int  number;
@property (nonatomic,strong)ShopModel * shop;
@property (nonatomic,strong)SpecModel * spec;
@property (nonatomic,retain)GoodslistModel * goodsModel;
@property (nonatomic,retain)DetailModel * detaiModel;
@property (nonatomic,retain)NSMutableArray * imgUrlArr;
@end

@implementation GoodsdetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBarHidden = YES;
    //搜索框
    UIView * headerV= [[UIView alloc]initWithFrame:CGRectMake(0, 15, SCREEN_WIDTH, SCREEN_HEIGHT*80/1136)];
    self.headerV = headerV;
    headerV.backgroundColor = [UIColor colorWithRed:129.00/255.0 green:203.00/255.0 blue:197.00/255.0 alpha:1.0];
    
    _searchBar = [[UISearchBar alloc]initWithFrame:CGRectMake(80, 0, SCREEN_WIDTH*0.55, SCREEN_HEIGHT/14)];
    _searchBar.backgroundImage = [UIImage imageNamed:@"bj-3.png"];
    
    //返回按钮
    UIButton * backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [backBtn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    backBtn.frame = CGRectMake(15,5,35,35);
    [backBtn setBackgroundImage:[UIImage imageNamed:@"ic_next4.png"] forState:UIControlStateNormal];
    [headerV addSubview:backBtn];
    _searchBar.placeholder = @"搜索珠宝、商铺";
    _searchBar.backgroundColor = [UIColor colorWithRed:50.59/255.0 green:75.80/255.0 blue:69.77/255.0 alpha:1.0];
    [headerV addSubview:_searchBar];
    [self.view addSubview:headerV];
    //创建tabelView
    self.tabelView  = [[UITableView alloc]initWithFrame:CGRectMake(0, SCREEN_HEIGHT*91/1136, SCREEN_WIDTH, SCREEN_HEIGHT-100)style:UITableViewStylePlain];
    self.tabelView.delegate = self;
    self.tabelView.dataSource = self;
    //self.tabelView.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.tabelView];
    self.tabelView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    NetworkHandler * networkH = [[NetworkHandler alloc]init];
    //请求图片
    [networkH getGoodListWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://10.0.0.11/shopnc/mobile/index.php?act=goods&op=goods_detail&goods_id=%@",self.goods_idString ]] withkey:@"goods_image" competion:^(id list) {
        self.imgUrlArr = list;
        [self.tabelView reloadData];
           }];
    
    //请求商品信息
    [networkH getDetailinfoWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://10.0.0.11/shopnc/mobile/index.php?act=goods&op=goods_detail&goods_id=%@",self.goods_idString ]] withkey:@"goods_info" competion:^(id detail) {
        self.detaiModel = detail;
        
        [self.tabelView reloadData];
    }];
    //商铺
    [networkH getStoreinfoWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://10.0.0.11/shopnc/mobile/index.php?act=goods&op=goods_detail&goods_id=%@",self.goods_idString ]] withkey:@"store_info" competion:^(id shop) {
        self.shop = shop;
       
        [self.tabelView reloadData];
    }];
   
   
    //设置底部视图
    [self setbootView];
   
    
    
    
}
//设置底部视图
- (void)setbootView
{
    //底部购买购物车视图
    UIView * bootView = [[UIView alloc]initWithFrame:CGRectMake(0,1056*SCREEN_HEIGHT/1136, SCREEN_WIDTH, 86*SCREEN_HEIGHT/1136)];
    //客服
    UIButton * btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn1 setBackgroundImage:[UIImage imageNamed:@"Sound.png"] forState:UIControlStateNormal];
    btn1.frame = CGRectMake(1, 1, SCREEN_WIDTH*75/640, SCREEN_HEIGHT*80/1136);
    btn1.backgroundColor = [UIColor whiteColor];
    [bootView addSubview:btn1];
    //收藏
    UIButton * btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn2 setBackgroundImage:[UIImage imageNamed:@"icon_like.png"] forState:UIControlStateNormal];
    btn2.frame = CGRectMake(SCREEN_WIDTH*79/640, 1, SCREEN_WIDTH*75/640, SCREEN_HEIGHT*80/1136);
    btn2.backgroundColor = [UIColor whiteColor];
    [bootView addSubview:btn2];
    //店铺
    UIButton * btn3 = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn3 setBackgroundImage:[UIImage imageNamed:@"icon_shop.png"] forState:UIControlStateNormal];
    btn3.frame = CGRectMake(SCREEN_WIDTH*156.5/640, 1, SCREEN_WIDTH*76/640, SCREEN_HEIGHT*80/1136);
    btn3.backgroundColor = [UIColor whiteColor];
    [bootView addSubview:btn3];
    //加入购物车
    UIButton * btn4 = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn4 setBackgroundImage:[UIImage imageNamed:@"icon_jrgwc.png"] forState:UIControlStateNormal];
    btn4.frame = CGRectMake(SCREEN_WIDTH*234/640, 0, SCREEN_WIDTH*215/640, SCREEN_HEIGHT*80/1136);
    [bootView addSubview:btn4];
    //立即购买
    UIButton * btn5 = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn5 setBackgroundImage:[UIImage imageNamed:@"icon_ljgm.png"] forState:UIControlStateNormal];
    [btn5 addTarget:self action:@selector(buy) forControlEvents:UIControlEventTouchUpInside];
    btn5.frame = CGRectMake(SCREEN_WIDTH*425/640, 0, SCREEN_WIDTH*215/640, SCREEN_HEIGHT*80/1136);
    [bootView addSubview:btn5];
    
    //背景颜色
    bootView.backgroundColor = [UIColor lightGrayColor];
    
    [self.view addSubview:bootView];
}


//重写model类
- (void)setDetaiModel:(DetailModel *)detaiModel
{
    if (_detaiModel != detaiModel) {
        _detaiModel = detaiModel;
    }
}
//返回上分类视图
- (void)back
{
    [self.navigationController popViewControllerAnimated:YES];
    
    [self.headerV removeFromSuperview];
    self.navigationController.navigationBarHidden = NO;
    
    
}
//购买
- (void)buy
{
    BuyViewController * buyView = [[BuyViewController alloc]init];
    UINavigationController * nav = [[UINavigationController alloc]initWithRootViewController:buyView];
    nav.navigationBarHidden = YES;
    [self.navigationController presentViewController:nav animated:YES completion:nil];
    
 
}
#pragma mark --- tabel view datasource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        GoodsTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"goodsCell"];
        if (!cell) {
            cell = [[GoodsTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"goodsCell"];
        }
        for (int i = 0 ; i < self.imgUrlArr.count; i++) {
            UIImageView * imgView = [[UIImageView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH*i, 0, SCREEN_WIDTH, 320/1136*SCREEN_HEIGHT)];
            [cell scrollerViewWithimg:self.imgUrlArr];
            
            NSString * string = self.imgUrlArr[i];
            
            imgView.contentMode = UIViewContentModeScaleAspectFill;
            
            [imgView sd_setImageWithURL:[NSURL URLWithString:string] placeholderImage:nil];
            [cell.scrollView addSubview:imgView];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }else if (indexPath.row == 1){
        TitleViewCell * titleCell = [tableView dequeueReusableCellWithIdentifier:@"titleCell"];
        if (!titleCell) {
            titleCell = [[TitleViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"titleCell"];
        }
        titleCell.nameLabel.text = self.detaiModel.goods_name;
        titleCell.priceLabel.text = self.detaiModel.goods_price;
        titleCell.priceLabel1.text = self.detaiModel.goods_marketprice;
        
        titleCell.selectionStyle = UITableViewCellSelectionStyleNone;
        return titleCell;
    }else if (indexPath.row == 2){
        ChoseViewCell * choseCell = [tableView dequeueReusableCellWithIdentifier:@"choseCell"];
        if (!choseCell) {
            choseCell = [[ChoseViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"choseCell"];
        }
        choseCell.selectionStyle = UITableViewCellSelectionStyleNone;
        choseCell.backgroundColor = [UIColor colorWithRed:238.00/255.0 green:238.00/255.0 blue:238.00/255.0 alpha:1.0];
        return choseCell;
    }else if(indexPath.row == 3){
        InfoTableViewCell * infoCell = [tableView dequeueReusableCellWithIdentifier:@"infoCell"];
        if (!infoCell) {
            infoCell = [[InfoTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"infoCell"];
        }
        infoCell.nameLabel.text = self.shop.store_name;
        [infoCell.imgView sd_setImageWithURL:[NSURL URLWithString:self.shop.avatar] placeholderImage:nil];
        
        infoCell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        return infoCell;
    }else
    {
        ImgTableViewCell * imgCell = [tableView dequeueReusableCellWithIdentifier:@"imgCell"];
        if (!imgCell) {
            imgCell = [[ImgTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"imgCell"];
        }
        imgCell.selectionStyle = UITableViewCellSelectionStyleNone;
        return imgCell;
    }
    
    
}

    

    

#pragma mark --- tabel view delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (indexPath.row == 2) {
        
    
        Special * spe = [[Special alloc]init];
        spe.keyArr  = [self.detaiModel.spec_name allKeys];
        spe.valueArr = [self.detaiModel.spec_name allValues];
        NSDictionary * dic = [self.detaiModel.spec_value objectForKey:spe.keyArr[0]];
        
        spe.valueArray = [dic allValues];
   //一块透明幕布
      UIView * view1 = [[UIView alloc]initWithFrame:CGRectMake(0, SCREEN_HEIGHT, SCREEN_WIDTH, 656*SCREEN_HEIGHT/1136)];
    view1.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5];
    
    
    
    
    
    UIView * view = [[UIView alloc]initWithFrame:CGRectMake(0, SCREEN_HEIGHT, SCREEN_WIDTH, 480*SCREEN_HEIGHT/1136)];
    view.backgroundColor = [UIColor whiteColor];
   //动画
    [UIView animateWithDuration:0.5 animations:^{
       view.frame = CGRectMake(0, 656*SCREEN_HEIGHT/1136, SCREEN_WIDTH, 480*SCREEN_HEIGHT/1136);
          view1.frame = CGRectMake(0, 0, SCREEN_WIDTH, 656*SCREEN_HEIGHT/1136);
        [self.view addSubview:view1];
        [self.view addSubview:view];
       
    }];
    //动态添加控件
    for (int i = 0; i < spe.keyArr.count; i ++) {
        UILabel * label = [[UILabel alloc]initWithFrame:CGRectMake(30*SCREEN_WIDTH/640, 165*SCREEN_HEIGHT/1136, SCREEN_WIDTH*150/640, 30*SCREEN_HEIGHT/1136)];
        label.text = spe.valueArr[i];
        
        [view addSubview:label];
    }
    for (int i = 0; i < spe.valueArray.count; i++) {
        UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
        
        btn.frame = CGRectMake(90*i+45*SCREEN_WIDTH/640, 220*SCREEN_HEIGHT/1136, 100*SCREEN_WIDTH/640, 40*SCREEN_HEIGHT/1136);
        btn.tag = 100+i;
        [btn setTitle:spe.valueArray[i] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(clicked:) forControlEvents:UIControlEventTouchUpInside];
        //设置btn颜色
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [btn.layer setBorderWidth:1.0];
        CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
        CGColorRef colorref = CGColorCreate(colorSpace,(CGFloat[]){ 0, 0, 0, 0.5 });
        [btn.layer setBorderColor:colorref];
        [btn.layer setCornerRadius:5.0];
        
        
        [view addSubview:btn];
    }
    
    
    //数量选择
    UILabel * num = [[UILabel alloc]initWithFrame:CGRectMake(30*SCREEN_WIDTH/640, 330*SCREEN_HEIGHT/1136, SCREEN_WIDTH*600/640, 20)];
    num.text = @"数量选择";
    [view addSubview:num];
    // 创建对象
    HJCAjustNumButton *btn1 = [[HJCAjustNumButton alloc] init];
    
    
    btn1.frame = CGRectMake(SCREEN_WIDTH * 440/640, SCREEN_HEIGHT * 320/1136, SCREEN_WIDTH * 120/640, SCREEN_HEIGHT*40/1136);
    
    // 内容更改的block回调 （这个是第三方）
    btn1.callBack = ^(NSString *currentNum){
        //self.number = currentNum;
        
        
    };
    
    // 加到父控件上
    [view addSubview:btn1];
    //立即购买
    UIButton * buy = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [buy setBackgroundImage:[UIImage imageNamed:@"Buy.png"] forState:UIControlStateNormal];
    buy.frame = CGRectMake(0, 380*SCREEN_HEIGHT/1136, SCREEN_WIDTH, 100*SCREEN_HEIGHT/1136);
    [buy addTarget:self action:@selector(gofor) forControlEvents:UIControlEventTouchUpInside];
    
    [view addSubview:buy];
    }
    
}


//购买按钮
- (void)gofor

{
    BuyViewController * buyView = [[BuyViewController alloc]init];
    UINavigationController * nav = [[UINavigationController alloc]initWithRootViewController:buyView];
    nav.navigationBarHidden = YES;
    [self.navigationController presentViewController:nav animated:YES completion:nil];
    
}

- (void)clicked:(UIButton *)sender
{
    //设置当点击每个btn是的颜色
    Special * spe = [[Special alloc]init];
    spe.keyArr  = [self.detaiModel.spec_name allKeys];
    spe.valueArr = [self.detaiModel.spec_name allValues];
    NSDictionary * dic = [self.detaiModel.spec_value objectForKey:spe.keyArr[0]];
    
    spe.valueArray = [dic allValues];
    for (int i = 0; i < spe.valueArray.count; i++) {
        UIButton * btn = (UIButton *)[self.view viewWithTag:100+i];
        btn.backgroundColor = [UIColor whiteColor];
        switch (sender.tag) {
            case 100:
                sender.backgroundColor = [UIColor redColor];
                break;
                case 101:
                sender.backgroundColor = [UIColor redColor];
                case 102:
                sender.backgroundColor = [UIColor redColor];
                
            default:
                break;
        }
    }
   
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        return SCREEN_HEIGHT*320/1136;
    }else if (indexPath.row == 1)
    {
        return SCREEN_HEIGHT*160/1136;
    }else if (indexPath.row == 2)
    {
        return SCREEN_HEIGHT*110/1136;
    }else if(indexPath.row)
    {
        return SCREEN_HEIGHT*170/1136;
    }else
    {
        return SCREEN_HEIGHT*170/1136;
    }
    
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
