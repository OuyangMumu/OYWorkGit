//
//  OY_PopTableView.m
//  OYWorkGit
//
//  Created by Dyang on 16/9/18.
//  Copyright © 2016年 Ouyang. All rights reserved.
//

#import "OY_PopTableView.h"

static const CGFloat width = 130;
static const CGFloat rowH = 50;

@interface OY_PopTableView()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UIView *rectView;
@property (nonatomic,strong) UITableView *mainTable;
@property (nonatomic,strong) NSArray *iconImg;
@property (nonatomic,strong) NSArray *titleArr;
@property (nonatomic,strong) UIView *target;
@property (nonatomic,assign) DirectionType direction;


@end

@implementation OY_PopTableView

singleM(OY_PopTableView);

-(UIView *)rectView{
    
    if (!_rectView) {
        _rectView = [[UIView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH - width - 5, 64, width, rowH * 3 + 10)];
        _rectView.backgroundColor = [UIColor clearColor];
        [_rectView addSubview:self.mainTable];
        
        
    }
    return _rectView;
}

-(UITableView *)mainTable{
    
    if (!_mainTable) {
        _mainTable= [[UITableView alloc]initWithFrame:CGRectMake(0, 10, width, rowH *3) style:UITableViewStylePlain];
        _mainTable.delegate = self;
        _mainTable.dataSource = self;
        _mainTable.separatorStyle = UITableViewCellSeparatorStyleNone;
        _mainTable.backgroundColor =[UIColor whiteColor];
        _mainTable.layer.cornerRadius = 5;
        _mainTable.layer.borderColor = [UIColor clearColor].CGColor;
    }
    return _mainTable;
    
}

-(void)buildUI{
    
    UIWindow * window=[[[UIApplication sharedApplication] delegate] window];
    CGRect rect=[self.target convertRect: self.target.bounds toView:window];
    NSLog(@"NSStringFromCGRect = %@",NSStringFromCGRect(rect));
    
    
    
    [self addSubview:self.rectView];
    // 画三角形
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(width - 24, 11)];
    [path addLineToPoint:CGPointMake(width - 16, 2)];
    [path addLineToPoint:CGPointMake(width - 8, 11)];
    
    CAShapeLayer *layer = [CAShapeLayer layer];
    // 颜色设置和cell颜色一样
    layer.fillColor = [UIColor whiteColor].CGColor;
    layer.strokeColor = [UIColor whiteColor].CGColor;
    layer.path = path.CGPath;
    layer.borderColor = [UIColor clearColor].CGColor;
    [self.rectView.layer addSublayer:layer];
}

#pragma mark ========= dataSource ===========

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 3;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return rowH;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"cell"];
    if(cell==nil){
        cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        UIView *line  = [[UIView alloc]initWithFrame:CGRectMake(0, rowH-0.5, width, 0.5)];
        line.backgroundColor = [UIColor groupTableViewBackgroundColor];
        [cell.contentView addSubview:line];
    }
    cell.imageView.image = [UIImage imageNamed:_iconImg[indexPath.row]];
    cell.textLabel.text = _titleArr[indexPath.row];
    cell.textLabel.font = [UIFont systemFontOfSize:15];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (self.cellClick) {
        self.cellClick(indexPath.row);
    }
    [OY_PopTableView dismiss];
}

+(void)show:(UIView *)target direction:(DirectionType)direction icons:(NSArray *)icons titles:(NSArray *)titles{
    
    OY_PopTableView *popView = [OY_PopTableView shareOY_PopTableView];
    popView.frame = [UIApplication sharedApplication].keyWindow.bounds;
    popView.iconImg = icons;
    popView.titleArr = titles;
    popView.target = target;
    popView.direction = direction;
    UIButton *btn  = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = popView.frame;
    [btn addTarget:[self class] action:@selector(dismiss) forControlEvents:UIControlEventTouchUpInside];
    [popView addSubview:btn];
    popView.backgroundColor = OYRGBAColor(166, 166, 166, 0.1);
    [popView buildUI];
    
    [[UIApplication sharedApplication].keyWindow addSubview:popView];
}



+(void)dismiss{

    [[OY_PopTableView shareOY_PopTableView] removeFromSuperview];
    
}

@end
