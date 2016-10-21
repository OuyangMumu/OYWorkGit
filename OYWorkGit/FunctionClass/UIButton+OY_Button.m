//
//  UIButton+OY_Button.m
//  OYWorkGit
//
//  Created by Dyang on 16/9/21.
//  Copyright © 2016年 Ouyang. All rights reserved.
//

#import "UIButton+OY_Button.h"
#import "Row10ViewController.h"

@implementation UIButton (OY_Button)


-(id)forwardingTargetForSelector:(SEL)aSelector{
    
    Row10ViewController *VC = [Row10ViewController new];
    if (aSelector == @selector(buttonClick:)) {
        return VC;
    }
    return  [super forwardingTargetForSelector:aSelector];
    
}


@end
