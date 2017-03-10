//

//  ViewController.m
//  OuyangGaojun
//
//  Created by Dyang on 16/8/25.
//  Copyright © 2016年 Ouyang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) NSArray *dataSource;

@property (nonatomic,strong) UITableView *mainTable;

@property (nonatomic,strong) NSArray *controllerArr;


@end

@implementation ViewController

#pragma mark ========= 属性懒加载 ===========

-(NSArray *)dataSource{

    if (!_dataSource) {
        _dataSource = @[@"改变一句话中的某些字的颜色1",@"正则表达式2",@"APP Stroe 评分  ||  单例3",@"UITableView分割线4",@"注册通知5",@"SDWebImage6",@"拦截按钮事件7",@"pop下拉弹框8",@"iOS 10 新特性9",@"控制器重复跳转问题10",@"Runtime11",@"获取视图之上的控制器12",@"删除NSUserDefaults所有记录13",@"JDStatusBarNotification14"];
    }
    return _dataSource;
}

-(NSArray *)controllerArr{

    if (!_controllerArr) {
        _controllerArr = @[@"Row1ViewController",@"Row2ViewController",@"Row3ViewController",@"Row4ViewController",@"Row5ViewController",@"Row6ViewController",@"Row7ViewController",@"Row8ViewController",@"Row9ViewController",@"Row10ViewController",@"Row11ViewController",@"Row12ViewController",@"Row13ViewController",@"Row14ViewController"];
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
    self.view.backgroundColor = [UIColor whiteColor];
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
    cell.textLabel.text = [NSString stringWithFormat:@"%@ --- %ld",self.dataSource[indexPath.row],indexPath.row+1];
   
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
