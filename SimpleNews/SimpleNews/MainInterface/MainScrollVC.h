//
//  MainScrollVC.h
//  SimpleNews
//
//  Created by lanou3g on 15/5/29.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LeftDrawerVC.h"
#import "TagViewController.h"

@interface MainScrollVC : UIViewController<UIScrollViewDelegate,LeftDrawerVCDelegate,TagViewControllerDelegate>

@property (nonatomic,strong)UIScrollView * scrollView;

@end
