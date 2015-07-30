//
//  LoginViewController.m
//  Jingbao
//
//  Created by mac on 15/7/18.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "LoginViewController.h"
#import "Size.h"
#import "AFHTTPRequestOperationManager.h"
#import "AFHTTPSessionManager.h"
#import "Header.h"
@interface LoginViewController ()
@property (nonatomic,strong)UIView * headerV;
@property (nonatomic,strong)UIImageView * imgView1;
@property (nonatomic,strong)UIImageView * imgView2;
@property (nonatomic,strong)UIImageView * imgView3;
@property (nonatomic,strong)UIImageView * imgView4;
@property (nonatomic,strong)UITextField * usetext;
@property (nonatomic,strong)UITextField * usetext1;
@property (nonatomic,strong)UITextField * usetext2;
@property (nonatomic,strong)UITextField * usetext3;
@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:238.00/255.0 green:238.00/255.0 blue:238.00/255.0 alpha:1.0];
    [self.view resignFirstResponder];
    
    UIView * headerV= [[UIView alloc]initWithFrame:CGRectMake(0, 17, SCREEN_WIDTH, SCREEN_HEIGHT*80/1136)];
    self.headerV = headerV;
    headerV.backgroundColor = [UIColor colorWithRed:129.00/255.0 green:203.00/255.0 blue:197.00/255.0 alpha:1.0];
    //返回按钮
    UIButton * backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [backBtn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    backBtn.frame = CGRectMake(20*SCREEN_WIDTH/640,0,85*SCREEN_WIDTH/640,85*SCREEN_HEIGHT/1136);
    [backBtn setBackgroundImage:[UIImage imageNamed:@"ic_next4.png"] forState:UIControlStateNormal];
    [headerV addSubview:backBtn];
    //标题
    UILabel * titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(SCREEN_WIDTH*260/640, 25*SCREEN_HEIGHT/1136, 250*SCREEN_WIDTH/640, 30*SCREEN_HEIGHT/1136)];
    titleLabel.text = @"快速注册";
    
    titleLabel.textColor = [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0];
    [self.headerV addSubview:titleLabel];
    [self.view addSubview:headerV];
    
    
    [self.navigationController.view addSubview:headerV];
    
    //账户 登陆密码
    UIImageView * imgView = [[UIImageView alloc]initWithFrame:CGRectMake(30*SCREEN_WIDTH/640, 150*SCREEN_HEIGHT/1136, 580*SCREEN_WIDTH/640, SCREEN_HEIGHT*70/1136)];
    
    imgView.backgroundColor = [UIColor colorWithRed:252.00/255.0 green:251.00/255.0 blue:251.00/255.0 alpha:1.0];
    imgView.tintColor = [UIColor redColor];
    imgView.layer.cornerRadius = 8;
    [self.view addSubview:imgView];
    
    
    UILabel * useLabel = [[UILabel alloc]initWithFrame:CGRectMake(30*SCREEN_WIDTH/640, 20*SCREEN_HEIGHT/1136, 150*SCREEN_WIDTH/640, 30*SCREEN_HEIGHT/1136)];
    useLabel.text = @"用户注册";
    
    useLabel.textColor = [UIColor blackColor];
    [imgView addSubview:useLabel];
    
    UITextField * usetext = [[UITextField alloc]initWithFrame:CGRectMake(230*SCREEN_WIDTH/640, 150*SCREEN_HEIGHT/1136, 500*SCREEN_WIDTH/640, 70*SCREEN_HEIGHT/1136)];
    usetext.delegate = self;
    self.usetext = usetext;
    usetext.placeholder = @"请输入用户名";
    
    usetext.textColor = [UIColor colorWithRed:95.00/255.0 green:95.00/255.0 blue:95.00/255.0 alpha:1.0];
    [self.view addSubview:usetext];
    
     //输入密码
        
    UIImageView * imgView1 = [[UIImageView alloc]initWithFrame:CGRectMake(30*SCREEN_WIDTH/640, 250*SCREEN_HEIGHT/1136, 580*SCREEN_WIDTH/640, SCREEN_HEIGHT*70/1136)];
    
    imgView1.backgroundColor = [UIColor colorWithRed:252.00/255.0 green:251.00/255.0 blue:251.00/255.0 alpha:1.0];
    imgView1.tintColor = [UIColor redColor];
    imgView1.layer.cornerRadius = 8;
    [self.view addSubview:imgView1];
    
    
    UILabel * useLabel1 = [[UILabel alloc]initWithFrame:CGRectMake(30*SCREEN_WIDTH/640, 20*SCREEN_HEIGHT/1136, 150*SCREEN_WIDTH/640, 30*SCREEN_HEIGHT/1136)];
    useLabel1.text = @"输入密码";
    
    useLabel1.textColor = [UIColor blackColor];
    [imgView1 addSubview:useLabel1];
    
    UITextField * usetext1 = [[UITextField alloc]initWithFrame:CGRectMake(230*SCREEN_WIDTH/640, 250*SCREEN_HEIGHT/1136, 500*SCREEN_WIDTH/640, 70*SCREEN_HEIGHT/1136)];
    usetext1.delegate = self;
    self.usetext1 = usetext1;
    usetext1.placeholder = @"请输入密码";
    
    usetext1.textColor = [UIColor colorWithRed:95.00/255.0 green:95.00/255.0 blue:95.00/255.0 alpha:1.0];
    [self.view addSubview:usetext1];
    UILabel * nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(40*SCREEN_WIDTH/640, 340*SCREEN_HEIGHT/1136, 350, 20*SCREEN_HEIGHT/1136)];
    nameLabel.text = @"(密码由6-20位英文、数字或符号组成)";
    nameLabel.font = [UIFont boldSystemFontOfSize:12];
    
    [self.view addSubview:nameLabel];
    
    //确认密码
    
        
    UIImageView * imgView2 = [[UIImageView alloc]initWithFrame:CGRectMake(30*SCREEN_WIDTH/640, 380*SCREEN_HEIGHT/1136, 580*SCREEN_WIDTH/640, SCREEN_HEIGHT*70/1136)];
    
    imgView2.backgroundColor = [UIColor colorWithRed:252.00/255.0 green:251.00/255.0 blue:251.00/255.0 alpha:1.0];
    imgView2.tintColor = [UIColor redColor];
    imgView2.layer.cornerRadius = 8;
    [self.view addSubview:imgView2];
    
    
    UILabel * useLabel2 = [[UILabel alloc]initWithFrame:CGRectMake(30*SCREEN_WIDTH/640, 20*SCREEN_HEIGHT/1136, 150*SCREEN_WIDTH/640, 30*SCREEN_HEIGHT/1136)];
    useLabel2.text = @"确认密码";
    
    useLabel2.textColor = [UIColor blackColor];
    [imgView2 addSubview:useLabel2];
    
    UITextField * usetext2 = [[UITextField alloc]initWithFrame:CGRectMake(230*SCREEN_WIDTH/640, 380*SCREEN_HEIGHT/1136, 500*SCREEN_WIDTH/640, 70*SCREEN_HEIGHT/1136)];
    usetext2.delegate = self;
    self.usetext2 = usetext2;
    usetext2.placeholder = @"重复密码";
    
    usetext2.textColor = [UIColor colorWithRed:95.00/255.0 green:95.00/255.0 blue:95.00/255.0 alpha:1.0];
    [self.view addSubview:usetext2];
    
    //邮箱
    UIImageView * imgView3 = [[UIImageView alloc]initWithFrame:CGRectMake(30*SCREEN_WIDTH/640, 480*SCREEN_HEIGHT/1136, 580*SCREEN_WIDTH/640, SCREEN_HEIGHT*70/1136)];
    
    imgView3.backgroundColor = [UIColor colorWithRed:252.00/255.0 green:251.00/255.0 blue:251.00/255.0 alpha:1.0];
    imgView3.tintColor = [UIColor redColor];
    imgView3.layer.cornerRadius = 8;
    [self.view addSubview:imgView3];
    
    
    UILabel * useLabel3 = [[UILabel alloc]initWithFrame:CGRectMake(30*SCREEN_WIDTH/640, 20*SCREEN_HEIGHT/1136, 150*SCREEN_WIDTH/640, 30*SCREEN_HEIGHT/1136)];
    useLabel3.text = @"邮箱";
    
    useLabel3.textColor = [UIColor blackColor];
    [imgView3 addSubview:useLabel3];
    
    UITextField * usetext3= [[UITextField alloc]initWithFrame:CGRectMake(230*SCREEN_WIDTH/640, 480*SCREEN_HEIGHT/1136, 500*SCREEN_WIDTH/640, 70*SCREEN_HEIGHT/1136)];
    usetext3.delegate = self;
    self.usetext3 = usetext3;
    usetext3.placeholder = @"请输入电子邮箱";
    
    usetext3.textColor = [UIColor colorWithRed:95.00/255.0 green:95.00/255.0 blue:95.00/255.0 alpha:1.0];
    [self.view addSubview:usetext3];
    
    
    UIButton * sureBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    sureBtn.frame = CGRectMake(30*SCREEN_WIDTH/640, 580*SCREEN_HEIGHT/1136, 580*SCREEN_WIDTH/640, SCREEN_HEIGHT*70/1136);
    sureBtn.backgroundColor = [UIColor colorWithRed:209.00/255.0 green:0 blue:0 alpha:1.0];
    [sureBtn addTarget:self action:@selector(sure) forControlEvents:UIControlEventTouchUpInside];
    
    [sureBtn setTitle:@"确定" forState:UIControlStateNormal];
    [self.view addSubview:sureBtn];
   
    UILabel * nameLabel1 = [[UILabel alloc]initWithFrame:CGRectMake(40*SCREEN_WIDTH/640, 700*SCREEN_HEIGHT/1136, 350, 20*SCREEN_HEIGHT/1136)];
    nameLabel1.text = @"注册即为同意金宝银宝协议和支付协议";
    nameLabel1.font = [UIFont boldSystemFontOfSize:12];
    
    [self.view addSubview:nameLabel1];
    
    
}

- (void)sure
{
    NSDictionary *parameters =@{@"username":self.usetext.text,@"password":self.usetext1.text,@"password_confirm":self.usetext2.text,@"email":self.usetext3.text,@"client":@"ios"};
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [NSSet setWithObject:@"text/html"];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager POST:REGISTER_API parameters:parameters
          success:^(AFHTTPRequestOperation *operation,id responseObject) {
              NSLog(@"Success: %@",  [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding]);
              UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"成功注册" message:@"确认" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:nil];
              
              [alert addButtonWithTitle:@"Yes"];
              [alert show];
          }failure:^(AFHTTPRequestOperation *operation,NSError *error) {
              NSLog(@"Error: %@", error);
          }];
    
}
//取消按钮
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return NO;
    
}
- (void)back
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
   
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
