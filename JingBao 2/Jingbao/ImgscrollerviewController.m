//
//  ImgscrollerviewController.m
//  Jingbao
//
//  Created by mac on 15/7/21.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "ImgscrollerviewController.h"
#import "Size.h"
#import "UIImageView+WebCache.h"
#import "NetworkHandler.h"
#import "DetailModel.h"
@implementation ImgscrollerviewController
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    NetworkHandler * networkH = [[NetworkHandler alloc]init];
    [networkH getGoodListWithURL:[NSURL URLWithString:@"http://10.0.0.11/shopnc/mobile/index.php?act=goods&op=goods_detail&goods_id=49"] withkey:@"goods_image" competion:^(id list) {
        self.imgUrlArr = list;
        
        UIScrollView * scrollerView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 50*SCREEN_HEIGHT/1136, SCREEN_WIDTH, 800*SCREEN_HEIGHT/1136)];
        
        scrollerView.contentSize = CGSizeMake(SCREEN_WIDTH*_imgUrlArr.count, SCREEN_HEIGHT*500/1136);
        
        scrollerView.pagingEnabled = YES;
        scrollerView.delegate = self;
        self.scrollerView = scrollerView;
        
        scrollerView.maximumZoomScale = 2.0;
        scrollerView.minimumZoomScale = 0.5;
        self.view.backgroundColor = [UIColor blackColor];
        
        [self.view addSubview:scrollerView];
        for (int i = 0; i < self.imgUrlArr.count; i++) {
            self.imgView   = [[UIImageView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH*i, 300*SCREEN_HEIGHT/1136, SCREEN_WIDTH, SCREEN_HEIGHT*500/1136)];
            NSString * string = self.imgUrlArr[i];
            
            
            [_imgView sd_setImageWithURL:[NSURL URLWithString:string] placeholderImage:[UIImage imageNamed:@"1.png"]];
            
            [ scrollerView addSubview:_imgView];
           
        }
           }];
    
    
    
}
- (void)setDetaiModel:(DetailModel *)detaiModel
{
    if (_detaiModel != detaiModel) {
        _detaiModel = detaiModel;
    }
}
//告诉scrollview要缩放的是哪个子控件
- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return _imgView;
}

@end
