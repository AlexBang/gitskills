//
//  LeftDrawerVC.m
//  SimpleNews
//
//  Created by lanou3g on 15/6/1.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "LeftDrawerVC.h"
#import "Size.h"
#import "SDImageCache.h"
#import "CollectTableVC.h"
#import "AppDelegate.h"
#import "myBTViewController.h"

@interface LeftDrawerVC ()

@property (nonatomic, strong)UIView * menuView;


@end

@implementation LeftDrawerVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.menuView = [[UIView alloc]initWithFrame:self.contentView.bounds];
    self.menuView.backgroundColor = [UIColor clearColor];
    [self.contentView addSubview:self.menuView];
    
    [self layoutMenuView];
    
}

- (void)layoutMenuView
{
    UIButton *clearBT = [UIButton buttonWithType:UIButtonTypeSystem];
    clearBT.frame = CGRectMake(90, SCREEN_HEIGHT/12*3.5, 100, 30);
    [clearBT setTitle:@"清除缓存" forState:UIControlStateNormal];
    [clearBT addTarget:self action:@selector(clear) forControlEvents:UIControlEventTouchUpInside];
    [self.menuView addSubview:clearBT];
    
    
    UIImageView *clearView = [[UIImageView alloc]initWithFrame:CGRectMake(60, SCREEN_HEIGHT/12*3.5 -5, 40, 40)];
    clearView.image = [UIImage imageNamed:@"clean.png"];
    [self.menuView addSubview:clearView];
    
    
    UIButton *nightBT = [UIButton buttonWithType:UIButtonTypeSystem];
    nightBT.frame = CGRectMake(90, SCREEN_HEIGHT/12*5.5, 100, 30);
    [nightBT setTitle:@"夜间模式" forState:UIControlStateNormal];
    [nightBT addTarget:self action:@selector(transitionDayOrNight) forControlEvents:UIControlEventTouchUpInside];
    [self.menuView addSubview:nightBT];
    
    
    UIImageView *nightView = [[UIImageView alloc]initWithFrame:CGRectMake(60, SCREEN_HEIGHT/12*5.5-5, 40, 40)];
    nightView.image = [UIImage imageNamed:@"night.png"];
    [self.menuView addSubview:nightView];
    
    
    UIButton *myCollectBT = [UIButton buttonWithType:UIButtonTypeSystem];
    myCollectBT.frame = CGRectMake(90, SCREEN_HEIGHT/12*7.5, 100, 30);
    [myCollectBT setTitle:@"我的收藏" forState:UIControlStateNormal];
    [myCollectBT addTarget:self action:@selector(myCollect) forControlEvents:UIControlEventTouchUpInside];
    [self.menuView addSubview:myCollectBT];
    
    
    UIImageView *myCollectView = [[UIImageView alloc]initWithFrame:CGRectMake(60, SCREEN_HEIGHT/12*7.5-5, 40, 40)];
    myCollectView.image = [UIImage imageNamed:@"collerct.png"];
    [self.menuView addSubview:myCollectView];
    
    
    UIButton *myBT = [UIButton buttonWithType:UIButtonTypeSystem];
    myBT.frame = CGRectMake(90, SCREEN_HEIGHT/12*9.5, 100, 30);
    [myBT setTitle:@"关于我们" forState:UIControlStateNormal];
    [myBT addTarget:self action:@selector(aboutUs) forControlEvents:UIControlEventTouchUpInside];
    [self.menuView addSubview:myBT];
    
    
    UIImageView *myView = [[UIImageView alloc]initWithFrame:CGRectMake(60, SCREEN_HEIGHT/12*9.5-5, 40, 40)];
    myView.image = [UIImage imageNamed:@"our.png"];
    [self.menuView addSubview:myView];
}

- (void)clear
{
    CGFloat byte = [[SDImageCache sharedImageCache]getSize];
    CGFloat KB = byte/1024;
    CGFloat MB = KB/1024;
    CGFloat GB = MB/1024;
    if(KB>1024&&MB<1024){
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:[NSString stringWithFormat:@"清除缓存%.2fMB",MB] message:@"确定要清除缓存吗?" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:@"取消", nil];
        [alertView show];
    }else if(MB>1024){
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:[NSString stringWithFormat:@"清除缓存%.2fG",GB] message:@"确定要清除缓存吗?" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:@"取消", nil];
        [alertView show];
    }else if (KB<1024&&KB!=0){
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:[NSString stringWithFormat:@"清除缓存%.2fKB",KB] message:@"确定要清除缓存吗?" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:@"取消", nil];
        [alertView show];
    }else{
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提示" message:@"没有要清理的缓存" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
        [alertView show];
    }

}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    
    
    if(buttonIndex==0){
        [[SDImageCache sharedImageCache] clearMemory];
        [[SDImageCache sharedImageCache] clearDisk];
        [[SDImageCache sharedImageCache] cleanDisk];
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提示" message:@"清除成功" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alertView show];
    }
    
}


- (void)transitionDayOrNight
{
    static BOOL isNight = NO;
    isNight = [[NSUserDefaults standardUserDefaults]boolForKey:@"isNight"];
    isNight = !isNight;
    [[NSUserDefaults standardUserDefaults]setBool:isNight forKey:@"isNight"];
    
    // 获取appDelegate单例调用appDelegate的changeCurtainAlpha方法
    [[AppDelegate defaultAppDelegate]changeCurtainAlpha];
    
}

- (void)myCollect
{
    if (_delegate && [_delegate respondsToSelector:@selector(pushCollectFromMainScrollVC)]) {
        [_delegate pushCollectFromMainScrollVC];
    }
}

- (void)aboutUs
{
    myBTViewController * aboutUs = [[myBTViewController alloc]init];
    [self showHideSidebar];
    
    UINavigationController * nav = [[UINavigationController alloc]initWithRootViewController:aboutUs];
    
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
