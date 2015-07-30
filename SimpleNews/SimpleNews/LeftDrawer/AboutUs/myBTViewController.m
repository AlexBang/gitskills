//
//  myBTViewController.m
//  SimpleNews
//
//  Created by lanou3g on 15/6/4.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "myBTViewController.h"
#import "Size.h"
@interface myBTViewController ()

@end

@implementation myBTViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.navigationItem.title = @"简闻二维码";
    UIBarButtonItem * leftBtn = [[UIBarButtonItem alloc]initWithTitle:@"返回" style:UIBarButtonItemStyleDone target:self action:@selector(clickBtn:)];
    self.navigationItem.leftBarButtonItem = leftBtn;
    
    UIImageView * imgV = [[UIImageView alloc]initWithFrame:CGRectMake(0.31*SCREEN_WIDTH, 0.2*SCREEN_HEIGHT,0.31*SCREEN_WIDTH,0.2*SCREEN_HEIGHT)];
    CGPoint centerPoint = self.view.center;
    centerPoint.y = self.view.center.y - 100;
    imgV.center = centerPoint;
    imgV.backgroundColor = [UIColor whiteColor];
    imgV.image =[UIImage imageNamed:@"code.jpg"];
    [self.view addSubview:imgV];
    
    UILabel * Lable = [[UILabel alloc]initWithFrame:CGRectMake(0.34*SCREEN_WIDTH, 0.4*SCREEN_HEIGHT, 0.375*SCREEN_WIDTH, 0.09*SCREEN_HEIGHT)];
    Lable.text = @"亲，扫一扫有惊喜哦！";
   Lable.font = [UIFont systemFontOfSize:12];
    [self.view addSubview:Lable];
    
    UILabel * lable1 = [[UILabel alloc]initWithFrame:CGRectMake(0.06*SCREEN_WIDTH, 0.56*SCREEN_HEIGHT, 0.9*SCREEN_WIDTH, 0.1*SCREEN_HEIGHT)];
    lable1.text = @"感谢您对我们的大力支持，我们会尽全力做好每项工作，争取将SimpleNews做到最适合任何人群的一款APP，您的支持就是我们最大的动力";
    lable1.numberOfLines = 0;
    lable1.font = [UIFont systemFontOfSize:12];
    [self.view addSubview:lable1];
    
    UILabel * lable2 =[[UILabel alloc]initWithFrame:CGRectMake(0.2*SCREEN_WIDTH, 0.9*SCREEN_HEIGHT, 0.9*SCREEN_WIDTH, 0.1*SCREEN_HEIGHT)];
    lable2.text = @"SimpleNews  版权所有\nCopyright © 2015 - 2015 SimpleNews\nAll Rights Reserved";
    lable2.numberOfLines = 0;
    lable2.font = [UIFont systemFontOfSize:12];
    [self.view addSubview:lable2];
    
    
    
}
- (void)clickBtn:(UIBarButtonItem *)btn
{
    [self dismissViewControllerAnimated:YES completion:nil];
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
