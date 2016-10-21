//
//  Row9ViewController.m
//  OYWorkGit
//
//  Created by Dyang on 16/9/19.
//  Copyright © 2016年 Ouyang. All rights reserved.
//

#import "Row9ViewController.h"

@interface Row9ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) NSArray *dataSource;

@property (nonatomic,strong) UITableView *mainTable;

@property (nonatomic,strong) NSArray *controllerArr;


@end

@implementation Row9ViewController

#pragma mark ========= 属性懒加载 ===========

-(NSArray *)dataSource{
    
    if (!_dataSource) {
        _dataSource = @[@"UIScrollView新增refreshControl"];
    }
    return _dataSource;
}

-(NSArray *)controllerArr{
    
    if (!_controllerArr) {
        _controllerArr = @[@"Row901ViewController"];
    }
    return _controllerArr;
}

-(UITableView *)mainTable{
    
    if (!_mainTable) {
        _mainTable = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _mainTable.delegate = self;
        _mainTable.dataSource =self;
        _mainTable.separatorColor = [UIColor redColor];
    }
    return _mainTable;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.mainTable];
    
}


#pragma mark ========= dataSource ===========

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return  1;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.dataSource.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 40;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"cell"];
    if(cell==nil){
        cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault  reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"%@ --- %ld",self.dataSource[indexPath.row],indexPath.row];
    
    return cell;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    Class class = NSClassFromString(self.controllerArr[indexPath.row]);
    id VC = [class new];
    
    [self.navigationController pushViewController:VC animated:YES];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

@end

