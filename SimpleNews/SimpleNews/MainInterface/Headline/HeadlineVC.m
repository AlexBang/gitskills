//
//  HeadlineVC.m
//  SimpleNews
//
//  Created by lanou3g on 15/5/29.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "HeadlineVC.h"
#import "Size.h"
#import "NetworkHandler.h"
#import "Url.h"
#import "News.h"
#import "HeadCell.h"
#import "CommonCell.h"
#import "PhotoCell.h"
#import "MJRefresh.h"
#import "SpecialListVC.h"
#import "PhotoDetail.h"
#import "TextDetail.h"

@interface HeadlineVC ()

@property(nonatomic,strong)UIActivityIndicatorView * chrysanthemum;

@property(nonatomic,strong)NSMutableArray * headlineListArr;

@property(nonatomic,strong)UITableView * tableView;

@end

static int count = 1;

@implementation HeadlineVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    self.view.backgroundColor = [UIColor cyanColor];
    [self creatChrysanthemum];
    [self layoutTableView];
    
    NSString * urlStr = [NSString stringWithFormat:@"%@%@",ListUrl,@"headline/T1348647853363/0-20.html"];
    NSLog(@"%@",urlStr);
    NSURL * url = [NSURL URLWithString:urlStr];
    NetworkHandler * networkH = [[NetworkHandler alloc]init];
    [networkH  getNewsListWithURL:url withKey:@"T1348647853363" competion:^(id list) {
        self.headlineListArr = list;
        [self.tableView reloadData];
    }];
    
    
    
}

- (void)viewWillAppear:(BOOL)animated
{
    
    [self addRefresh];
}



- (void)addRefresh
{
    //处理循环引用
    __weak HeadlineVC * headlineVC = self;
    //给tableView添加下拉刷新逐渐并回调block块
    [self.tableView addLegendFooterWithRefreshingBlock:^{
        [headlineVC loadFooterRefresh];
    }];
    
    [self.tableView addLegendHeaderWithRefreshingBlock:^{
        [headlineVC loadHeaderRefresh];
    }];
}

// 下拉刷新数据
- (void)loadHeaderRefresh
{
    NSString * urlStr = [NSString stringWithFormat:@"%@headline/T1348647853363/0-20.html",ListUrl];
    NSLog(@"%@",urlStr);
    NSURL * url = [NSURL URLWithString:urlStr];
    NetworkHandler * networkH = [[NetworkHandler alloc]init];
    [networkH  getNewsListWithURL:url withKey:@"T1348647853363" competion:^(id list) {
        self.headlineListArr = list;
        [self.tableView reloadData];
        [self.tableView.header endRefreshing];
        count = 1;
    }];
}
// 上拉加载数据
- (void)loadFooterRefresh
{
    NSString * urlStr = [NSString stringWithFormat:@"%@headline/T1348647853363/%d-20.html",ListUrl,count*20];
    count++;
    NSLog(@"%@",urlStr);
    NSURL * url = [NSURL URLWithString:urlStr];
    NetworkHandler * networkH = [[NetworkHandler alloc]init];
    [networkH  getNewsListWithURL:url withKey:@"T1348647853363" competion:^(id list) {
        [self.headlineListArr addObjectsFromArray:list];
        [self.tableView reloadData];
        [self.tableView.footer endRefreshing];
    }];
}





// 布置tableview
- (void)layoutTableView
{
    UITableView * headlindTV = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];

    self.tableView = headlindTV;
    
    headlindTV.backgroundColor = [UIColor clearColor];
    headlindTV.tableFooterView = [[UIView alloc]init];
//    headlindTV.separatorStyle = UITableViewCellSeparatorStyleSingleLineEtched;
    
    headlindTV.dataSource = self;
    headlindTV.delegate = self;
    
    [self.view addSubview:headlindTV];
}

// 创建菊花
- (void)creatChrysanthemum
{
    self.chrysanthemum = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    self.chrysanthemum.frame = CGRectMake(0, 0, 220, 120);
    UILabel * label = [[UILabel alloc]initWithFrame:CGRectMake(0, 80, 220, 20)];
    label.font = [UIFont systemFontOfSize:12.0f];
    label.textColor = [UIColor lightGrayColor];
    label.text = @"我正在努力加载中......";
    label.textAlignment = NSTextAlignmentCenter;
    [self.chrysanthemum addSubview:label];
    self.chrysanthemum.center = CGPointMake([UIScreen mainScreen].bounds.size.width/2 ,[UIScreen mainScreen].bounds.size.height/2 -100);
    self.chrysanthemum.color = [UIColor grayColor];
    self.chrysanthemum.hidesWhenStopped = YES;
    [self.chrysanthemum startAnimating];
    [self.view addSubview:self.chrysanthemum];
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    News * news = _headlineListArr[indexPath.row];
    if (indexPath.row == 0) {
        return SCREEN_HEIGHT * 0.47;
    }else if(news.imgextra)
    {
        return SCREEN_HEIGHT * 0.35;
    }
    return SCREEN_HEIGHT * 0.38;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.headlineListArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    News * news = self.headlineListArr[indexPath.row];
    if (indexPath.row == 0) {
        HeadCell * headCell = [tableView dequeueReusableCellWithIdentifier:@"headCell"];
        if (!headCell) {
            headCell = [[HeadCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"headCell"];
        }
        headCell.news = self.headlineListArr[indexPath.row];
        headCell.selectionStyle = UITableViewCellSelectionStyleNone;
        return headCell;
    }else if (news.imgextra.count == 2) {
        PhotoCell * photoCell = [tableView dequeueReusableCellWithIdentifier:@"photoCell"];
        if (!photoCell) {
            photoCell = [[PhotoCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"photoCell"];
        }
        photoCell.news = self.headlineListArr[indexPath.row];
        photoCell.selectionStyle = UITableViewCellSelectionStyleNone;
        return photoCell;
    }else{
        CommonCell * commonCell = [tableView dequeueReusableCellWithIdentifier:@"commonCell"];
        if (!commonCell) {
            commonCell = [[CommonCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"commonCell"];
        }
        commonCell.news = self.headlineListArr[indexPath.row];
        commonCell.selectionStyle = UITableViewCellSelectionStyleNone;
        return commonCell;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    News * news = self.headlineListArr[indexPath.row];
    if ([news.skipType isEqualToString:@"photoset"]) {
        PhotoDetail * photoD = [[PhotoDetail alloc]init];
        photoD.news = news;
        [self.navigationController pushViewController:photoD animated:YES];
    }else if ([news.skipType isEqualToString:@"special"])
    {
        SpecialListVC * specialList = [[SpecialListVC alloc]init];
        specialList.news = news;
        [self.navigationController pushViewController:specialList animated:YES];
    }else
    {
        TextDetail * textD = [[TextDetail alloc]init];
        textD.news = news;
        [self.navigationController pushViewController:textD animated:YES];
    }
    
    
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
