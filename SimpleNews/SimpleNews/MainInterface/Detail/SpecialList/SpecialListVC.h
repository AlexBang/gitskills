//
//  SpecialListVC.h
//  SimpleNews
//
//  Created by lanou3g on 15/5/31.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "News.h"

@interface SpecialListVC : UIViewController<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong)News * news;

@end
