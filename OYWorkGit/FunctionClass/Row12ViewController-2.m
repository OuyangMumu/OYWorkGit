//
//  Row12ViewController-2.m
//  OYWorkGit
//
//  Created by Dyang on 2016/11/22.
//  Copyright © 2016年 Ouyang. All rights reserved.
//

#import "Row12ViewController-2.h"
#import "UIView+OYView.h"

@interface Row12ViewController_2 ()

@property (nonatomic,strong) UIButton *subV;

@end

@implementation Row12ViewController_2

-(UIButton *)subV{

    if (!_subV) {
        _subV = [UIButton buttonWithType:UIButtonTypeCustom];
        _subV.frame = CGRectMake(100, 100, 100, 100);
       _subV.backgroundColor = [UIColor redColor];
        [_subV addTarget:self action:@selector(viewClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _subV;
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
  
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor  = [UIColor greenColor];
    [self.view addSubview:self.subV];
}

-(void)viewClick{
  NSLog(@"%@",[self.subV viewController:@"Row12ViewController"]);
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
