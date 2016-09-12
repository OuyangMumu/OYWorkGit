//
//  Row5ViewController.m
//  OuyangGaojun
//
//  Created by Dyang on 16/8/26.
//  Copyright © 2016年 Ouyang. All rights reserved.
//  资源地址: http://www.jianshu.com/p/289b44093883

#import "Row5ViewController.h"

@implementation Row5ViewController

-(void)viewDidLoad{
    [super viewDidLoad];
    [[UIApplication  sharedApplication]registerUserNotificationSettings:[UIUserNotificationSettings settingsForTypes: UIUserNotificationTypeBadge | UIUserNotificationTypeSound |UIUserNotificationTypeAlert  categories:nil]];
    
    
//    settingsForTypes 通知需要更改的东西，可以修改多个地方，UIUserNotificationType 枚举：
//    UIUserNotificationTypeNone    = 0,
//    UIUserNotificationTypeBadge   = 1 << 0, //图标标记
//    UIUserNotificationTypeSound   = 1 << 1, //声音
//    UIUserNotificationTypeAlert   = 1 << 2, //提醒
//    
//    categories：用于添加下拉快速回复功能，下面有介绍
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:@"发送通知" forState:UIControlStateNormal];
    
    btn.frame = CGRectMake(100, 100, 100, 40);
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(sendNotification) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
}


-(void)sendNotification{
    UILocalNotification *localNotification = [UILocalNotification new];
    localNotification.hasAction = YES;
    localNotification.alertBody = @"今天不适合敲代码";
    localNotification.alertTitle =  @"title";
    localNotification.userInfo = @{@"userInfo":@"info"};
    localNotification.alertAction = @"滑动回复";
    localNotification.repeatInterval = NSCalendarUnitSecond;
    localNotification.timeZone = [NSTimeZone defaultTimeZone];
   localNotification.fireDate = [NSDate dateWithTimeIntervalSinceNow:3];
    [[UIApplication sharedApplication]presentLocalNotificationNow:localNotification];
        [UIApplication sharedApplication].applicationIconBadgeNumber = 5;
  
    
  
}

//删除通知
-(void)deleteNotification{

    NSArray *notificationArr =[[UIApplication sharedApplication]scheduledLocalNotifications];

    for (UILocalNotification *local in notificationArr) {
        if (local.userInfo) {
             NSLog(@"userInfo ===  %@",local.userInfo);
            [[UIApplication sharedApplication]cancelLocalNotification:local];
            NSLog(@"userInfo ===  %@",local.userInfo);
        }
    }
    
    
}

@end
