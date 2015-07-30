//
//  AppDelegate.h
//  SimpleNews
//
//  Created by lanou3g on 15/5/29.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) UIView *curtainV;


+ (AppDelegate *)defaultAppDelegate;
- (void)changeCurtainAlpha;

@end

