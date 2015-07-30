//
//  BuyViewController.m
//  Jingbao
//
//  Created by mac on 15/7/21.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "BuyViewController.h"
#import "Size.h"
#import "UserinfoCell.h"
#import "GoodsCell.h"
#import "ExpressCell.h"
#import "BillCell.h"
#import "NetworkHandler.h"
#import "OrderModel.h"
#import "AFHTTPRequestOperationManager.h"
#import "AFHTTPSessionManager.h"
#import "UIImageView+WebCache.h"
#import "PayViewController.h"
#import "InvoiceViewController.h"
#import "AddresViewController.h"
@interface BuyViewController  ()
@property (nonatomic,strong)UIView * headerV;
@property (nonatomic,strong)OrderModel * order;
@property (nonatomic,strong)UITableView * tabelView;
@property (nonatomic,strong)UILabel * priceLabel;


@end


@implementation BuyViewController
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        
        
        
        
        self.view.backgroundColor = [UIColor colorWithRed:238.00/255.0 green:238.00/255.0 blue:238.00/255.0 alpha:1.0];
        UIView * headerV= [[UIView alloc]initWithFrame:CGRectMake(0, 15, SCREEN_WIDTH, SCREEN_HEIGHT*80/1136)];
        self.headerV = headerV;
        headerV.backgroundColor = [UIColor colorWithRed:129.00/255.0 green:203.00/255.0 blue:197.00/255.0 alpha:1.0];
        
        UILabel * titleView = [[UILabel alloc]initWithFrame:CGRectMake(290*SCREEN_WIDTH/640, 15, SCREEN_WIDTH*150/640, 30*SCREEN_HEIGHT/1136)];
        titleView.text = @"确认下单";
        titleView.font = [UIFont boldSystemFontOfSize:17];
        titleView.textColor = [UIColor whiteColor];
        [headerV addSubview:titleView];
        
        //返回按钮
        UIButton * backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [backBtn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
        backBtn.frame = CGRectMake(15,0,45,45);
        [backBtn setBackgroundImage:[UIImage imageNamed:@"ic_next4.png"] forState:UIControlStateNormal];
        [headerV addSubview:backBtn];
        
        [self.view addSubview:headerV];
        
        
        
        
        
        
    }
    return self;
}


- (void)back
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void)viewWillAppear:(BOOL)animated
{
    
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationController.navigationBarHidden = YES;
    NSString *key = [[NSUserDefaults standardUserDefaults]objectForKey:@"keyString"];
    
    
    NSString * card_idStr = @"100047|1";
    
    NSDictionary * parameters = @{@"key":key, @"cart_id":card_idStr,@"ifcart":@"0"};
    NSString * urlString = [NSString stringWithFormat:@"http://10.0.0.11/shopnc/mobile/index.php?act=member_buy&op=buy_step1&key=%@&cart_id=%@&ifcart=0",key,card_idStr];
    NSLog(@"Urlstring = %@",urlString);
    
    
    AFHTTPRequestOperationManager * manager = [AFHTTPRequestOperationManager manager];
    [NSSet setWithObject:@"text/html"];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager POST:@"http://10.0.0.11/shopnc/mobile/index.php?act=member_buy&op=buy_step1" parameters:parameters
          success:^(AFHTTPRequestOperation *operation,id responseObject) {
              
              //多线程
              dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
                  
                  //请求成功获得data再数据请求得到店铺信息
                  NSMutableURLRequest * req = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:urlString]];
                  [NSURLConnection sendAsynchronousRequest:req queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
                      NSMutableArray * orderArr = [[NSMutableArray alloc]init];
                      NSDictionary * dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
                      NSDictionary * dic1 = dic[@"datas"];
                      NSDictionary * dic2 = dic1[@"store_cart_list"];
                      NSArray * arr = [dic2 allValues];
                      
                      for (NSDictionary * orderDic in arr) {
                          NSArray * arr1 = orderDic[@"goods_list"];
                          for (NSDictionary * goodsDic in arr1) {
                              self.order= [[OrderModel alloc]init];
                              
                              
                              [self.order setValuesForKeysWithDictionary:goodsDic];
                              
                              [orderArr addObject:self.order];
                              
                              
                          }
                          
                      }
                      dispatch_async(dispatch_get_main_queue(), ^{
                          //创建tabelView
                          
                          self.tabelView  = [[UITableView alloc]initWithFrame:CGRectMake(0, SCREEN_HEIGHT*100/1136, SCREEN_WIDTH, SCREEN_HEIGHT-380)style:UITableViewStylePlain];
                          self.tabelView.delegate = self;
                          self.tabelView.dataSource = self;
                          self.tabelView.scrollEnabled = NO;
                          
                          [self.view addSubview:self.tabelView];
                          
                      });
                  }];
              });
              
              
          }failure:^(AFHTTPRequestOperation *operation,NSError *error) {
              NSLog(@"Error: %@", error);
          }];
    self.view.backgroundColor = [UIColor colorWithRed:238.00/255.0 green:238.00/255.0 blue:238.00/255.0 alpha:1.0];
    
    
    UIImageView * imgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 1050*SCREEN_HEIGHT/1136, 425*SCREEN_WIDTH/640, 86*SCREEN_HEIGHT/1136)];
    
    UILabel * label = [[UILabel alloc]initWithFrame:CGRectMake(40*SCREEN_WIDTH/640, 31*SCREEN_HEIGHT/1136, SCREEN_WIDTH*100/640, 24*SCREEN_HEIGHT/1136)];
    label.text = @"合计：";
    
    [imgView addSubview:label];
    //价格
    _priceLabel = [[UILabel alloc]initWithFrame:CGRectMake(160*SCREEN_WIDTH/640, 31*SCREEN_HEIGHT/1136, SCREEN_WIDTH*160/640, 24*SCREEN_HEIGHT/1136)];
    _priceLabel.text = @"110.00";
    [imgView addSubview:_priceLabel];
    
    //提交订单
    UIButton * btn5 = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn5 setBackgroundImage:[UIImage imageNamed:@"Assistor.png"] forState:UIControlStateNormal];
    [btn5 addTarget:self action:@selector(refer) forControlEvents:UIControlEventTouchUpInside];
    btn5.frame = CGRectMake(SCREEN_WIDTH*425/640, 1050*SCREEN_HEIGHT/1136, SCREEN_WIDTH*215/640, SCREEN_HEIGHT*86/1136);
    [self.view addSubview:btn5];
    
    //符号
    UILabel * label3 = [[UILabel alloc]initWithFrame:CGRectMake(SCREEN_WIDTH * 130/640, SCREEN_HEIGHT * 33/1136, SCREEN_WIDTH * 30/640, SCREEN_HEIGHT*24/1136)];
    
    label3.text = @"￥";
    
    [imgView addSubview:label3];
    imgView.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:imgView];
    
    
    
    
    
}
- (void)refer
{
    PayViewController * payView = [[PayViewController alloc]init];
    [self.navigationController pushViewController:payView animated:YES];
    NSLog(@"!!!!!!");
}

//重写model
- (void)setOrder:(OrderModel *)order
{
    if (_order!=order)
    {
        _order = order;
    }
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        UserinfoCell * infoCell = [tableView dequeueReusableCellWithIdentifier:@"infoCell"];
        if (!infoCell) {
            infoCell = [[UserinfoCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"infoCell"];
        }
        
        
        
        infoCell.selectionStyle = UITableViewCellSelectionStyleNone;
        return infoCell;
    }else if (indexPath.row == 1){
        GoodsCell * goodCell = [tableView dequeueReusableCellWithIdentifier:@"goodCell"];
        if (!goodCell) {
            goodCell = [[GoodsCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"goodCell"];
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            [goodCell.imgView1 sd_setImageWithURL:[NSURL URLWithString:self.order.goods_image_url] placeholderImage:nil];
            NSLog(@"呵呵====111%@",self.order.goods_image_url);
            
            goodCell.descripeLabel.text = self.order.goods_name;
            goodCell.priceLabel.text = self.order.goods_price;
            
        });
        goodCell.selectionStyle = UITableViewCellSelectionStyleNone;
        return goodCell;
    }else if (indexPath.row == 2)
    {
        ExpressCell * expressCell = [tableView dequeueReusableCellWithIdentifier:@"exCell"];
        if (!expressCell) {
            expressCell = [[ExpressCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"exCell"];
        }
        expressCell.selectionStyle = UITableViewCellSelectionStyleNone;
        return expressCell;
    }else
    {
        BillCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
        if (!cell) {
            cell = [[BillCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row) {
        case 0:
            return 160*SCREEN_HEIGHT/1136;
            break;
        case 1:
            return 190*SCREEN_HEIGHT/1136;
            break;
        case 2:
            return 70*SCREEN_HEIGHT/1136;
            break;
        case 3:
            return 70*SCREEN_HEIGHT/1136;
            break;
        default:
            return 0;
            break;
    }
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (indexPath.row == 0) {
        AddresViewController * addV = [[AddresViewController alloc]init];
        [self.navigationController pushViewController:addV animated:YES];
        
        
    }else if (indexPath.row == 3)
    {
        
        InvoiceViewController * invoinceV = [[InvoiceViewController alloc]init];
        [self.navigationController pushViewController:invoinceV animated:YES];
        
    }
    
}
@end
