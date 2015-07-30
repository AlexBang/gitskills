//
//  TagViewController.m
//  SimpleNews
//
//  Created by lanou3g on 15/6/2.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "TagViewController.h"
#import "Size.h"

@interface TagViewController ()

@property (nonatomic, strong)UIView * bottomView;

@end

@implementation TagViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor clearColor];
//    self.view.alpha = 0.5;
    
    // 添加点击手势
    [self addTapGestureRecognizer];
    // 布局scrollView
    [self layoutBottomView];
}
// 给View上添加手势
- (void)addTapGestureRecognizer
{
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap:)];
    [self.view addGestureRecognizer:tap];
}
// 点击事件
- (void)tap:(UITapGestureRecognizer *)tap
{
    [UIView animateWithDuration:0.3 animations:^{
        _scrollView.frame = CGRectMake(0, -96, SCREEN_WIDTH, 160);
    } completion:^(BOOL finished) {
        [self.view removeFromSuperview];
    }];
    if (_delegate && [_delegate respondsToSelector:@selector(layoutNavigationBar)]) {
        [_delegate layoutNavigationBar];
    }
}
// 布置底层的View和scrollView
- (void)layoutBottomView
{
    self.bottomView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    _bottomView.alpha = 0.5;
    _bottomView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_bottomView];
    
    self.scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, -96, SCREEN_WIDTH, 140)];
    _scrollView.bounces = NO;
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.backgroundColor = [UIColor clearColor];
    _scrollView.alpha = 1;
    _scrollView.contentSize = CGSizeMake(SCREEN_WIDTH, 140);
    _scrollView.userInteractionEnabled = YES;
    [self.view addSubview:_scrollView];
    
    UIImageView * backImg = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 360, 140)];
    backImg.alpha = 0.7;
    backImg.contentMode = UIViewContentModeScaleAspectFill;
    backImg.image = [UIImage imageNamed:@"tagBackground.jpg"];
    [self.scrollView addSubview:backImg];
    
    [self layoutTag];
}

// 布置各个tag,同时给各个tag添加点击手势
- (void)layoutTag
{
    
    UIImageView * headlineTag = [[UIImageView alloc]initWithFrame:CGRectMake(25, 20, 60, 100)];
    headlineTag.layer.cornerRadius = 3;
    headlineTag.layer.masksToBounds = YES;
    headlineTag.userInteractionEnabled = YES;
    headlineTag.backgroundColor = [UIColor redColor];
    
    UILabel * headlineLabel = [[UILabel alloc]init];
    headlineLabel.text = @"头条";
    headlineLabel.font = [UIFont fontWithName:@"STHUPO" size:17];
    headlineLabel.textColor = [UIColor whiteColor];
    headlineLabel.frame = CGRectMake(13, 30, 40, 20);
    [headlineTag addSubview:headlineLabel];
    UITapGestureRecognizer * clickHeadline = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(clickHeadline:)];
    [headlineTag addGestureRecognizer:clickHeadline];
    [_scrollView addSubview:headlineTag];
    
    
    UIImageView * sportsTag = [[UIImageView alloc]initWithFrame:CGRectMake(95, 20, 60, 100)];
    sportsTag.layer.cornerRadius = 3;
    sportsTag.layer.masksToBounds = YES;
    sportsTag.userInteractionEnabled = YES;
    sportsTag.backgroundColor = [UIColor grayColor];
    
    UILabel * sportLabel = [[UILabel alloc]init];
    sportLabel.text = @"体育";
    sportLabel.font = [UIFont fontWithName:@"STHUPO" size:17];
    sportLabel.textColor = [UIColor whiteColor];
    sportLabel.frame = CGRectMake(13, 30, 40, 20);
    [sportsTag addSubview:sportLabel];
    UITapGestureRecognizer * clickSports = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(clickSports:)];
    [sportsTag addGestureRecognizer:clickSports];
    [_scrollView addSubview:sportsTag];
    
    
    UIImageView * techTag = [[UIImageView alloc]initWithFrame:CGRectMake(165, 20, 60, 100)];
    techTag.layer.cornerRadius = 3;
    techTag.layer.masksToBounds = YES;
    techTag.userInteractionEnabled = YES;
    techTag.backgroundColor = [UIColor blueColor];
    
    UILabel * techLabel = [[UILabel alloc]init];
    techLabel.text = @"科技";
    techLabel.font = [UIFont fontWithName:@"STHUPO" size:17];
    techLabel.textColor = [UIColor whiteColor];
    techLabel.frame = CGRectMake(13, 30, 40, 20);
    [techTag addSubview:techLabel];
    UITapGestureRecognizer * clickTech = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(clickTech:)];
    [techTag addGestureRecognizer:clickTech];
    [_scrollView addSubview:techTag];
    
    
    UIImageView * carTag = [[UIImageView alloc]initWithFrame:CGRectMake(235, 20, 60, 100)];
    carTag.layer.cornerRadius = 3;
    carTag.layer.masksToBounds = YES;
    carTag.userInteractionEnabled = YES;
    carTag.backgroundColor = [UIColor purpleColor];
    
    UILabel * carLabel = [[UILabel alloc]init];
    carLabel.text = @"汽车";
    carLabel.font = [UIFont fontWithName:@"STHUPO" size:17];
    carLabel.textColor = [UIColor whiteColor];
    carLabel.frame = CGRectMake(13, 30, 40, 20);
    [carTag addSubview:carLabel];
    UITapGestureRecognizer * clickCar = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(clickCar:)];
    [carTag addGestureRecognizer:clickCar];
    [_scrollView addSubview:carTag];
    
    
    UIImageView * funTag = [[UIImageView alloc]initWithFrame:CGRectMake(305, 20, 60, 100)];
    funTag.layer.cornerRadius = 3;
    funTag.layer.masksToBounds = YES;
    funTag.userInteractionEnabled = YES;
    funTag.backgroundColor = [UIColor orangeColor];
    
//    UILabel * funLabel = [[UILabel alloc]init];
//    funLabel.text = @"段子";
//    funLabel.font = [UIFont fontWithName:@"STHUPO" size:17];
//    funLabel.textColor = [UIColor whiteColor];
//    funLabel.frame = CGRectMake(13, 30, 40, 20);
//    [funTag addSubview:funLabel];
//    UITapGestureRecognizer * clickFun = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(clickFun:)];
//    [funTag addGestureRecognizer:clickFun];
//    [_scrollView addSubview:funTag];
//    
}

// 各tag手势事件
- (void)clickHeadline:(UITapGestureRecognizer *)headlineTap
{
    CGPoint offset = CGPointMake(0, -64);
    // 点击tag后通过对应界面所在不同偏移量进行界面的跳转
    [self didchangeTableView:offset];
}

- (void)clickSports:(UITapGestureRecognizer *)sportsTap
{
    CGPoint offset = CGPointMake(SCREEN_WIDTH, -64);
    [self didchangeTableView:offset];
}

- (void)clickTech:(UITapGestureRecognizer *)techTap
{
    CGPoint offset = CGPointMake(2 * SCREEN_WIDTH, -64);
    [self didchangeTableView:offset];
}

- (void)clickCar:(UITapGestureRecognizer *)carTap
{
    CGPoint offset = CGPointMake(3 * SCREEN_WIDTH, -64);
    [self didchangeTableView:offset];
}

- (void)clickFun:(UITapGestureRecognizer *)funTap
{
    CGPoint offset = CGPointMake(4 * SCREEN_WIDTH, -64);
    [self didchangeTableView:offset];
}

// 完成跳转tableView
- (void)didchangeTableView:(CGPoint)offset
{
    // 点击后tagView动态收回
    [UIView animateWithDuration:0.3 animations:^{
        _scrollView.frame = CGRectMake(0, -96, SCREEN_WIDTH, 160);
    } completion:^(BOOL finished) {
        [self.view removeFromSuperview];
    }];
    // 调用代理MainScrollView所遵循的协议方法重新布置navigationBar
    [_delegate layoutNavigationBar];
    // 调用代理MainScrollView所遵循的协议方法切换不同的界面
    [_delegate changeTabelView:offset];
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
