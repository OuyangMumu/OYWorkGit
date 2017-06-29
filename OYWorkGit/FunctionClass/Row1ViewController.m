//
//  Row1ViewController.m
//  OuyangGaojun
//
//  Created by Dyang on 16/8/25.
//  Copyright © 2016年 Ouyang. All rights reserved.
//

#import "Row1ViewController.h"


@interface Row1ViewController ()

@end

@implementation Row1ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   self.view.backgroundColor = [UIColor whiteColor];
   UILabel *lab              = [[UILabel alloc]initWithFrame:CGRectMake(10, 100, 300, 40)];

   NSString *str             = @"我的你的他的和他的你的我的";
   NSString *subStr          = @"你的";

   NSMutableAttributedString *mutStr = [NSMutableAttributedString ls_changeCorlorWithColor:[UIColor redColor] TotalString:str SubStringArray:@[subStr]];

   lab.attributedText                = mutStr;

    [self.view addSubview:lab];

}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
