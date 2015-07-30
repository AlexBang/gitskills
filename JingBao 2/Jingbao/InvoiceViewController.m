//
//  InvoiceViewController.m
//  Jingbao
//
//  Created by mac on 15/7/27.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "InvoiceViewController.h"
#import "Size.h"
#import "BuyViewController.h"
#import "AddinvoinceView.h"
@interface InvoiceViewController ()
@property (nonatomic,strong)UIView * headerV;
@end




@implementation InvoiceViewController
- (void)viewDidLoad
{
    [super viewDidLoad];
    UIView * headerV= [[UIView alloc]initWithFrame:CGRectMake(0, 15, SCREEN_WIDTH, SCREEN_HEIGHT*80/1136)];
    self.headerV = headerV;
    headerV.backgroundColor = [UIColor colorWithRed:129.00/255.0 green:203.00/255.0 blue:197.00/255.0 alpha:1.0];
    
    UILabel * titleView = [[UILabel alloc]initWithFrame:CGRectMake(290*SCREEN_WIDTH/640, 15, SCREEN_WIDTH*150/640, 30*SCREEN_HEIGHT/1136)];
    titleView.text = @"发票";
    titleView.font = [UIFont boldSystemFontOfSize:17];
    titleView.textColor = [UIColor whiteColor];
    [headerV addSubview:titleView];
    
    //返回按钮
    UIButton * backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [backBtn addTarget:self action:@selector(backinvoince) forControlEvents:UIControlEventTouchUpInside];
    backBtn.frame = CGRectMake(15,0,45,45);
    [backBtn setBackgroundImage:[UIImage imageNamed:@"ic_next4.png"] forState:UIControlStateNormal];
    [headerV addSubview:backBtn];
    
    [self.view addSubview:headerV];
    
    
    //添加发票按钮
    UIButton * addbtn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [addbtn setTitle:@"添加" forState:UIControlStateNormal];
    [addbtn setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
    addbtn.frame = CGRectMake(530*SCREEN_WIDTH/640, 25*SCREEN_HEIGHT/1136, SCREEN_WIDTH*100/640, SCREEN_HEIGHT*30/1136);
    [addbtn addTarget:self action:@selector(add) forControlEvents:UIControlEventTouchUpInside];
    [headerV addSubview:addbtn];
    
    
}
//返回发票列表
- (void)backinvoince
{
    BuyViewController * buyView = [self.navigationController.viewControllers objectAtIndex:0];
    [self.navigationController popToViewController:buyView animated:YES];
}
//添加按钮
- (void)add
{
    AddinvoinceView * addV = [[AddinvoinceView alloc]init];
    [self.navigationController pushViewController:addV animated:YES];
}
@end
