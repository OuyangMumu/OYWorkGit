//
//  Row10ViewController.m
//  OYWorkGit
//
//  Created by Dyang on 16/9/19.
//  Copyright © 2016年 Ouyang. All rights reserved.
//

#import "Row10ViewController.h"

@interface Row10ViewController ()

@end

@implementation Row10ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = OYRandomColor;
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeContactAdd];
    [button addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
    button.frame = CGRectMake(100, 100, 50, 50);
    [self.view addSubview:button];
    
}

-(void)buttonClick{
    Row10ViewController *VC = [Row10ViewController new];
    [self.navigationController pushViewController:VC animated:YES];

}

-(void)buttonClick:(UIButton *)sender{
    
    NSLog(@"self = %@,  sender == %@", self,sender);
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
