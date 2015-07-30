//
//  UserViewController.h
//  Jingbao
//
//  Created by mac on 15/7/18.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^LoginSuccessBlock)(id userInfo);
@interface UserViewController : UIViewController<UITextFieldDelegate>
@property (nonatomic,copy) LoginSuccessBlock successBlock;//登陆成功后回调
@end
