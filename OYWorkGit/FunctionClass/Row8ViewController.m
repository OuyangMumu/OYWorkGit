//
//  Row8ViewController.m
//  OYWorkGit
//
//  Created by Dyang on 16/9/18.
//  Copyright © 2016年 Ouyang. All rights reserved.
//

#import "Row8ViewController.h"
#import "OY_PopTableView.h"

@interface Row8ViewController ()

@end

@implementation Row8ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *addBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 30, 40)];
    [addBtn setImage:[UIImage imageNamed:@"add-group"] forState:UIControlStateNormal];
    [addBtn setImageEdgeInsets:UIEdgeInsetsMake(0, 5, 0, -10)];
    [addBtn addTarget:self action:@selector(addMenu) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:addBtn];
}

-(void)addMenu{
    
      [OY_PopTableView show:self.navigationItem.rightBarButtonItem.customView direction:DirectionTypeDown icons:@[@"add_circle",@"add_help",@"add_like",@"add_details"] titles:@[@"学习圈子",@"常见问题",@"课程点赞",@"课程详情"]];
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
