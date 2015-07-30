//
//  RootTabBarController.m
//  Jingbao
//
//  Created by mac on 15/7/7.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "RootTabBarController.h"
#import "FirstTableViewController.h"
#import "ShoppingViewController.h"
#import "NewsTableViewController.h"
#import "UserViewController.h"

#import "CategoryViewController.h"
@interface RootTabBarController ()
//添加controller
- (void)g_setupControllers;
@end

@implementation RootTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self g_setupControllers];
        // Do any additional setup after loading the view.
}
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}
//添加controller
- (void)g_setupControllers
{
    //首页
    FirstTableViewController  * firstVC = [[FirstTableViewController alloc]init];
    UINavigationController * firstNC = [[UINavigationController alloc] initWithRootViewController:firstVC];
    
    [firstNC.navigationBar setBackgroundImage:[UIImage imageNamed:@"bg_nav"] forBarMetrics:UIBarMetricsDefault];
    firstNC.tabBarItem.title = @"首页";
    firstNC.tabBarItem.image = [UIImage imageNamed:@"activity"];
    //分类
    CategoryViewController * categoryVC = [[CategoryViewController alloc]init];
    UINavigationController * categoryNC = [[UINavigationController alloc]initWithRootViewController:categoryVC];
    [categoryNC.navigationBar setBackgroundImage:[UIImage imageNamed:@""] forBarMetrics:UIBarMetricsDefault];
    categoryNC.tabBarItem.title = @"分类";
    categoryNC.tabBarItem.image = [UIImage imageNamed:@""];
    //消息
    NewsTableViewController * newsVC = [[NewsTableViewController alloc]initWithStyle:UITableViewStylePlain];
    UINavigationController * newsNC = [[UINavigationController alloc]initWithRootViewController:newsVC];
    newsNC.tabBarItem.title = @"消息";
    newsNC.tabBarItem.image = [UIImage imageNamed:@""];
    //购物车
    ShoppingViewController * shoppingVC = [[ShoppingViewController alloc]init];
    UINavigationController * shoppingNC = [[UINavigationController alloc]initWithRootViewController:shoppingVC];
    shoppingNC.tabBarItem.title = @"购物车";
    shoppingNC.tabBarItem.image = [UIImage imageNamed:@""];
    //我的
    UserViewController * userVC = [[UserViewController alloc]init];
    UINavigationController * userNC = [[UINavigationController alloc]initWithRootViewController:userVC];
    userNC.tabBarItem.title = @"我的";
    userNC.tabBarItem.image = [UIImage imageNamed:@""];
    self.viewControllers = @[firstNC,categoryNC,newsNC,shoppingNC,userNC];
    
    [self setTabelView];
    
}
- (void)setTabelView
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
