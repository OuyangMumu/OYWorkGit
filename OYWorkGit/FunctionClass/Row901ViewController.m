//
//  Row9-1ViewController.m
//  OYWorkGit
//
//  Created by Dyang on 16/9/19.
//  Copyright © 2016年 Ouyang. All rights reserved.
//

#import "Row901ViewController.h"

@interface Row901ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView *mainTable;

@end

@implementation Row901ViewController

-(void)click{
    NSLog(@"kkkk");
}
-(UITableView *)mainTable{

    if (!_mainTable) {
        _mainTable = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
        
        _mainTable.delegate = self;
        _mainTable.dataSource = self;
       
        UIRefreshControl *refresh  = [UIRefreshControl new];
        refresh.tintColor = [UIColor grayColor];
        refresh.attributedTitle = [[NSAttributedString alloc]initWithString:@"刷新中" attributes:@{NSForegroundColorAttributeName:[UIColor redColor]}];
        _mainTable.refreshControl = refresh;
        
    }
    return  _mainTable;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.mainTable];

}


-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{

    [scrollView.refreshControl beginRefreshing];
    
}

#pragma mark ========= dataSource ===========

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 10;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 100;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"cell"];
    if(cell==nil){
        cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault      reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = @"textLabel";
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

@end
