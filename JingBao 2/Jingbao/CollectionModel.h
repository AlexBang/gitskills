//
//  CollectionModel.h
//  Jingbao
//
//  Created by mac on 15/7/10.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CollectionModel : NSObject
@property (nonatomic,assign)NSInteger  goods_id;
@property (nonatomic,copy)NSString * goods_image;
@property (nonatomic,copy)NSString * goods_name;
@property (nonatomic,copy)NSString * goods_promotion_price;

@end
