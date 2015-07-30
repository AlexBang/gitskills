//
//  StartAnimationVC.m
//  SimpleNews
//
//  Created by lanou3g on 15/5/29.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "StartAnimationVC.h"

@interface StartAnimationVC ()

@property (nonatomic,strong)UIImageView * animationView;

@end

@implementation StartAnimationVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor clearColor];
    
    [self layoutImgView];
    
    
    
    
}
//布置 ImgView
- (void)layoutImgView
{
    UIImageView * imgView = [[UIImageView alloc]initWithFrame:self.view.bounds];
    
    self.animationView = imgView;
    
    imgView.image = [UIImage imageNamed:@"logo.jpg"];
    
    [self.view addSubview:imgView];
    // 隐藏navigationbar
    [self.navigationController setNavigationBarHidden:YES];
    
    [self performSelector:@selector(loadAnimation) withObject:self afterDelay:2];
    
}
// 添加动画效果
- (void)loadAnimation
{
    [UIView transitionWithView:self.animationView duration:2 options:UIViewAnimationOptionTransitionNone animations:^{
        self.animationView.alpha = 0;
    } completion:^(BOOL finished) {
        // 显示navigation
        [self.navigationController setNavigationBarHidden:NO];
        // 当动画结束退出
        [self.view removeFromSuperview];
        [self.navigationController popToRootViewControllerAnimated:NO];
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
