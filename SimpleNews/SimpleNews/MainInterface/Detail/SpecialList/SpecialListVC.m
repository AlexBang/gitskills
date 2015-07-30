//
//  SpecialListVC.m
//  SimpleNews
//
//  Created by lanou3g on 15/5/31.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "SpecialListVC.h"
#import "SpecialCell.h"
#import "Size.h"
#import "Url.h"
#import "NetworkHandler.h"
#import "PhotoDetail.h"
#import "TextDetail.h"


@interface SpecialListVC ()

@property(nonatomic,strong)UIActivityIndicatorView * chrysanthemum;

@property(nonatomic,strong)UITableView * tableView;

@property (nonatomic,strong)NSMutableArray * specialListArr;

@end

@implementation SpecialListVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    self.view.backgroundColor = [UIColor redColor];
    
    
    [self creatChrysanthemum];
    [self layoutTableView];
    
    
    
    
    
}



- (void)setNews:(News *)news
{
    if (_news != news) {
        _news = news;
    }
    
    [self parserUrl];
    
    
}

- (void)parserUrl
{
    NSString * skipID = self.news.skipID;
    NSString * urlStr = [NSString stringWithFormat:@"%@%@%@",SpecialListUrl,skipID,@".html"];
    NSURL * url = [NSURL URLWithString:urlStr];
    
    NetworkHandler * networkH = [[NetworkHandler alloc]init];
    [networkH getSpecialListWithURL:url withKey:skipID competion:^(id list) {
        self.specialListArr = list;
        [self.tableView reloadData];
        
        
    }];
    
    
}




// 布置tableview
- (void)layoutTableView
{
    UITableView * specialTV = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT - 64) style:UITableViewStylePlain];
    
    self.tableView = specialTV;
    
    specialTV.backgroundColor = [UIColor clearColor];
    specialTV.tableFooterView = [[UIView alloc]init];
    
    specialTV.dataSource = self;
    specialTV.delegate = self;
    
    [self.view addSubview:specialTV];
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

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.specialListArr.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 40;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (self.specialListArr) {
        News * specialNews = self.specialListArr[0];
        return specialNews.sname;
    }
    return nil;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SpecialCell * specialCell = [tableView dequeueReusableCellWithIdentifier:@"specialCell"];
    if (!specialCell) {
        specialCell = [[SpecialCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"specialCell"];
    }
    specialCell.news = self.specialListArr[indexPath.row];
    
    return specialCell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    News * specialNews = self.specialListArr[indexPath.row];
    if ([specialNews.skipType isEqualToString:@"photoset"]) {
        PhotoDetail * photoD = [[PhotoDetail alloc]init];
        photoD.news = specialNews;
        [self.navigationController pushViewController:photoD animated:YES];
    }else
    {
        TextDetail * textD = [[TextDetail alloc]init];
        textD.news = specialNews;
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
