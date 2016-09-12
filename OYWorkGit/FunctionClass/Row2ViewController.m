//
//  Row2ViewController.m
//  OuyangGaojun
//
//  Created by Dyang on 16/8/25.
//  Copyright © 2016年 Ouyang. All rights reserved.
//

#import "Row2ViewController.h"

@interface Row2ViewController ()

@end

@implementation Row2ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *checking = @"a34sd231";
    NSString *pattern = @"3";
    NSRegularExpression *regular = [[NSRegularExpression alloc]initWithPattern:pattern options:NSRegularExpressionCaseInsensitive error:nil];
    NSArray *result = [regular matchesInString:checking options:0 range:NSMakeRange(0, checking.length)];
    
    for (NSTextCheckingResult *rang in result ) {
        NSLog(@"%@" , NSStringFromRange(rang.range));
    }
    
    /*
     []:找到内部的某一个字符 [a-zA-Z0-9]代表所有的字符和数字
     \\d:代表数字
     {2}:代表2个 {2,4}:代表2到4个
     ?:代表0个或1个 
     +:代表至少一个
     *:代表0个或多个
     ^:代表以...开头
     $:代表以...结束
     .:代表除换行以外的任意字符
     */
    
    NSString *pattern1 = @"\\d";//代表一个数字字符
    NSString *pattern2 = @"\\d{2,5}";//代表2-5个连续的字符
    NSString *pattern3 = @"^[1-9]\\d{4,10}";//1-9开头 后边连续的4-10个数字
    NSString *pattern4 = @"^(13[0-9]|(15[0-9])|(18[0-9]))\\d{8}";//电话个数正则表达式
    NSString *pattern5 = @"^.*@..\\.[a-zA-Z]{2,4}$";//邮箱正则表达式
    
    
    NSString *strstr = @"#今日要闻#[偷笑] http://asd.fdfs.2.ee/aas/le @sdf[test]#你确定#@rain李23:@张三[挖鼻]m123m";
    NSString *emopattern = @"\\[[a-zA-Z\\u4e00-\\u9fa5]+\\]";//表情
    NSString *atpattern = @"@[0-9a-zA-Z\\u4e00-\\u9fa5]+";
    NSString *toppattern = @"#[0-9a-zA-Z\\u4e00-\\u9fa5]+#";
    NSString *urlpattern = @"\\b(([\\w-]+://?|www[.])[^\\s()<>]+(?:\\([\\w\\d]+\\)|([^[:punct:]\\s]/)))";
    NSString *patternTotal = [NSString stringWithFormat:@"%@%@%@%@",emopattern,atpattern,toppattern,urlpattern];
    NSRegularExpression *regularex = [[NSRegularExpression alloc]initWithPattern:patternTotal options:NSRegularExpressionCaseInsensitive error:nil];
    
    NSArray *resultArr = [regularex matchesInString:strstr options:0 range:NSMakeRange(0, strstr.length)];
    
    for (NSTextCheckingResult *rang in resultArr) {
        NSLog(@"range == %@",NSStringFromRange(rang.range));
        NSLog(@"%@",[strstr substringWithRange:rang.range]);
    }
    
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
