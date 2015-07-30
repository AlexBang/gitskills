//
//  GoodslistModel.h
//  Jingbao
//
//  Created by mac on 15/7/14.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GoodslistModel : NSObject
@property (nonatomic,copy)NSString * evaluation_count;
@property (nonatomic,copy)NSString * evaluation_good_star;
@property (nonatomic,assign)NSInteger goods_id;
@property (nonatomic,copy)NSString * goods_image;
@property (nonatomic,copy)NSString * goods_image_url;
@property (nonatomic,copy)NSString * goods_marketprice;
@property (nonatomic,copy)NSString * goods_name;
@property (nonatomic,copy)NSString * goods_price;
@property (nonatomic,copy)NSString * goods_salenum;
@property (nonatomic,copy)NSString * group_flag;
@property (nonatomic,copy)NSString * have_gift;
@property (nonatomic,copy)NSString * is_fcode;
@property (nonatomic,copy)NSString * is_presell;
@property (nonatomic,copy)NSString * is_virtual;
@property (nonatomic,copy)NSString * xianshi_flag;
@end
