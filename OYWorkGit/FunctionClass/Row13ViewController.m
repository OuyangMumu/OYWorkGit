//
//  Row13ViewController.m
//  OYWorkGit
//
//  Created by Dyang on 2016/11/22.
//  Copyright © 2016年 Ouyang. All rights reserved.
//

#import "Row13ViewController.h"
#import "UITableView+Swizzling.h"

@interface Row13ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView *mainTable;

@end

@implementation Row13ViewController


-(UITableView *)mainTable{

    if (!_mainTable) {
        _mainTable  = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
        
        _mainTable.delegate = self;
        _mainTable.dataSource =self;
        [_mainTable  setReloadBlock:^{
            NSLog(@"setReloadBlock");
        }];
      
    }
    return _mainTable;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.mainTable];
    //方法一
    NSString *appDomain = [[NSBundle mainBundle] bundleIdentifier];
    [[NSUserDefaults standardUserDefaults] removePersistentDomainForName:appDomain];
    
}

//方法二
- (void)resetDefaults
{
    NSUserDefaults * defs = [NSUserDefaults standardUserDefaults];
    NSDictionary * dict = [defs dictionaryRepresentation];
    for (id key in dict)
    {
        [defs removeObjectForKey:key];
    }
    [defs synchronize];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark ========= dataSource ===========

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 0;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 100;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"cell"];
    if(cell==nil){
        cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault      reuseIdentifier:@"cell"];
    }
    
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


@end
