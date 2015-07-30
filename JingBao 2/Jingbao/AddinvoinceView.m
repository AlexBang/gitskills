//
//  AddinvoinceView.m
//  Jingbao
//
//  Created by mac on 15/7/27.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "AddinvoinceView.h"
#import "Size.h"
#import "InvoiceViewController.h"
#import "MLKMenuPopover.h"

@interface AddinvoinceView ()<MLKMenuPopoverDelegate>
@property (nonatomic,strong)UIView * headerV;
@property (nonatomic,strong)UIButton * btn;
@property (nonatomic,strong)UIButton * selected;
@property (nonatomic,strong)UIButton * selected1;
@property (nonatomic,strong)UIView * popView;
@property(nonatomic,strong) MLKMenuPopover *menuPopover;
@end

static int count = 1;

@implementation AddinvoinceView
- (void)viewDidLoad
{
    [super viewDidLoad];
    //self.view.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-100);
    self.view.backgroundColor = [UIColor colorWithRed:238.00/255.0 green:238.00/255.0 blue:238.00/255.0 alpha:1.0];
    
    UIView * headerV= [[UIView alloc]initWithFrame:CGRectMake(0, 25*SCREEN_HEIGHT/1136, SCREEN_WIDTH, SCREEN_HEIGHT*80/1136)];
    self.headerV = headerV;
    headerV.backgroundColor = [UIColor colorWithRed:129.00/255.0 green:203.00/255.0 blue:197.00/255.0 alpha:1.0];
    
    UILabel * titleView = [[UILabel alloc]initWithFrame:CGRectMake(290*SCREEN_WIDTH/640, 15, SCREEN_WIDTH*150/640, 30*SCREEN_HEIGHT/1136)];
    titleView.text = @"发票添加";
    titleView.font = [UIFont boldSystemFontOfSize:17];
    titleView.textColor = [UIColor whiteColor];
    [headerV addSubview:titleView];
    
    //返回按钮
    UIButton * backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [backBtn addTarget:self action:@selector(backinvoinceView) forControlEvents:UIControlEventTouchUpInside];
    backBtn.frame = CGRectMake(15,0,45,45);
    [backBtn setBackgroundImage:[UIImage imageNamed:@"ic_next4.png"] forState:UIControlStateNormal];
    [headerV addSubview:backBtn];
    
    [self.view addSubview:headerV];
    
    
    for (int i = 0; i < 3; i++) {
        NSArray * arr = @[@"发票类型",@"发票抬头",@"发票内容"];
        UILabel * label = [[UILabel alloc]initWithFrame:CGRectMake(30*SCREEN_WIDTH/640, 70*i+ 135*SCREEN_HEIGHT/1136, SCREEN_WIDTH*200/640, SCREEN_HEIGHT*30/1136)];
        label.textColor = [UIColor grayColor];
        label.text = arr[i];
        [self.view addSubview:label];
        
    }
    
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.btn = btn;
    [btn setTitle:@"个人" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(pop) forControlEvents:UIControlEventTouchUpInside];
    btn.frame = CGRectMake(200*SCREEN_WIDTH/640, 108*SCREEN_HEIGHT/1136, SCREEN_WIDTH*100/640, 80*SCREEN_HEIGHT/1136);
    [self.view addSubview:btn];
    _popView = [[UIView alloc]initWithFrame:CGRectMake(200*SCREEN_WIDTH/640, 185*SCREEN_HEIGHT/1136, SCREEN_WIDTH*100/640, 0)];
    

    UIButton * selected = [UIButton buttonWithType:UIButtonTypeCustom];
    
    selected.frame = CGRectMake(0, 10*SCREEN_HEIGHT/1136, SCREEN_WIDTH*100/640,30*SCREEN_HEIGHT/1136);
    
    [selected setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [selected addTarget:self action:@selector(choice1) forControlEvents:UIControlEventTouchUpInside];
    //选择发票类型
    [selected setTitle:@"个人" forState:UIControlStateNormal];
    [_popView addSubview:selected];
    
    UILabel * la = [[UILabel alloc]initWithFrame:CGRectMake(0, 50*SCREEN_HEIGHT/1136, SCREEN_WIDTH*100/640, 1*SCREEN_HEIGHT/1136)];
    la.backgroundColor = [UIColor lightGrayColor];
    [_popView addSubview:la];
    
    UIButton * selected1 = [UIButton buttonWithType:UIButtonTypeCustom];
    selected1.frame = CGRectMake(0, 60*SCREEN_HEIGHT/1136, SCREEN_WIDTH*100/640,30*SCREEN_HEIGHT/1136);
    
    [selected1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [selected1 addTarget:self action:@selector(choice2) forControlEvents:UIControlEventTouchUpInside];
    
    [selected1 setTitle:@"企业" forState:UIControlStateNormal];
    [_popView addSubview:selected1];
    //单位发票类型填写
    UIButton * invoinceList = [UIButton buttonWithType:UIButtonTypeCustom];
    [invoinceList setTitle:@"发票类型为单位时须填写" forState:UIControlStateNormal];
    [invoinceList setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    invoinceList.frame = CGRectMake(200*SCREEN_WIDTH/640, 228*SCREEN_HEIGHT/1136, SCREEN_WIDTH*400/640, 80*SCREEN_HEIGHT/1136);
    [invoinceList addTarget:self action:@selector(touch) forControlEvents:
     UIControlEventTouchUpInside];
    [self.view addSubview:invoinceList];
    //发票抬头
    UIButton * invoincetop = [UIButton buttonWithType:UIButtonTypeCustom];
    [invoincetop setTitle:@"请按下选择" forState:UIControlStateNormal];
    [invoincetop setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    invoincetop.frame = CGRectMake(200*SCREEN_WIDTH/640, 343*SCREEN_HEIGHT/1136, SCREEN_WIDTH*400/640, 80*SCREEN_HEIGHT/1136);
    [invoincetop addTarget:self action:@selector(chocetype) forControlEvents:
     UIControlEventTouchUpInside];
    [self.view addSubview:invoincetop];
    
    //请求发票内容数据
     NSString *key = [[NSUserDefaults standardUserDefaults]objectForKey:@"keyString"];
    AFHTTPRequestOperationManager * manager = [AFHTTPRequestOperationManager manager];
    [NSSet setWithObject:@"text/html"];
    NSDictionary * parameters = @{@"key":key};
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
        [manager POST:@"http://10.0.0.11/shopnc/mobile/index.php?act=member_invoice&op=invoice_list" parameters:parameters success:^(AFHTTPRequestOperation * operation,id responseObject) {
            NSLog(@"Success: 呵呵大%@", [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding]);
            
        } failure:^(AFHTTPRequestOperation *operation,NSError *error) {
            NSLog(@"Error: %@", error);
        }];

   
    


}
- (void)chocetype
{
    self.menuPopover = [[MLKMenuPopover alloc] initWithFrame:CGRectMake(200*SCREEN_WIDTH/640, SCREEN_HEIGHT * 398/1136, SCREEN_WIDTH/4, SCREEN_HEIGHT/5)];
    self.menuPopover.menuPopoverDelegate = self;
    [self.view addSubview:self.menuPopover];
}
- (void)touch
{
    
    
}

- (void)pop
{
    
    count++;
    
    //动画
    [UIView animateWithDuration:1.0 animations:^{
        _popView.frame = CGRectMake(200*SCREEN_WIDTH/640, 185*SCREEN_HEIGHT/1136, SCREEN_WIDTH*100/640, 100*SCREEN_HEIGHT/1136);
       
        
        [self.view addSubview:_popView];
        
       _popView.backgroundColor = [UIColor whiteColor];
        
    }];
    
    if (count%2 == 0) {
        _popView.frame = CGRectMake(200*SCREEN_WIDTH/640, 185*SCREEN_HEIGHT/1136, SCREEN_WIDTH*100/640, 100*SCREEN_HEIGHT/1136);
    }else
    {
        
        [_popView removeFromSuperview];
    }
    
}
- (void)choice1
{
    [self.btn setTitle:@"个人" forState:UIControlStateNormal];
    [_popView removeFromSuperview];
    
    
}
- (void)choice2
{
    [self.btn setTitle:@"企业" forState:UIControlStateNormal];
   [_popView removeFromSuperview];
}
- (void)backinvoinceView
{
    InvoiceViewController * invoinceV = [self.navigationController.viewControllers objectAtIndex:1];
    [self.navigationController popToViewController:invoinceV animated:YES];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return 50;
}

- (NSInteger)tableView:(UITableView *)table numberOfRowsInSection:(NSInteger)section
{
    
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = @"价格排序";
    
    return cell;
}


@end
