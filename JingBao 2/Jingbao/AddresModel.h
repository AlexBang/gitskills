//
//  AddresModel.h
//  Jingbao
//
//  Created by mac on 15/7/28.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AddresModel : NSObject
@property (nonatomic,assign)int address_id;
@property (nonatomic,assign)int member_id;
@property (nonatomic,copy)NSString * true_name;
@property (nonatomic,assign)int area_id;
@property (nonatomic,assign)int city_id;
@property (nonatomic,copy)NSString * area_info;
@property (nonatomic,copy)NSString * address;
@property (nonatomic,copy)NSString * tel_phone;
@property (nonatomic,copy)NSString * mob_phone;
@property (nonatomic,copy)NSString * is_default;
@end
