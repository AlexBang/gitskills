//
//  AppDelegate.m
//  SimpleNews
//
//  Created by lanou3g on 15/5/29.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "AppDelegate.h"
#import "StartAnimationVC.h"
#import "MainScrollVC.h"
#import "LeftDrawerVC.h"
#import "AFHTTPRequestOperationManager.h"


@interface AppDelegate ()



@end

@implementation AppDelegate

static AppDelegate * _appDelegate;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    
    
    
    [[UINavigationBar appearance]setBarTintColor:[UIColor colorWithRed:0.19 green:0.78 blue:1 alpha:0.8]];
    
    

    // 调用创建Navigation
    [self createNavigation];
    
    // 判断网络状况
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        if(status == AFNetworkReachabilityStatusNotReachable){
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提示" message:@"网络连接中断，请检查网络" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
            [alertView show];
        }else if(status == AFNetworkReachabilityStatusReachableViaWiFi){
            NSLog(@"网络链接！");
        }
    }];
    
    
    
    [self.window makeKeyAndVisible];
    
    // 调用白夜幕布
    [self loadTopCurtain];
    
    StartAnimationVC * startAVC = [[StartAnimationVC alloc]init];
    [self.window addSubview:startAVC.view];
    
    // 单例赋值
    _appDelegate = self;
    
    return YES;
}

// 创建Navigation
- (void)createNavigation
{
    
    LeftDrawerVC * leftVC = [[LeftDrawerVC alloc]init];
    MainScrollVC * mainVC = [[MainScrollVC alloc]init];
    NSArray * arr = [NSArray arrayWithObjects:mainVC, nil];
    UINavigationController * nav = [[UINavigationController alloc]initWithRootViewController:leftVC];
    nav.viewControllers = arr;
    
    self.window.rootViewController = nav;
    [self.window makeKeyAndVisible];
    NSLog(@"添加了一句话");
    
}

// 加载幕布
- (void)loadTopCurtain
{
    
    self.curtainV = [[UIView alloc]initWithFrame:self.window.bounds];
    
    self.curtainV.userInteractionEnabled = NO;
    
    [self.window addSubview:_curtainV];
//    [self.window bringSubviewToFront:_curtainV];
    [self changeCurtainAlpha];
}

// 改变幕布颜色和透明度
- (void)changeCurtainAlpha
{
    BOOL isNight = [[NSUserDefaults standardUserDefaults] boolForKey:@"isNight"];
    if (isNight)
    {
        [UIView performWithoutAnimation:^{
            _curtainV.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5];
            NSLog(@"我修改了一个文件");
        }];
    }else
    {
        [UIView performWithoutAnimation:^{
            _curtainV.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0];
        }];
    }
}


// appDelegate单例
+ (AppDelegate *)defaultAppDelegate
{
    return _appDelegate;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
