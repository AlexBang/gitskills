//
//  UserViewController.m
//  Jingbao
//
//  Created by mac on 15/7/18.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "UserViewController.h"

#import "LoginViewController.h"
#import "RetrieveViewController.h"
#import "FindbackViewController.h"
#import "NetworkHandler.h"
#import "AFHTTPRequestOperationManager.h"
#import "AFHTTPSessionManager.h"
#import "Userinfo.h"
@interface UserViewController ()
@property (nonatomic,strong)UIView * headerV;
@property (nonatomic,strong)UITextField * usetext;
@property (nonatomic,strong)UITextField * pwdText;
@property (nonatomic,strong)NSString * keyString;
@end

@implementation UserViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:238.00/255.0 green:238.00/255.0 blue:238.00/255.0 alpha:1.0];
    
    
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
    UILabel * titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(SCREEN_WIDTH*210/640, 25*SCREEN_HEIGHT/1136, 250*SCREEN_WIDTH/640, 30*SCREEN_HEIGHT/1136)];
    titleLabel.text = @"金宝银宝账号登录";
    titleLabel.textColor = [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0];
    [self.headerV addSubview:titleLabel];
    [self.navigationController.view addSubview:headerV];
    
    
    [self.navigationController.view addSubview:headerV];
    
    UIImageView * imgView = [[UIImageView alloc]initWithFrame:CGRectMake(30*SCREEN_WIDTH/640, 150*SCREEN_HEIGHT/1136, 580*SCREEN_WIDTH/640, SCREEN_HEIGHT*140/1136)];
    
    imgView.backgroundColor = [UIColor colorWithRed:252.00/255.0 green:251.00/255.0 blue:251.00/255.0 alpha:1.0];
    imgView.tintColor = [UIColor redColor];
    imgView.layer.cornerRadius = 8;
    [self.view addSubview:imgView];
    //账户 登陆密码
    
    UILabel * useLabel = [[UILabel alloc]initWithFrame:CGRectMake(60*SCREEN_WIDTH/640, 170*SCREEN_HEIGHT/1136, 70*SCREEN_WIDTH/640, 30*SCREEN_HEIGHT/1136)];
    useLabel.text = @"账户";
   
    useLabel.textColor = [UIColor blackColor];
    [self.view addSubview:useLabel];
    
    UITextField * usetext = [[UITextField alloc]initWithFrame:CGRectMake(230*SCREEN_WIDTH/640, 150*SCREEN_HEIGHT/1136, 500*SCREEN_WIDTH/640, 70*SCREEN_HEIGHT/1136)];
    self.usetext = usetext;
    usetext.delegate = self;
    
    usetext.placeholder = @"手机号/会员名/邮箱";
    usetext.textColor = [UIColor colorWithRed:95.00/255.0 green:95.00/255.0 blue:95.00/255.0 alpha:1.0];
    [self.view addSubview:usetext];
    
    //中间横线
    UILabel * label = [[UILabel alloc]initWithFrame:CGRectMake(30*SCREEN_WIDTH/640, 220*SCREEN_HEIGHT/1136, 580*SCREEN_WIDTH/640, 1)];
    label.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:label];
    UILabel * pwdLabel = [[UILabel alloc]initWithFrame:CGRectMake(60*SCREEN_WIDTH/640, 230*SCREEN_HEIGHT/1136, 130*SCREEN_WIDTH/640, 30*SCREEN_HEIGHT/1136)];
    pwdLabel.text = @"登录密码";
    
    pwdLabel.textColor = [UIColor blackColor];
    [self.view addSubview:pwdLabel];
    
    UITextField * pwdText = [[UITextField alloc]initWithFrame:CGRectMake(230*SCREEN_WIDTH/640, 210*SCREEN_HEIGHT/1136, 500*SCREEN_WIDTH/640, 70*SCREEN_HEIGHT/1136)];
    self.pwdText = pwdText;
    pwdText.delegate = self;
    pwdText.placeholder = @"请输入密码";
    
    pwdText.textColor = [UIColor colorWithRed:95.00/255.0 green:95.00/255.0 blue:95.00/255.0 alpha:1.0];
    [self.view addSubview:pwdText];
    
    //登录按钮
    UIButton * loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    loginBtn.frame = CGRectMake(30*SCREEN_WIDTH/640, 320*SCREEN_HEIGHT/1136, 580*SCREEN_WIDTH/640, SCREEN_HEIGHT*70/1136);
    loginBtn.backgroundColor = [UIColor colorWithRed:209.00/255.0 green:0 blue:0 alpha:1.0];
    //登陆页面的登陆按钮添加响应方法
    [loginBtn addTarget:self action:@selector(didClickLoginButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [loginBtn setTitle:@"登录" forState:UIControlStateNormal];
    [self.view addSubview:loginBtn];
    
    //注册按钮
    UIButton * registerBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    registerBtn.frame = CGRectMake(30*SCREEN_WIDTH/640, 400*SCREEN_HEIGHT/1136, 140*SCREEN_WIDTH/640, SCREEN_HEIGHT*70/1136);
    [registerBtn addTarget:self action:@selector(login) forControlEvents:UIControlEventTouchUpInside];
    [registerBtn setTitleColor:[UIColor colorWithRed:125.00/255.0 green:125.00/255.0 blue:125.00/255.0 alpha:1.0] forState:UIControlStateNormal];
    
    
    [registerBtn setTitle:@"快速注册" forState:UIControlStateNormal];
    [self.view addSubview:registerBtn];
    //找回密码
    
    UIButton * retrieveBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    retrieveBtn.frame = CGRectMake(470*SCREEN_WIDTH/640, 400*SCREEN_HEIGHT/1136, 140*SCREEN_WIDTH/640, SCREEN_HEIGHT*70/1136);
    [retrieveBtn addTarget:self action:@selector(retrieve) forControlEvents:UIControlEventTouchUpInside];
    
    [retrieveBtn setTitleColor:[UIColor colorWithRed:125.00/255.0 green:125.00/255.0 blue:125.00/255.0 alpha:1.0] forState:UIControlStateNormal];
    [retrieveBtn setTitle:@"找回密码" forState:UIControlStateNormal];
    [self.view addSubview:retrieveBtn];
}
//登陆页面的登陆按钮添加响应方法
- (void)didClickLoginButtonAction
{
    NSString * useStr = self.usetext.text;
    NSString * pwdStr = self.pwdText.text;
    NSString * urlStr = [NSString stringWithFormat:@"%@&username=%@&password=%@&cilent=ios",HOSTS_API,useStr,pwdStr];
    NSLog(@"%@",urlStr);
    //加入到线程中 等请求完key在存储数据
    dispatch_sync(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSDictionary *parameters =@{@"username":useStr,@"password":pwdStr,@"client":@"ios"};
        
        AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
        [NSSet setWithObject:@"text/html"];
        manager.responseSerializer = [AFHTTPResponseSerializer serializer];
        [manager POST:HOSTS_API parameters:parameters
              success:^(AFHTTPRequestOperation *operation,id responseObject) {
        NSLog(@"Success: %@", [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding]);
                  
                  
    NSMutableURLRequest * req = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:urlStr]];
    [NSURLConnection sendAsynchronousRequest:req queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
    NSDictionary * dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
    NSDictionary * dic1 = dic[@"datas"];
                  
        //获取key和nameuser
                  
        Userinfo * user = [[Userinfo alloc]init];
       [user setValuesForKeysWithDictionary:dic1];
        self.keyString = user.key;
                  
        
        //存储用户信息
        NSUserDefaults * userDefaultes = [NSUserDefaults standardUserDefaults];
        [userDefaultes  setObject:self.keyString forKey:@"keyString"];
        
        [userDefaultes synchronize];
                 
              }];
        }failure:^(AFHTTPRequestOperation *operation,NSError *error) {
                  NSLog(@"Error: %@", error);
              }];

            sleep(1);
        
    });
}

//注册
- (void)login
{
    LoginViewController * loginV = [[LoginViewController alloc]init];
    [self.navigationController presentViewController:loginV animated:YES completion:nil];
    
}
//找回密码
- (void)retrieve
{
    FindbackViewController * findV = [[FindbackViewController alloc]init];
    [self.navigationController presentViewController:findV animated:YES completion:nil];
}
- (void)back
{
    
}
//取消按钮
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return NO;
    
}
- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    
    
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
