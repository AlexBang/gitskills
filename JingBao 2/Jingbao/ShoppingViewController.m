//
//  ShoppingViewController.m
//  Jingbao
//
//  Created by mac on 15/7/18.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "ShoppingViewController.h"
#import "Size.h"
#import "ShopTableViewCell.h"
@interface ShoppingViewController ()
@property (nonatomic,strong)UIView * headerV;
@property (nonatomic,strong)UITableView * tabelView;
@end

@implementation ShoppingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIView * headerV= [[UIView alloc]initWithFrame:CGRectMake(0,17, SCREEN_WIDTH, SCREEN_HEIGHT*80/1136)];
    self.headerV = headerV;
    headerV.backgroundColor = [UIColor colorWithRed:129.00/255.0 green:203.00/255.0 blue:197.00/255.0 alpha:1.0];
    
    
    UILabel * titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(SCREEN_WIDTH*270/640, 25*SCREEN_HEIGHT/1136, 100*SCREEN_WIDTH/640, 30*SCREEN_HEIGHT/1136)];
    titleLabel.text = @"购物车";
    titleLabel.textColor = [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0];
    

    
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:@"编辑" forState:UIControlStateNormal];
    btn.frame = CGRectMake(SCREEN_WIDTH*530/640, 25*SCREEN_HEIGHT/1136, 100*SCREEN_WIDTH/640, 30*SCREEN_HEIGHT/1136);
    [self.headerV addSubview:btn];
    UIView * bootView = [[UIView alloc]initWithFrame:CGRectMake(0,956*SCREEN_HEIGHT/1136, SCREEN_WIDTH, 120*SCREEN_HEIGHT/1136)];
    bootView.backgroundColor = [UIColor cyanColor];
    [self.view addSubview:bootView];
    //创建tabelView
    [self settabelView];
}

- (void)settabelView
{
    self.tabelView = [[UITableView alloc]initWithFrame:CGRectMake(0, SCREEN_HEIGHT*110/1136,  SCREEN_WIDTH, SCREEN_HEIGHT-170)style:UITableViewStylePlain];
    //self.tabelView.backgroundColor = [UIColor grayColor];
    self.tabelView.delegate = self;
    self.tabelView.dataSource = self;
    [self.view addSubview:self.tabelView];
    
}


#pragma mark --- tabel view datasource
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
    ShopTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (!cell) {
        cell = [[ShopTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}





#pragma mark --- tabel view delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 190*SCREEN_HEIGHT/1136;
    
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
