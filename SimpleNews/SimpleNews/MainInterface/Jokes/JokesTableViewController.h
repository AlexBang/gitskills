//
//  JokesTableViewController.h
//  项目
//
//  Created by lanou3g on 15/6/2.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Jokes.h"
@interface JokesTableViewController : UITableViewController<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,retain)NSMutableArray * arr;
@property (nonatomic,retain)Jokes * jokes;
-(void)call;//上拉请求数据方法
@end
