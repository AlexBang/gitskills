//
//  TagViewController.h
//  SimpleNews
//
//  Created by lanou3g on 15/6/2.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TagViewControllerDelegate <NSObject>

- (void)layoutNavigationBar;

- (void)changeTabelView:(CGPoint)offset;

@end

@interface TagViewController : UIViewController

@property (nonatomic, strong)id<TagViewControllerDelegate>delegate;

@property (nonatomic, strong)UIScrollView * scrollView;

@end
