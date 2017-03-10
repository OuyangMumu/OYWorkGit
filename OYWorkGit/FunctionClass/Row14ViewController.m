//
//  Row14ViewController.m
//  OYWorkGit
//
//  Created by Dyang on 2016/11/25.
//  Copyright © 2016年 Ouyang. All rights reserved.
//

#import "Row14ViewController.h"
#import "JDStatusBarNotification.h"
@interface Row14ViewController ()

@end

@implementation Row14ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



- (IBAction)buttonClick:(UIButton *)sender {
    
    switch (sender.tag) {
        case 1:
        {
       //1
//        UIView *view = [JDStatusBarNotification  showWithStatus:@"只是文字"];
//            view.backgroundColor = [UIColor redColor];
            
            //2
            [JDStatusBarNotification showWithStatus:@"不同状态下的提示" styleName:JDStatusBarStyleWarning];
        }
            break;
            
        case 2:{
        
            [JDStatusBarNotification showWithStatus:@"自动消息是提示消息" dismissAfter:2.0f];
        }
            break;
            
        case 3:{
        [JDStatusBarNotification showWithStatus:@"自动消息是提示消息" dismissAfter:2.0f];
            
            [JDStatusBarNotification showActivityIndicator:YES indicatorStyle:UIActivityIndicatorViewStyleGray];
        }
            break;
            
        case 4:{
            [JDStatusBarNotification showWithStatus:@"自动消息是提示消息"];
            
            [JDStatusBarNotification showProgress:0.9];
        }
            break;
            
        default:
            break;
    }


}
@end
