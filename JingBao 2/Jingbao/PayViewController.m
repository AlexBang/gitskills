//
//  PayViewController.m
//  Jingbao
//
//  Created by mac on 15/7/25.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "PayViewController.h"
#import "Size.h"
#import "BuyViewController.h"
@interface PayViewController  ()
@property (nonatomic,strong)UIView * headerV;
@end


@implementation PayViewController
- (void)viewDidLoad
{
     [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:238.00/255.0 green:238.00/255.0 blue:238.00/255.0 alpha:1.0];
    UIView * headerV= [[UIView alloc]initWithFrame:CGRectMake(0, 15, SCREEN_WIDTH, SCREEN_HEIGHT*80/1136)];
    self.headerV = headerV;
    headerV.backgroundColor = [UIColor colorWithRed:129.00/255.0 green:203.00/255.0 blue:197.00/255.0 alpha:1.0];
    
    UILabel * titleView = [[UILabel alloc]initWithFrame:CGRectMake(290*SCREEN_WIDTH/640, 15, SCREEN_WIDTH*150/640, 30*SCREEN_HEIGHT/1136)];
    titleView.text = @"支付";
    titleView.font = [UIFont boldSystemFontOfSize:17];
    titleView.textColor = [UIColor whiteColor];
    [headerV addSubview:titleView];
    
    //返回按钮
    UIButton * backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [backBtn addTarget:self action:@selector(back:) forControlEvents:UIControlEventTouchUpInside];
    backBtn.frame = CGRectMake(18,0,45,45);
    [backBtn setBackgroundImage:[UIImage imageNamed:@"ic_next4.png"] forState:UIControlStateNormal];
    [headerV addSubview:backBtn];
    
    [self.view addSubview:headerV];
    
    UIImageView * imgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 95*SCREEN_HEIGHT/1136, SCREEN_WIDTH, 90*SCREEN_HEIGHT/1136)];
    imgView.backgroundColor = [UIColor whiteColor];
    UILabel * pay = [[UILabel alloc]initWithFrame:CGRectMake(40*SCREEN_WIDTH/640, 30*SCREEN_HEIGHT/1136, SCREEN_WIDTH, SCREEN_HEIGHT*30/1136)];
    pay.text = @"支付中心";
    pay.font = [UIFont boldSystemFontOfSize:16];
    [imgView addSubview:pay];
    
    UILabel * lab = [[UILabel alloc]initWithFrame:CGRectMake(20,30*SCREEN_HEIGHT/1136, SCREEN_WIDTH*3/640, SCREEN_HEIGHT*30/1136)];
    lab.backgroundColor = [UIColor colorWithRed:161.00/255 green:207.00/255 blue:203.00/255 alpha:1.0];
    [imgView addSubview:lab];
    [self.view addSubview:imgView];
    
    //创建tabel
    UITableView * table = [[UITableView alloc]initWithFrame:CGRectMake(0, 170*SCREEN_HEIGHT/1136, SCREEN_WIDTH, SCREEN_HEIGHT*350/1136) style:UITableViewStylePlain];
    table.delegate = self;
    table.dataSource = self;
    [self.view addSubview:table];
    
}

- (void)back:(UIButton *)sender
{
    BuyViewController * buy = [self.navigationController.viewControllers objectAtIndex:0];
    [self.navigationController popToViewController:buy animated:YES];
    [self.headerV removeFromSuperview];
    
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
        UITableViewCell * chatCell = [tableView dequeueReusableCellWithIdentifier:@"chatCell"];
        if (chatCell == nil) {
            chatCell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"chatCell"];
        }
        UIImageView * imgView = [[UIImageView alloc]initWithFrame:CGRectMake(40*SCREEN_WIDTH/640, 25*SCREEN_HEIGHT/1136, 36*SCREEN_WIDTH/640, 30*SCREEN_HEIGHT/1136)];
        imgView.image = [UIImage imageNamed:@"微信 - Assistor.png"];
        [chatCell addSubview:imgView];
        UILabel * chatL = [[UILabel alloc]initWithFrame:CGRectMake(110*SCREEN_WIDTH/640, 25*SCREEN_HEIGHT/1136, SCREEN_WIDTH*200/640, 30*SCREEN_HEIGHT/1136)];
        chatL.text = @"微信支付";
        chatL.textColor = [UIColor colorWithRed:183.00/255.0 green:183.00/255.0 blue:183.00/255.0 alpha:1.0];
        [chatCell addSubview:chatL];
        chatCell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        chatCell.accessoryType = UITableViewCellAccessoryDisclosureIndicator; //显示最右边的箭头
        return chatCell;
    }else if (indexPath.row == 1){
        UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
        if (!cell) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        }
        UIImageView * imgView1 = [[UIImageView alloc]initWithFrame:CGRectMake(40*SCREEN_WIDTH/640, 25*SCREEN_HEIGHT/1136, 36*SCREEN_WIDTH/640, 30*SCREEN_HEIGHT/1136)];
        imgView1.image = [UIImage imageNamed:@"信用卡 - Assistor.png"];
        [cell addSubview:imgView1];
        UILabel * chatL = [[UILabel alloc]initWithFrame:CGRectMake(110*SCREEN_WIDTH/640, 25*SCREEN_HEIGHT/1136, SCREEN_WIDTH*200/640, 30*SCREEN_HEIGHT/1136)];
        chatL.text = @"信用卡";
        chatL.textColor = [UIColor colorWithRed:183.00/255.0 green:183.00/255.0 blue:183.00/255.0 alpha:1.0];
        [cell addSubview:chatL];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator; //显示最右边的箭头
        return cell;
        
    }else if (indexPath.row == 2){
        UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
        if (!cell) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        }
        UILabel * chatL = [[UILabel alloc]initWithFrame:CGRectMake(110*SCREEN_WIDTH/640, 25*SCREEN_HEIGHT/1136, SCREEN_WIDTH*200/640, 30*SCREEN_HEIGHT/1136)];
        chatL.text = @"储蓄卡";
        chatL.textColor = [UIColor colorWithRed:183.00/255.0 green:183.00/255.0 blue:183.00/255.0 alpha:1.0];
        [cell addSubview:chatL];
        UIImageView * imgView1 = [[UIImageView alloc]initWithFrame:CGRectMake(40*SCREEN_WIDTH/640, 25*SCREEN_HEIGHT/1136, 36*SCREEN_WIDTH/640, 30*SCREEN_HEIGHT/1136)];
        imgView1.image = [UIImage imageNamed:@"储蓄卡 - Assistor.png"];
        [cell addSubview:imgView1];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator; //显示最右边的箭头
        return cell;
    }else
    {
        UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
        if (!cell) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        }
        UILabel * chatL = [[UILabel alloc]initWithFrame:CGRectMake(110*SCREEN_WIDTH/640, 25*SCREEN_HEIGHT/1136, SCREEN_WIDTH*200/640, 30*SCREEN_HEIGHT/1136)];
        chatL.text = @"支付宝";
        chatL.textColor = [UIColor colorWithRed:183.00/255.0 green:183.00/255.0 blue:183.00/255.0 alpha:1.0];
        [cell addSubview:chatL];
        UIImageView * imgView1 = [[UIImageView alloc]initWithFrame:CGRectMake(40*SCREEN_WIDTH/640, 25*SCREEN_HEIGHT/1136, 36*SCREEN_WIDTH/640, 30*SCREEN_HEIGHT/1136)];
        imgView1.image = [UIImage imageNamed:@"支付宝 - Assistor.png"];
        [cell addSubview:imgView1];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator; //显示最右边的箭头
        return cell;
    }
    
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 70*SCREEN_HEIGHT/1136;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 70*SCREEN_HEIGHT/1136;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView * view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 70*SCREEN_HEIGHT/1136)];
     view.backgroundColor = [UIColor colorWithRed:238.00/255.0 green:238.00/255.0 blue:238.00/255.0 alpha:1.0];
    UILabel * priceL = [[UILabel alloc]initWithFrame:CGRectMake(40*SCREEN_WIDTH/640, 25*SCREEN_HEIGHT/1136, SCREEN_WIDTH*300/640, SCREEN_HEIGHT*30/1136)];
   
    NSString * price = @"110.00";
    
    priceL.text = [NSString stringWithFormat:@"合计：￥ %@",price];
    priceL.textColor = [UIColor colorWithRed:158.00/255.0 green:158.00/255.0 blue:158.00/255.0 alpha:1.0];
    [view addSubview:priceL];
    
    return  view;
    
}
@end
