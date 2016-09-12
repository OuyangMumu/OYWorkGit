//
//  NSMutableAttributedString+OYAttributedStrig.m
//  OuyangGaojun
//
//  Created by Dyang on 16/8/25.
//  Copyright © 2016年 Ouyang. All rights reserved.
//

#import "NSMutableAttributedString+OYAttributedStrig.h"

@implementation NSMutableAttributedString (OYAttributedStrig)


/**
 *  单纯改变一句话中的某些字的颜色
 *
 *  @param color    需要改变成的颜色
 *  @param totalStr 总的字符串
 *  @param subArray 需要改变颜色的文字数组
 *
 *  @return 生成的富文本
 */
+ (NSMutableAttributedString *)ls_changeCorlorWithColor:(UIColor *)color TotalString:(NSString *)totalStr SubStringArray:(NSArray *)subArray {
    NSMutableAttributedString *attributedStr = [[NSMutableAttributedString alloc] initWithString:totalStr];
    
    for (NSString *rangeStr in subArray) {
        
        NSRegularExpression *regular = [[NSRegularExpression alloc]initWithPattern:rangeStr options:NSRegularExpressionCaseInsensitive error:nil];
        NSArray *result = [regular matchesInString:totalStr options:0 range:NSMakeRange(0, totalStr.length)];
        
        for (NSTextCheckingResult *rang in result ) {
            
            [attributedStr addAttribute:NSForegroundColorAttributeName value:color range:rang.range];
            
        }
    }
    return attributedStr;
}
@end
