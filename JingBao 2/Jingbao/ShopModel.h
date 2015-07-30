//
//  ShopModel.h
//  Jingbao
//
//  Created by mac on 15/7/22.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ShopModel : NSObject
@property (nonatomic,copy)NSString * avatar;
@property (nonatomic,assign)NSInteger member_id;
@property (nonatomic,copy)NSString * member_name;
@property (nonatomic,assign)NSInteger store_id;
@property (nonatomic,copy)NSString * store_name;
@end
