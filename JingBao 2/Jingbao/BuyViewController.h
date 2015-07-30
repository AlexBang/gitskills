//
//  BuyViewController.h
//  Jingbao
//
//  Created by mac on 15/7/21.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BuyViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong)NSData * data;
@property (nonatomic,strong)NSMutableArray * orderArr;
@end
