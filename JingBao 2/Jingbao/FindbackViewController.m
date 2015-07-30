//
//  FindbackViewController.m
//  Jingbao
//
//  Created by mac on 15/7/27.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "FindbackViewController.h"
#import "Size.h"
@interface FindbackViewController ()
@property (nonatomic,strong)UIView * headerV;

@end


@implementation FindbackViewController
- (void)viewDidLoad
{
    self.view.backgroundColor = [UIColor colorWithRed:238.00/255.0 green:238.00/255.0 blue:238.00/255.0 alpha:1.0];
    [self.view resignFirstResponder];
    
    UIView * headerV= [[UIView alloc]initWithFrame:CGRectMake(0, 17, SCREEN_WIDTH, SCREEN_HEIGHT*80/1136)];
    self.headerV = headerV;
    headerV.backgroundColor = [UIColor colorWithRed:129.00/255.0 green:203.00/255.0 blue:197.00/255.0 alpha:1.0];
    //返回按钮
    UIButton * backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [backBtn addTarget:self action:@selector(returnBack) forControlEvents:UIControlEventTouchUpInside];
    backBtn.frame = CGRectMake(20*SCREEN_WIDTH/640,0,85*SCREEN_WIDTH/640,85*SCREEN_HEIGHT/1136);
    [backBtn setBackgroundImage:[UIImage imageNamed:@"ic_next4.png"] forState:UIControlStateNormal];
    [headerV addSubview:backBtn];
    //标题
    UILabel * titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(SCREEN_WIDTH*260/640, 25*SCREEN_HEIGHT/1136, 250*SCREEN_WIDTH/640, 30*SCREEN_HEIGHT/1136)];
    titleLabel.text = @"找回密码";
    
    titleLabel.textColor = [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0];
    [self.headerV addSubview:titleLabel];
    [self.view addSubview:headerV];
    
    //会员号
    
    UIImageView * imgView  =[[UIImageView alloc]initWithFrame:CGRectMake(0, 150*SCREEN_HEIGHT/1136, SCREEN_WIDTH, 80*SCREEN_HEIGHT/1136)];
    imgView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:imgView];
    
    
    UILabel * memberL = [[UILabel alloc]initWithFrame:CGRectMake(50*SCREEN_WIDTH/640, SCREEN_HEIGHT*182/1136, SCREEN_WIDTH*200/640, 30*SCREEN_HEIGHT/1136)];
    
    memberL.text = @"会员号";
    memberL.textColor = [UIColor blackColor];
    UITextField * membertext = [[UITextField alloc]initWithFrame:CGRectMake(200*SCREEN_WIDTH/640, 170*SCREEN_HEIGHT/1136, SCREEN_WIDTH*300/640, 50*SCREEN_HEIGHT/1136)];
    membertext.delegate = self;
    membertext.placeholder = @"手机号/邮箱/用户名";
    [self.view addSubview:membertext];
    [self.view addSubview:memberL];
    
    
    
    
    
    
    
    
    
    
    
    UIImageView * imgView1  =[[UIImageView alloc]initWithFrame:CGRectMake(0, 270*SCREEN_HEIGHT/1136, SCREEN_WIDTH, 80*SCREEN_HEIGHT/1136)];
    imgView1.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:imgView1];
    UILabel * memberL1 = [[UILabel alloc]initWithFrame:CGRectMake(50*SCREEN_WIDTH/640, SCREEN_HEIGHT*302/1136, SCREEN_WIDTH*200/640, 30*SCREEN_HEIGHT/1136)];
    
    memberL1.text = @"验证码";
    memberL1.textColor = [UIColor blackColor];
    UITextField * membertext1 = [[UITextField alloc]initWithFrame:CGRectMake(200*SCREEN_WIDTH/640, 290*SCREEN_HEIGHT/1136, SCREEN_WIDTH*300/640, 50*SCREEN_HEIGHT/1136)];
    membertext1.placeholder = @"验证码";
    membertext1.delegate = self;
    [self.view addSubview:membertext1];
    [self.view addSubview:memberL1];
    
    
    
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    btn.frame = CGRectMake(30*SCREEN_WIDTH/640, 370*SCREEN_HEIGHT/1136, 580*SCREEN_WIDTH/640, 80*SCREEN_HEIGHT/1136);
    
    [btn setTitle:@"下一步" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(next:) forControlEvents:UIControlEventTouchUpInside];
    //设置btn颜色
    [btn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    
    [btn setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
    //设置button边角和边框颜色
    [btn.layer setBorderWidth:1.0];
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGColorRef colorref = CGColorCreate(colorSpace,(CGFloat[]){ 0, 0, 0, 0.5 });
    [btn.layer setBorderColor:colorref];
    [btn.layer setCornerRadius:5.0];
    [self.view addSubview:btn];
    
}
- (void)returnBack
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void)next:(UIButton *)sender
{
    
}
@end
