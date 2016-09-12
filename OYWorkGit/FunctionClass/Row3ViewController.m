//
//  Row3ViewController.m
//  OuyangGaojun
//
//  Created by Dyang on 16/8/26.
//  Copyright © 2016年 Ouyang. All rights reserved.
//

#import "Row3ViewController.h"

@implementation Row3ViewController

singleM(Row3ViewController)


-(void)viewDidLoad{
    [super viewDidLoad];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:@"App Store" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    btn.frame = CGRectMake(100, 100, 100, 40);
    [btn addTarget:self action:@selector(AppStore) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    
    UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn2 setTitle:@"StoreKit" forState:UIControlStateNormal];
    [btn2 setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    btn2.frame = CGRectMake(100, 180, 100, 40);
    [btn2 addTarget:self action:@selector(StoreKit) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn2];
    
    
    OYLog(@"self == %@ \n new === %@",self,[Row3ViewController new]);
    
    
}


-(void)StoreKit{

    //方法2
    SKStoreProductViewController *VC =[SKStoreProductViewController new];
    VC.delegate = self;
    [VC loadProductWithParameters:@{SKStoreProductParameterITunesItemIdentifier:@"1081349653"} completionBlock:^(BOOL result, NSError * _Nullable error) {
        if (error) {
            NSLog(@"错误");
        }else{
            
            [self presentViewController:VC animated:YES completion:^{
                
                NSLog(@"取消");
                
            }];
        }
    }];
    
}


-(void)AppStore{
    
//    方法1
    NSString *str2 = [NSString stringWithFormat: @"itms-apps://itunes.apple.com/WebObjects/MZStore.woa/wa/viewContentsUserReviews?type=Purple+Software&id=%@",@"1081349653"];
    
    if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:str2]]) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:str2]];
    }
    
}

- (void)productViewControllerDidFinish:(SKStoreProductViewController *)viewController {

    [viewController dismissViewControllerAnimated:YES completion:nil];
}


@end
