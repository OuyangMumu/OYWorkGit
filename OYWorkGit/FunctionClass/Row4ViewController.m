//

//  Row4ViewController.m
//  OuyangGaojun
//
//  Created by Dyang on 16/8/25.
//  Copyright © 2016年 Ouyang. All rights reserved.
//

// 资源地址   http://www.jianshu.com/p/1274343055a7

#import "Row4ViewController.h"

@interface Row4ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView *mainTable;

@end

@implementation Row4ViewController

#pragma mark ========= 属性懒加载 ===========

-(UITableView *)mainTable{
    
    if (!_mainTable) {
        _mainTable = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _mainTable.delegate = self;
        _mainTable.dataSource =self;
        _mainTable.separatorColor = [UIColor redColor];
        _mainTable.separatorInset = UIEdgeInsetsMake(0, 40, 0, 0);
        
        
//     1.   UITableView设置的是所有cell的separatorInset，这有点类似              rowHeight。我们可以通过table view设置全局cell的inset，也可以单独为某个cell指定inset，后者的优先级大于前者。separatorInset默认为UIEdgeInsetsMake(0.0, 15.0, 0.0, 0.0)
//      2.  除了全局设置，UITableView额外设置table view底部（无cell部分）的分割线
//        
//
        
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
    
    return 10;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 40;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"cell"];
    if(cell==nil){
        cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault      reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"row - %ld",indexPath.row];
    cell.separatorInset = UIEdgeInsetsMake(0, 5*indexPath.row, 0, 0);
    cell.layoutMargins = UIEdgeInsetsZero;
    
    //    iOS8之后，加入了layoutMargins属性，layoutMargins定义了视图边界与子视图边界之间间距，非控制器根视图默认为UIEdgeInsetsMake(8.0, 8.0, 8.0, 8.0)，即上下左右各8个单位长度。控制器根视图默认为UIEdgeInsetsMake(0.0, 16.0, 0.0, 16.0)或者UIEdgeInsetsMake(0.0, 20.0, 0.0, 20.0)，取决于当前size class。我们可以改变非根视图的layoutMargins，但是不可以改变根视图的layoutMargins，它由系统设置管理。
    
    
//    iOS8的时代，不但需要设置separatorInset为UIEdgeInsetsZero，而且需要保证cell的layoutMargins为UIEdgeInsetsZero。
    
    //    这里有个深坑，我在之前工程仅仅设置了separatorInset和layoutMargins为UIEdgeInsetsZero，确实有效，但是这次同样的设置，依旧留有15个单位长度，到底怎么回事。看了下文档，发现与layoutMargins一起加入iOS8豪华午餐的还有一个属性
    
    /**
     *  preservesSuperviewLayoutMargins 表明当前视图是否保留父视图的margins，设置为YES，如果当前视图的margins小于父视图的margins，那么当前视图使用父视图的margins，默认为NO
     */
    
    cell.preservesSuperviewLayoutMargins = NO;
    
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
   
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

@end
