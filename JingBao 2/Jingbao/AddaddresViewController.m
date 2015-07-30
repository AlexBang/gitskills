//
//  AddaddresViewController.m
//  Jingbao
//
//  Created by mac on 15/7/29.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "AddaddresViewController.h"
#import "AddresViewController.h"
#import "AreaList.h"
@interface AddaddresViewController ()
@property (nonatomic,strong)UIView * headerV;
@property (nonatomic,strong)UIView * whiteView;
@property (nonatomic,strong)UITextField * detailtextFiled;
@property (nonatomic,strong)UITextField * recevoicertextFiled;
@property (nonatomic,strong)UITextField * phonetextFiled;
@property (nonatomic,strong)UILabel * provinceL;
@property (nonatomic,strong)UILabel * cityLabel;
@property (nonatomic,strong)UILabel * areaLabel;
@property (nonatomic,strong)UITableView * tableView;
@property (nonatomic,strong)NSMutableArray * areaLisrArr;//省份数组
@property (nonatomic,strong)NSMutableArray * cityLisrArr;//城市数组
@property (nonatomic,strong)NSMutableArray * provinceListArr;
@property (nonatomic,strong)AreaList * area;
@property (nonatomic,strong)NSDictionary * cityParameters;
@property (nonatomic,strong)NSDictionary * areaParameters;
@end

static int count = 3;

@implementation AddaddresViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithRed:238.00/255.0 green:238.00/255.0 blue:238.00/255.0 alpha:1.0];
    UIView * headerV= [[UIView alloc]initWithFrame:CGRectMake(0, 15, SCREEN_WIDTH, SCREEN_HEIGHT*80/1136)];
    self.headerV = headerV;
    headerV.backgroundColor = [UIColor colorWithRed:129.00/255.0 green:203.00/255.0 blue:197.00/255.0 alpha:1.0];
    
    UILabel * titleView = [[UILabel alloc]initWithFrame:CGRectMake(290*SCREEN_WIDTH/640, 15, SCREEN_WIDTH*150/640, 30*SCREEN_HEIGHT/1136)];
    titleView.text = @"添加地址";
    titleView.font = [UIFont boldSystemFontOfSize:17];
    titleView.textColor = [UIColor whiteColor];
    [headerV addSubview:titleView];
    
    //返回按钮
    UIButton * backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [backBtn addTarget:self action:@selector(backAddview) forControlEvents:UIControlEventTouchUpInside];
    UIImage * img = [UIImage imageNamed:@"ic_next4.png"];
    backBtn.size = img.size;
    [backBtn setBackgroundImage:[UIImage imageNamed:@"ic_next4.png"] forState:UIControlStateNormal];
    [headerV addSubview:backBtn];
    
    [self.view addSubview:headerV];
    
    self.whiteView = [[UIView alloc]initWithFrame:CGRectMake(20*SCREEN_WIDTH/640, 170*SCREEN_HEIGHT/1136, 600*SCREEN_WIDTH/640, 410*SCREEN_HEIGHT/1136)];
    
    self.whiteView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.whiteView];
    //所在地区
    UILabel * areaL = [[UILabel alloc]initWithFrame:CGRectMake(20*SCREEN_WIDTH/640, 30*SCREEN_HEIGHT/1136, 150*SCREEN_WIDTH/640, 20*SCREEN_HEIGHT/1136)];
    areaL.text = @"所在地区";
    areaL.textColor = [UIColor blackColor];
    [self.whiteView addSubview:areaL];
    //详细地址
    UILabel * detailAdd = [[UILabel alloc]initWithFrame:CGRectMake(20*SCREEN_WIDTH/640, 200*SCREEN_HEIGHT/1136, 150*SCREEN_WIDTH/640, 20*SCREEN_HEIGHT/1136)];
    detailAdd.textColor = [UIColor blackColor];
    detailAdd.text = @"详细地址";
    [self.whiteView addSubview:detailAdd];
    self.detailtextFiled = [[UITextField alloc]initWithFrame:CGRectMake(200*SCREEN_WIDTH/640, 200*SCREEN_HEIGHT/1136, 250*SCREEN_WIDTH/640, 30*SCREEN_HEIGHT/1136)];
    self.detailtextFiled.placeholder = @"请输入街道地址";
    [self.whiteView addSubview:self.detailtextFiled];
    
    
    //收货人
    UILabel * receiverL = [[UILabel alloc]initWithFrame:CGRectMake(20*SCREEN_WIDTH/640, 275*SCREEN_HEIGHT/1136, 150*SCREEN_WIDTH/640, 30*SCREEN_HEIGHT/1136)];
    receiverL.textColor = [UIColor blackColor];
    receiverL.text = @"收货人";
    [self.whiteView addSubview:receiverL];
    
    self.recevoicertextFiled = [[UITextField alloc]initWithFrame:CGRectMake(200*SCREEN_WIDTH/640, 275*SCREEN_HEIGHT/1136, 250*SCREEN_WIDTH/640, 30*SCREEN_HEIGHT/1136)];
    self.recevoicertextFiled.placeholder = @"请输入收货人姓名";
    [self.whiteView addSubview:self.recevoicertextFiled];
   // 手机号码
    
    UILabel * phoneL = [[UILabel alloc]initWithFrame:CGRectMake(20*SCREEN_WIDTH/640, 350*SCREEN_HEIGHT/1136, 150*SCREEN_WIDTH/640, 30*SCREEN_HEIGHT/1136)];
    phoneL.textColor = [UIColor blackColor];
    phoneL.text = @"手机号码";
    [self.whiteView addSubview:phoneL];
    
    self.phonetextFiled = [[UITextField alloc]initWithFrame:CGRectMake(200*SCREEN_WIDTH/640, 350*SCREEN_HEIGHT/1136, 250*SCREEN_WIDTH/640, 30*SCREEN_HEIGHT/1136)];
    self.phonetextFiled.placeholder = @"请输入手机号";
    [self.whiteView addSubview:self.phonetextFiled];
    
    [self setupSubView];
  
    //请求省份列表
    NSString * key = [[NSUserDefaults standardUserDefaults]objectForKey:@"keyString"];
    NSDictionary * provinceParameters = @{@"key":key,@"area_id":@""};
    
    AFHTTPRequestOperationManager * manager =[AFHTTPRequestOperationManager manager];
    [NSSet setWithObject:@"text/html"];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    [manager POST:@"http://10.0.0.11/shopnc/mobile/index.php?act=member_address&op=area_list" parameters:provinceParameters
          success:^(AFHTTPRequestOperation *operation,id responseObject) {
              // NSLog(@"Success: %@", [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding]);
              
              dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
                  NSMutableURLRequest * req = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://10.0.0.11/shopnc/mobile/index.php?act=member_address&op=area_list&key=%@&area_id=%@",key,@""]]];
                  [NSURLConnection sendAsynchronousRequest:req queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
                      
                      NSDictionary * dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
                      self.areaLisrArr = [NSMutableArray array];
                      NSDictionary * dic1 = dic[@"datas"];
                      NSArray  * arr = dic1[@"area_list"];
                      for (NSDictionary * dic2 in arr) {
                          self.area = [[AreaList alloc]init];
                          [self.area setValuesForKeysWithDictionary:dic2];
                           self.cityParameters = @{@"key":key,@"area_id":[NSString stringWithFormat:@"%d",self.area.area_id]};
                          [self.areaLisrArr addObject:self.area];
                      }
                      dispatch_async(dispatch_get_main_queue(), ^{
                          
                          [self.tableView reloadData];
                      });
                      
                  }];
              });
          }failure:^(AFHTTPRequestOperation *operation,NSError *error) {
              
              NSLog(@"Error: %@", error);
          }];
    
   

    
   

}
- (void)backAddview
{
    AddresViewController * addresV = [self.navigationController.viewControllers objectAtIndex:1];
    
    [self.navigationController popToViewController:addresV animated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}
- (void)setupSubView
{
    
    //手势添加在各个label上
    NSMutableArray * arr = [NSMutableArray array];
    for (int i = 0; i < 3; i++) {
        UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap:)];
        tap.delegate = self;
        
        tap.numberOfTapsRequired = 1;
        [arr addObject:tap];
        

    }
    
    //省份选择
    UILabel * provinceL = [[UILabel alloc]initWithFrame:CGRectMake(150*SCREEN_WIDTH/640, 30*SCREEN_HEIGHT/1136, SCREEN_WIDTH*150/640, 20*SCREEN_HEIGHT/1136)];
    NSString * proStr = @"省份";
   
    self.provinceL = provinceL;
    
    provinceL.textColor = [UIColor grayColor];
    provinceL.text = [NSString stringWithFormat:@"--%@--",proStr];
    [provinceL addGestureRecognizer:arr[0]];
    provinceL.userInteractionEnabled = YES;
    [self.whiteView addSubview:provinceL];
    
    
    
    //城市选择
    UILabel * cityLabel = [[UILabel alloc]initWithFrame:CGRectMake(150*SCREEN_WIDTH/640, 90*SCREEN_HEIGHT/1136, SCREEN_WIDTH*150/640, 20*SCREEN_HEIGHT/1136)];
    
    NSString * cityStr = @"城市";
    cityLabel.tag = 200;
    cityLabel.textColor = [UIColor grayColor];
    cityLabel.userInteractionEnabled = YES;
    self.cityLabel = cityLabel;
    cityLabel.text = [NSString stringWithFormat:@"--%@--",cityStr];
    [self.whiteView addSubview:cityLabel];
    [cityLabel addGestureRecognizer:arr[1]];
    //地区
    UILabel * areaLabel = [[UILabel alloc]initWithFrame:CGRectMake(150*SCREEN_WIDTH/640, 155*SCREEN_HEIGHT/1136, SCREEN_WIDTH*150/640, 20*SCREEN_HEIGHT/1136)];
    NSString * areaStr = @"地区";
    
    areaLabel.textColor = [UIColor grayColor];
    areaLabel.userInteractionEnabled = YES;
    self.areaLabel = areaLabel;
    areaLabel.text = [NSString stringWithFormat:@"--%@--",areaStr];
    [self.whiteView addSubview:areaLabel];
    [areaLabel addGestureRecognizer:arr[2]];
}
- (void)tap:(UITapGestureRecognizer*)gester
{
    count++;
    if (self.area == nil) {
        return;
    }
    if (self.provinceL == (UILabel*)gester.view) {
        if (count%2 == 1) {
            [self setupTabelView];
        }if (count%2 == 0) {
            [self.tableView removeFromSuperview];
        }
        
        
    }else if (self.cityLabel == (UILabel*)gester.view)
    {
        if (count%2 == 1) {
            [self setupTabelView];
        }if (count%2 == 0) {
            [self.tableView removeFromSuperview];
        }
    }else
    {
        if (count%2 == 1) {
            [self setupTabelView];
        }if (count%2 == 0) {
            [self.tableView removeFromSuperview];
        }
    }
    
}
- (void)setupTabelView
{
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(150*SCREEN_WIDTH/640, 235*SCREEN_HEIGHT/1136, SCREEN_WIDTH*150/640, 0)];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    [UIView animateWithDuration:0.5 animations:^{
        
            _tableView.frame = CGRectMake(150*SCREEN_WIDTH/640, 345*SCREEN_HEIGHT/1136, SCREEN_WIDTH*150/640, 600*SCREEN_HEIGHT/1136);
            [self.view addSubview:_tableView];
    }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
        return self.areaLisrArr.count;
    
    
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    
    dispatch_async(dispatch_get_main_queue(), ^{
        if (self.areaLisrArr) {
            self.area = [self.areaLisrArr objectAtIndex:indexPath.row];
            cell.textLabel.text = self.area.area_name;
        }else if (self.cityLisrArr)
        {
            self.area = [self.cityLisrArr objectAtIndex:indexPath.row];
            cell.textLabel.text = self.area.area_name;
        }
   
       
        
    });
    
  
    cell.backgroundColor = [UIColor colorWithRed:238.00/255.0 green:238.00/255.0 blue:238.00/255.0 alpha:1.0];
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    dispatch_async(dispatch_get_main_queue(), ^{
        
            self.area = [self.areaLisrArr objectAtIndex:indexPath.row];
            
            NSString * string = self.area.area_name;
            NSString * idString = [NSString stringWithFormat:@"%d",self.area.area_id];
            
            [self passValue:string];//传省份name
            [self passid:idString];//传省份id
    });
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50*SCREEN_HEIGHT/1136;
}
//省份列表

- (void)passValue:(NSString*)string
{
    
        self.provinceL.text = [NSString stringWithFormat:@"--%@--",string];
    
    
        self.cityLabel.text = [NSString stringWithFormat:@"--%@--",string];
        NSLog(@"%@",string);
    [self.tableView removeFromSuperview];
}
- (void)passid:(NSString*)string
{
    NSString * key = [[NSUserDefaults standardUserDefaults]objectForKey:@"keyString"];
    NSDictionary * provinceParameters = @{@"key":key,@"area_id":string};
    
    AFHTTPRequestOperationManager * manager =[AFHTTPRequestOperationManager manager];
    [NSSet setWithObject:@"text/html"];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    [manager POST:@"http://10.0.0.11/shopnc/mobile/index.php?act=member_address&op=area_list" parameters:provinceParameters
          success:^(AFHTTPRequestOperation *operation,id responseObject) {
               //NSLog(@"Success: 你好==%@", [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding]);
              
              dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
                  NSMutableURLRequest * req = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://10.0.0.11/shopnc/mobile/index.php?act=member_address&op=area_list&key=%@&area_id=%@",key,string]]];
                  [NSURLConnection sendAsynchronousRequest:req queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
                      
                      NSDictionary * dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
                      self.cityLisrArr = [NSMutableArray array];
                      NSDictionary * dic1 = dic[@"datas"];
                      NSArray  * arr = dic1[@"area_list"];
                      for (NSDictionary * dic2 in arr) {
                          self.area = [[AreaList alloc]init];
                          [self.area setValuesForKeysWithDictionary:dic2];
                         
                          [self.cityLisrArr addObject:self.area];
                      }
                      dispatch_async(dispatch_get_main_queue(), ^{
                          
                          
                         
                      });
                      
                  }];
              });
          }failure:^(AFHTTPRequestOperation *operation,NSError *error) {
              
              NSLog(@"Error: %@", error);
          }];
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
