//
//  TextDetail.m
//  SimpleNews
//
//  Created by lanou3g on 15/5/31.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "TextDetail.h"
#import "Size.h"
#import "Url.h"
#import "NetworkHandler.h"
#import "DetailModel.h"
#import "DBManager.h"

@interface TextDetail ()

@property (nonatomic, strong)UILabel * titleLabel;

@property (nonatomic, strong)UILabel * sourceLabel;

@property (nonatomic, strong)UILabel * timeLabel;

@property (nonatomic, strong)UIWebView * bodyWebView;

@property (nonatomic, strong)DetailModel * detail;

@property(nonatomic,strong)UIActivityIndicatorView * chrysanthemum;

@end

@implementation TextDetail

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    
    [self creatChrysanthemum];
    
    self.titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(3, 64, SCREEN_WIDTH - 6, 20)];
    [self.view addSubview:self.titleLabel];
    
    self.sourceLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 68, 100, 10)];
    self.sourceLabel.font = [UIFont systemFontOfSize:10];
    [self.view addSubview:self.sourceLabel];
    
    self.timeLabel = [[UILabel alloc]initWithFrame:CGRectMake(100, 68, 80, 10)];
    self.timeLabel.font = [UIFont systemFontOfSize:10];
    [self.view addSubview:self.timeLabel];
    
    [self layoutNavigationBar];
    
    [self isFavorite];
}

// 布置NavigationBar
- (void)layoutNavigationBar
{
    UIBarButtonItem * rightBtn = [[UIBarButtonItem alloc]initWithImage:[[UIImage imageNamed:@"favorite_n.png"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(favorite)];
    
    self.navigationItem.rightBarButtonItem = rightBtn;
    
    
    
}

// 判断是否收藏
- (void)isFavorite
{
    DBManager * dbManager = [[DBManager alloc]init];
    News * news = [dbManager selectNewsByTitle:self.news.title];
    
        if (news) {
            
            UIBarButtonItem * rightBtn = [[UIBarButtonItem alloc]initWithImage:[[UIImage imageNamed:@"favorite_s.png"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(cancelFavorite)];
            self.navigationItem.rightBarButtonItem = rightBtn;
        }
}

// 点击收藏
- (void)favorite
{
    DBManager * dbManager = [[DBManager alloc]init];
    [dbManager insertNews:self.news];
    
    UIBarButtonItem * rightBtn = [[UIBarButtonItem alloc]initWithImage:[[UIImage imageNamed:@"favorite_s.png"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(cancelFavorite)];
    self.navigationItem.rightBarButtonItem = rightBtn;
    UIAlertView * alertV = [[UIAlertView alloc]initWithTitle:@"提示" message:@"收藏成功" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil];
    [alertV show];

    
    
}

// 取消收藏
- (void)cancelFavorite
{
    DBManager * dbManager = [[DBManager alloc]init];
    [dbManager deleteNewsByTitle:self.news.title];
    UIAlertView * alertV = [[UIAlertView alloc]initWithTitle:@"提示" message:@"已取消收藏" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil];
    [alertV show];
    [self layoutNavigationBar];
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



- (void)setNews:(News *)news
{
    if (_news != news) {
        _news = news;
    }
    NSString * docID = news.docid;
    [self parserUrlWithDocID:docID];
    
}


- (void)parserUrlWithDocID:(NSString *)docID
{
    
    
    NSString * urlStr = [NSString stringWithFormat:@"%@%@%@",TextDetailUrl,docID,@"/full.html"];
    NSURL * url = [NSURL URLWithString:urlStr];
    
    NetworkHandler * networkH = [[NetworkHandler alloc]init];
    [networkH getTextDetailWithURL:url withKey:docID competion:^(id detail) {
        UIImageView * backgroudImgView = [[UIImageView alloc]initWithFrame:self.view.bounds];
        backgroudImgView.image = [UIImage imageNamed:@"backgroud.jpg"];
        [self.view addSubview:backgroudImgView];
        
        
        self.bodyWebView = [[UIWebView alloc]initWithFrame:CGRectMake(3, 84, SCREEN_WIDTH - 6, SCREEN_HEIGHT - 84)];
        _bodyWebView.backgroundColor = [UIColor clearColor];
        _bodyWebView.opaque = NO;
        _bodyWebView.delegate = self;
        [self.view addSubview:self.bodyWebView];
        
        
        self.detail = detail;
        
//        NSString * bodySty = self.detail.body;
        for (int i = 0; i < self.detail.img.count; i++) {
            NSString * imgStr = self.detail.img[i];
            NSString * replaceStr = [NSString stringWithFormat:@"<p><img src=\"%@\" style=\" width:%.fpx; \"/></p>", imgStr,[UIScreen mainScreen].bounds.size.width-20];
            NSString * str = [NSString stringWithFormat:@"<!--IMG#%d-->", i];
            self.detail.body = [self.detail.body stringByReplacingOccurrencesOfString:str  withString:replaceStr];
        }
        
        NSString * timeStr = [self.detail.ptime substringWithRange:NSMakeRange(0, 11)];
        self.title = self.detail.title;
        self.sourceLabel.text = self.detail.source;
        self.timeLabel.text = timeStr;
        
        
//        self.bodyWebView.scrollView.contentSize = CGSizeMake(SCREEN_WIDTH, SCREEN_HEIGHT - 80);
        
        [self.bodyWebView loadHTMLString:self.detail.body baseURL:nil];
        
    }];
    
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
