//
//  LeftDrawerVC.h
//  SimpleNews
//
//  Created by lanou3g on 15/6/1.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "LLBlurSidebar.h"

@protocol LeftDrawerVCDelegate <NSObject>

- (void)pushCollectFromMainScrollVC;

- (void)layoutNavigationBar;

@end

@interface LeftDrawerVC : LLBlurSidebar

@property (nonatomic,assign)id<LeftDrawerVCDelegate>delegate;

@end
