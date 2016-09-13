//
//  Row7ViewController.m
//  OYWorkGit
//
//  Created by Dyang on 16/9/13.
//  Copyright © 2016年 Ouyang. All rights reserved.
//

#import "Row7ViewController.h"
#import "OY_ActionStopButton.h"

@interface Row7ViewController ()

@end

@implementation Row7ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    OY_ActionStopButton *but1 = [OY_ActionStopButton buttonWithType:UIButtonTypeCustom];
    but1.isNeedStop = YES;
    but1.frame = CGRectMake(100, 100, 100, 40);
    [but1 setTitle:@"YES" forState:UIControlStateNormal];
    [but1 setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
    [but1 addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:but1];
    
    
    OY_ActionStopButton *but2 = [OY_ActionStopButton buttonWithType:UIButtonTypeCustom];
    but2.frame = CGRectMake(100, 200, 100, 40);
    [but2 setTitle:@"NO" forState:UIControlStateNormal];
    [but2 setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
    [but2 addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:but2];
    
    
}

-(void)buttonClick:(UIButton *)sender{

    NSLog(@"执行完毕%@",sender);
}
@end
