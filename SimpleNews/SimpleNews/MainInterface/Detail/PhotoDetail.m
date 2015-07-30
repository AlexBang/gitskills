//
//  PhotoDetail.m
//  SimpleNews
//
//  Created by lanou3g on 15/5/31.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "PhotoDetail.h"
#import "Size.h"
#import "Url.h"
#import "NetworkHandler.h"
#import "PhotoDetailModel.h"
#import "UIImageView+WebCache.h"
#import "DBManager.h"

@interface PhotoDetail ()

@property (nonatomic, strong)UILabel * titleLabel;

@property (nonatomic, strong)UILabel * sumPageLabel;

@property (nonatomic, strong)UILabel * curPageLabel;

@property (nonatomic, strong)UITextView * noteTextView;

@property (nonatomic, strong)PhotoDetailModel * photoDM;

@property (nonatomic, strong)UIScrollView * scrollView;

@property(nonatomic,strong)UIActivityIndicatorView * chrysanthemum;

@end

@implementation PhotoDetail

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor blackColor];
    
    [self creatChrysanthemum];
    [self layoutNavigationBar];
    [self isFavorite];
    

    
    
    
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


// 布置scrollView
- (void)layoutScrollView
{
    UIScrollView * photoSV = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    photoSV.backgroundColor = [UIColor blackColor];
    photoSV.delegate = self;
    self.scrollView = photoSV;
    photoSV.center = self.view.center;
    photoSV.pagingEnabled = YES;
    [self.view addSubview:photoSV];
    
    [self layoutLabel];
    
}



// 布置各个label
- (void)layoutLabel
{
    //标题
    UILabel * titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(5, SCREEN_HEIGHT*3/4, SCREEN_WIDTH-50, 20)];
    self.titleLabel = titleLabel;
    titleLabel.font = [UIFont systemFontOfSize:15];
    titleLabel.textColor = [UIColor whiteColor];
    [self.view addSubview:titleLabel];
    
    
    //当前页数
    UILabel * curPageLabel = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH-50, SCREEN_HEIGHT*3/4, 20, 20)];
    self.curPageLabel = curPageLabel;
    curPageLabel.text = @"1";
    curPageLabel.font = [UIFont systemFontOfSize:15];
    curPageLabel.textAlignment = NSTextAlignmentRight;
    curPageLabel.textColor = [UIColor whiteColor];
    [self.view addSubview:curPageLabel];
    
    
    //分隔符
    UILabel * diagLabel = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH-30, SCREEN_HEIGHT*3/4, 10, 20)];
    diagLabel.text = @"/";
    diagLabel.textAlignment = NSTextAlignmentCenter;
    diagLabel.textColor = [UIColor whiteColor];
    [self.view addSubview:diagLabel];
    
    
    //总页数
    UILabel * sumPageLabel = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH-20, SCREEN_HEIGHT*3/4, 20, 20)];
    self.sumPageLabel = sumPageLabel;
    sumPageLabel.text = @"37";
    sumPageLabel.font = [UIFont systemFontOfSize:15];
    sumPageLabel.textAlignment = NSTextAlignmentLeft;
    sumPageLabel.textColor = [UIColor whiteColor];
    [self.view addSubview:sumPageLabel];
    
    
    //图片内容介绍
    UITextView * noteTextView = [[UITextView alloc] initWithFrame:CGRectMake(0, SCREEN_HEIGHT*3/4+20, SCREEN_WIDTH, SCREEN_HEIGHT/4-20)];
    self.noteTextView = noteTextView;
    noteTextView.backgroundColor = [UIColor blackColor];
    noteTextView.textColor = [UIColor whiteColor];
    [self.view addSubview:noteTextView];
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

// 重写setNews方法用于赋值
- (void)setNews:(News *)news
{
    if (_news != news) {
        _news = news;
    }
    NSString * photoStr = news.skipID;
    
    // 调用接口解析
    [self parserUrlWithSkipID:photoStr];
    
    // 调用scrollView布置
    [self layoutScrollView];
    
}


// 解析接口
- (void)parserUrlWithSkipID:(NSString *)skipID
{
    // 获取skipID中{4，10}的子串范围
    NSRange range = {4,10};
    // 如果是科技图片集详情需获取{4，9}范围子串
    if (skipID.length == 13) {
        NSRange rangeOther = {4,9};
        range = rangeOther;
    }
    
    
    // 拼接、替换url网址
    skipID = [skipID substringWithRange:range];
    
    NSString * urlStr = [PhotoDetailUrl stringByAppendingString:skipID];
    
    urlStr = [urlStr stringByAppendingString:@".json"];
    
    urlStr = [urlStr stringByReplacingOccurrencesOfString:@"|" withString:@"/"];
    NSLog(@"%@",urlStr);
    NSURL * url = [NSURL URLWithString:urlStr];
    
    // 进行网络申请
    NetworkHandler * networkH = [[NetworkHandler alloc]init];
    
    [networkH getPhotoDetailWithURL:url competion:^(id photoDetail) {
        PhotoDetailModel * photoDM = photoDetail;
        self.photoDM = photoDM;
        
        // 通过图片数量设置scrollview的contentSize的大小
        CGSize contentSize = self.scrollView.contentSize;
        contentSize.width = SCREEN_WIDTH * [photoDM.imgsum intValue];
        self.scrollView.contentSize = contentSize;
        
        self.sumPageLabel.text = photoDM.imgsum;
        self.titleLabel.text = photoDM.setname;
        self.noteTextView.text = photoDM.note[0];
        
        // 粘贴请求回来的图片
        for (int i = 0; i < [photoDM.imgsum intValue]; i++) {
            
            // 每屏宽度设置一张图片
            UIImageView * imgView = [[UIImageView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH * i, 0, SCREEN_WIDTH, self.scrollView.bounds.size.height)];
            // 将图片设置于视图中心
            CGPoint center = imgView.center;
            center.x = self.view.center.x + SCREEN_WIDTH * i;
            center.y = self.view.center.y;
            imgView.center = center;
            // 将图片适合imgView
            imgView.contentMode = UIViewContentModeScaleAspectFit;
            // 使用sd_webimg粘贴图片
            NSString * imgUrl = photoDM.photos[i];
            NSURL * url = [NSURL URLWithString:imgUrl];
            [imgView sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"placeholderImg.jpeg"]];
            [self.scrollView addSubview:imgView];
        }
        
        
        
    }];
}


// 滑动结束
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    // 根据scrollView.contenOffset值的不同分别给noteTextView和curPageLabel赋值
    CGPoint offset = scrollView.contentOffset;
    int count = offset.x/SCREEN_WIDTH;
    self.curPageLabel.text = [NSString stringWithFormat:@"%d",count+1];
    self.noteTextView.text = self.photoDM.note[count];
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
