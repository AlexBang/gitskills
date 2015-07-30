//
//  PhotoDetailModel.h
//  SimpleNews
//
//  Created by lanou3g on 15/5/31.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PhotoDetailModel : NSObject

@property (nonatomic,strong)NSMutableArray * note;

@property (nonatomic,strong)NSString * imgsum;

@property (retain, nonatomic)NSMutableArray * photos;

@property (retain, nonatomic)NSString * setname;

@property (retain, nonatomic)NSString * cover;

@end
