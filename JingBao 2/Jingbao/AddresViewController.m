//
//  AddresViewController.m
//  Jingbao
//
//  Created by mac on 15/7/28.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "AddresViewController.h"
#import "BuyViewController.h"
#import "AddresModel.h"
#import "UserinfoCell.h"
#import "AddaddresViewController.h"
@interface AddresViewController ()
@property (nonatomic,strong)UIView * headerV;
@property (nonatomic,strong)UITableView * tabelView;
@property (nonatomic,strong)NSMutableArray * addresArr;
@property (nonatomic,strong)AddresModel * addres;
@property (nonatomic,assign)NSInteger count;
@end

@implementation AddresViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor colorWithRed:238.00/255.0 green:238.00/255.0 blue:238.00/255.0 alpha:1.0];
    UIView * headerV= [[UIView alloc]initWithFrame:CGRectMake(0, 15, SCREEN_WIDTH, SCREEN_HEIGHT*80/1136)];
    self.headerV = headerV;
    headerV.backgroundColor = [UIColor colorWithRed:129.00/255.0 green:203.00/255.0 blue:197.00/255.0 alpha:1.0];
    
    UILabel * titleView = [[UILabel alloc]initWithFrame:CGRectMake(290*SCREEN_WIDTH/640, 15, SCREEN_WIDTH*150/640, 30*SCREEN_HEIGHT/1136)];
    titleView.text = @"收货地址";
    titleView.font = [UIFont boldSystemFontOfSize:17];
    titleView.textColor = [UIColor whiteColor];
    [headerV addSubview:titleView];
    
    //返回按钮
    UIButton * backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [backBtn addTarget:self action:@selector(backview) forControlEvents:UIControlEventTouchUpInside];
    backBtn.frame = CGRectMake(15,0,45,45);
    [backBtn setBackgroundImage:[UIImage imageNamed:@"ic_next4.png"] forState:UIControlStateNormal];
    [headerV addSubview:backBtn];
    
    [self.view addSubview:headerV];
    
    //添加地址
    UIButton * addAddres = [UIButton buttonWithType:UIButtonTypeCustom];
    [addAddres addTarget:self action:@selector(addAddresBtn) forControlEvents:UIControlEventTouchUpInside];
    addAddres.frame = CGRectMake(550*SCREEN_WIDTH/640, 20*SCREEN_HEIGHT/1136, SCREEN_WIDTH*70/640, SCREEN_HEIGHT*35/1136);
    [addAddres setTitle:@"添加" forState:UIControlStateNormal];
    [headerV addSubview:addAddres];
    
    [self.view addSubview:headerV];
    
    //请求地址列表
    NSString *key = [[NSUserDefaults standardUserDefaults]objectForKey:@"keyString"];
    NSDictionary * parameters = @{@"key":key};
    AFHTTPRequestOperationManager * manager =[AFHTTPRequestOperationManager manager];
    [NSSet setWithObject:@"text/html"];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    [manager POST:@"http://10.0.0.11/shopnc/mobile/index.php?act=member_address&op=address_list" parameters:parameters
          success:^(AFHTTPRequestOperation *operation,id responseObject) {
              
              dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
                  //请求成功获得data再数据请求得到地址信息
                  NSString *key = [[NSUserDefaults standardUserDefaults]objectForKey:@"keyString"];
                  NSMutableURLRequest * req = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://10.0.0.11/shopnc/mobile/index.php?act=member_address&op=address_list&%@",key]]];
                  
                  [NSURLConnection sendAsynchronousRequest:req queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
                      
                      NSDictionary * dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
                      self.addresArr = [NSMutableArray array];
                      NSDictionary * dic1 = dic[@"datas"];
                      NSArray  * arr = dic1[@"address_list"];
                      for (NSDictionary * dic2 in arr) {
                          self.addres = [[AddresModel alloc]init];
                          [self.addres setValuesForKeysWithDictionary:dic2];
                          [self.addresArr addObject:self.addres];
                          NSLog(@"count =%ld",self.addresArr.count);
                          
                      }
                      dispatch_async(dispatch_get_main_queue(), ^{
                          
                          //创建tabelView
                          
                          UITableView * tableView  = [[UITableView alloc]initWithFrame:CGRectMake(0, SCREEN_HEIGHT*100/1136, SCREEN_WIDTH, SCREEN_HEIGHT)style:UITableViewStylePlain];
                          tableView.dataSource = self;
                          tableView.delegate =  self;
                          
                          [self.view addSubview:tableView];
                          
                      });
                  }];
                  
                  
              });
              
          }failure:^(AFHTTPRequestOperation *operation,NSError *error) {
              NSLog(@"Error: %@", error);
          }];
    
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
  
    return self.addresArr.count;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UserinfoCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[UserinfoCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    
     dispatch_async(dispatch_get_main_queue(), ^{
   
    self.addres = [self.addresArr objectAtIndex:indexPath.row];
     
    cell.username.text = self.addres.true_name;
    cell.addLabel.text = self.addres.address;
     });
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 160*SCREEN_HEIGHT/1136;
}
//添加地址按钮
- (void)addAddresBtn
{
    AddaddresViewController * addAddresV = [[AddaddresViewController alloc]init];
    [self.navigationController pushViewController:addAddresV animated:YES];
}
- (void)backview
{
    BuyViewController * buyView = [self.navigationController.viewControllers objectAtIndex:0];
    [self.navigationController popToViewController:buyView animated:YES];
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
