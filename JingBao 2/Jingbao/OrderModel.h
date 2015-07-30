//
//  OrderModel.h
//  Jingbao
//
//  Created by mac on 15/7/25.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OrderModel : NSObject
@property (nonatomic,assign)int cart_id;
@property (nonatomic,assign)int buyer_id;
@property (nonatomic,assign)int store_id;
@property (nonatomic,copy)NSString * store_name;
@property (nonatomic,copy)NSString * goods_name;
@property (nonatomic,assign)int goods_id;
@property (nonatomic,copy)NSString * goods_price;
@property (nonatomic,assign)int goods_num;
@property (nonatomic,copy)NSString * goods_image;
@property (nonatomic,assign)int bl_id;
@property (nonatomic,copy)NSString * state;
@property (nonatomic,copy)NSString * storage_state;
@property (nonatomic,copy)NSString * goods_commonid;
@property (nonatomic,assign)int  gc_id;
@property (nonatomic,assign)int transport_id;
@property (nonatomic,copy)NSString * goods_freight;
@property (nonatomic,copy)NSString * goods_vat;
@property (nonatomic,copy)NSString * goods_storage;
@property (nonatomic,copy)NSString * goods_storage_alarm;
@property (nonatomic,copy)NSString * is_fcode;
@property (nonatomic,copy)NSString * have_gift;
@property (nonatomic,copy)NSString * groupbuy_info;
@property (nonatomic,copy)NSString * xianshi_info;
@property (nonatomic,copy)NSString * goods_total;
@property (nonatomic,copy)NSString * goods_image_url;

@end
