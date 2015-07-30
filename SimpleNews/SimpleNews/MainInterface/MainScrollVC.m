//
//  MainScrollVC.m
//  SimpleNews
//
//  Created by lanou3g on 15/5/29.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "MainScrollVC.h"
#import "Size.h"
#import "StartAnimationVC.h"
#import "TitleView.h"
#import "HeadlineVC.h"
#import "SportsVC.h"
#import "TechnologyVC.h"
#import "CarVC.h"
#import "CollectTableVC.h"
#import "JokesTableViewController.h"

@interface MainScrollVC ()

@property (nonatomic, assign)CGFloat oldOffsetX;

@property (nonatomic, strong)TitleView * titleView;

@property (nonatomic, strong)LeftDrawerVC * leftDrawer;

@property (nonatomic, strong)UIScreenEdgePanGestureRecognizer * edgePanGR;

@property (nonatomic, strong)TagViewController * tagVC;

@end

@implementation MainScrollVC




- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // 调用布置titleView
    [self layoutTitleView];
    // 调用布置Scrollview
    [self layoutScrollView];
    
    // 加载头条界面
    HeadlineVC * headlineVC = [[HeadlineVC alloc]init];
    CGRect frame = headlineVC.view.frame;
    frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    headlineVC.view.frame = frame;
    [self.scrollView addSubview:headlineVC.view];
    [self addChildViewController:headlineVC];
    
    [self createLeftDrawer];
    [self layoutNavigationBar];
    
    
    
}

- (void)viewDidAppear:(BOOL)animated
{
    [self layoutNavigationBar];
}




// 布置scrollView
- (void)layoutScrollView
{
    UIScrollView * scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    self.scrollView = scrollView;
    scrollView.contentSize = CGSizeMake(SCREEN_WIDTH*4, SCREEN_HEIGHT-64);

    scrollView.pagingEnabled = YES;
    scrollView.bounces = NO;
    scrollView.delegate = self;
//    scrollView.showsHorizontalScrollIndicator = NO;
    [self.view addSubview:scrollView];
}

// 调用代理的scroll已经滚动方法用于切换不同界面
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGPoint offset = scrollView.contentOffset;
    
    // 调用页面切换方法
    [self transitionTableView:offset];
    
}

// tagViewController代理方法用于当点击不同tag时切换不同界面
- (void)changeTabelView:(CGPoint)offset
{
//    int count = offset.x / SCREEN_WIDTH;
    [UIView animateWithDuration:0.2 animations:^{
        _scrollView.contentOffset = offset;
    } completion:nil];
    
    [self transitionTableView:offset];
}

// 切换不同界面
- (void)transitionTableView:(CGPoint)offset
{
    if (offset.x == 0) {
        // 改变pageControl的值
        self.titleView.titlePC.currentPage = 0;
        // 改变scrollView的偏移量量
        CGPoint point = self.titleView.titleSV.contentOffset;
        point.x = 0;
        self.titleView.titleSV.contentOffset = point;
        
    }else if(offset.x == SCREEN_WIDTH){
        // 改变pageControl的值
        self.titleView.titlePC.currentPage = 1;
        // 改变scrollView的偏移量量
        CGPoint point = self.titleView.titleSV.contentOffset;
        point.x = 40;
        self.titleView.titleSV.contentOffset = point;
        
    }else if(offset.x == 2*SCREEN_WIDTH){
        // 改变pageControl的值
        self.titleView.titlePC.currentPage = 2;
        // 改变scrollView的偏移量量
        CGPoint point = self.titleView.titleSV.contentOffset;
        point.x = 80;
        self.titleView.titleSV.contentOffset = point;
        
    }else if(offset.x == 3*SCREEN_WIDTH){
        // 改变pageControl的值
        self.titleView.titlePC.currentPage = 3;
        // 改变scrollView的偏移量量
        CGPoint point = self.titleView.titleSV.contentOffset;
        point.x = 120;
        self.titleView.titleSV.contentOffset = point;
        
    }
//    else if(offset.x == 4*SCREEN_WIDTH){
//        // 改变pageControl的值
//        self.titleView.titlePC.currentPage = 4;
//        // 改变scrollView的偏移量量
//        CGPoint point = self.titleView.titleSV.contentOffset;
//        point.x = 160;
//        self.titleView.titleSV.contentOffset = point;
//        
//    }
    
    
    // 通过scrollView上子视图个数和偏移量的不同加载不同界面
    NSArray * arr = _scrollView.subviews;
    if (arr.count == 3 && offset.x > SCREEN_WIDTH/2) {
        SportsVC * sportVC = [[SportsVC alloc]init];
        CGRect frame = sportVC.view.frame;
        frame = CGRectMake(SCREEN_WIDTH, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
        sportVC.view.frame = frame;
        [self.scrollView addSubview:sportVC.view];
        [self addChildViewController:sportVC];
        // 改变pageControl的值
        self.titleView.titlePC.currentPage = 1;
        arr = _scrollView.subviews;
    }if (arr.count == 4 && offset.x > 3*SCREEN_WIDTH/2) {
        TechnologyVC * technologyVC = [[TechnologyVC alloc]init];
        CGRect frame = technologyVC.view.frame;
        frame = CGRectMake(2*SCREEN_WIDTH, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
        technologyVC.view.frame = frame;
        [self.scrollView addSubview:technologyVC.view];
        [self addChildViewController:technologyVC];
        arr = _scrollView.subviews;
    }if (arr.count == 5 && offset.x > 5*SCREEN_WIDTH/2) {
        CarVC * carVC = [[CarVC alloc]init];
        CGRect frame = carVC.view.frame;
        frame = CGRectMake(3*SCREEN_WIDTH, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
        carVC.view.frame = frame;
        [self.scrollView addSubview:carVC.view];
        [self addChildViewController:carVC];
        arr = _scrollView.subviews;
    }
//    if (arr.count == 6 && offset.x > 7*SCREEN_WIDTH/2) {
//        JokesTableViewController * jokesVC = [[JokesTableViewController alloc]init];
//        CGRect frame = jokesVC.view.frame;
//        frame = CGRectMake(4*SCREEN_WIDTH, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
//        jokesVC.view.frame = frame;
//        [self.scrollView addSubview:jokesVC.view];
//        [self addChildViewController:jokesVC];
//        arr = _scrollView.subviews;
//    }
}

// 加载开机动画界面
- (void)loadStartAnimation
{
    StartAnimationVC * startAVC = [[StartAnimationVC alloc]init];
    [self.view addSubview:startAVC.view];
    [self addChildViewController:startAVC];
    [self.view bringSubviewToFront:startAVC.view];
}

// 布置titleView
- (void)layoutTitleView
{
    // 将navigationBar上原有titleView改为scrollView
    TitleView * titleV = [[TitleView alloc]initWithFrame:CGRectMake(0, 0, 40, 40)];
    self.titleView = titleV;
    
    self.navigationItem.titleView = titleV;
    
}


// 使用三方小model创建抽屉
- (void)createLeftDrawer
{
    
    _leftDrawer = [[LeftDrawerVC alloc]init];
    [_leftDrawer setBgRGB:0x000000];
    _leftDrawer.delegate = self;
    _leftDrawer.view.frame = self.view.bounds;
    [self.view addSubview:_leftDrawer.view];
    
}


// 布置navigationbar
- (void)layoutNavigationBar
{

    if ([_leftDrawer isSidebarShown]) {
        [_leftDrawer showHideSidebar];
    }
    
    
    UIBarButtonItem * leftBtn = [[UIBarButtonItem alloc]initWithImage:[[UIImage imageNamed:@"menu_btn_s.png"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(popupLeftDrawer)];
    self.navigationItem.leftBarButtonItem = leftBtn;
    
    UIBarButtonItem * rightBtn = [[UIBarButtonItem alloc]initWithImage:[[UIImage imageNamed:@"down.png"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(popupNavigationInterface)];
    self.navigationItem.rightBarButtonItem = rightBtn;
    
}

- (void)popupLeftDrawer
{
    // 如果上tagView为显示将其收回
    [UIView animateWithDuration:0.3 animations:^{
        _tagVC.scrollView.frame = CGRectMake(0, -96, SCREEN_WIDTH, 140);
    } completion:^(BOOL finished) {
        UIBarButtonItem * rightBtn = [[UIBarButtonItem alloc]initWithImage:[[UIImage imageNamed:@"down.png"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(popupNavigationInterface)];
        self.navigationItem.rightBarButtonItem = rightBtn;
        [_tagVC.view removeFromSuperview];
    }];
    // 显示左抽屉
    [_leftDrawer showHideSidebar];
    UIBarButtonItem * leftBtn = [[UIBarButtonItem alloc]initWithImage:[[UIImage imageNamed:@"menu_btn.png"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(layoutNavigationBar)];
    self.navigationItem.leftBarButtonItem = leftBtn;
    
}

- (void)popupNavigationInterface
{
    // 如果左抽屉为显示将其收回
    if ([_leftDrawer isSidebarShown]) {
        UIBarButtonItem * leftBtn = [[UIBarButtonItem alloc]initWithImage:[[UIImage imageNamed:@"menu_btn_s.png"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(popupLeftDrawer)];
        self.navigationItem.leftBarButtonItem = leftBtn;
        [_leftDrawer showHideSidebar];
    }
    // 显示上tagView
    self.tagVC = [[TagViewController alloc]init];
    [self.view addSubview:_tagVC.view];
    _tagVC.delegate = self;
    // 添加动画
    [UIView beginAnimations:@"topAnimation" context:nil];
    [UIView setAnimationDuration:0.3];
    
    _tagVC.scrollView.frame = CGRectMake(0, 64, SCREEN_WIDTH, 140);
    
    [UIView commitAnimations];
    
    UIBarButtonItem * rightBtn = [[UIBarButtonItem alloc]initWithImage:[[UIImage imageNamed:@"up.png"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(cancelTagVC)];

    self.navigationItem.rightBarButtonItem = rightBtn;
    
}

- (void)cancelTagVC
{
    [UIView animateWithDuration:0.3 animations:^{
        _tagVC.scrollView.frame = CGRectMake(0, -96, SCREEN_WIDTH, 160);
    } completion:^(BOOL finished) {
        [_tagVC.view removeFromSuperview];
    }];
    [self layoutNavigationBar];
}



// 实现leftDrawerVC代理方法
- (void)pushCollectFromMainScrollVC
{
    [_leftDrawer showHideSidebar];
    CollectTableVC * collectTVC = [[CollectTableVC alloc]init];
    UINavigationController * nav = [[UINavigationController alloc]initWithRootViewController:collectTVC];
    [self presentViewController:nav animated:YES completion:nil];
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
