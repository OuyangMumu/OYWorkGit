//
//  OY_ActionStopButton.m
//  OYWorkGit
//
//  Created by Dyang on 16/9/13.
//  Copyright © 2016年 Ouyang. All rights reserved.
//


#import "OY_ActionStopButton.h"
#import <objc/runtime.h>

@interface OY_ActionStopButton ()

@property (nonatomic,copy) NSString *selector;

@property (nonatomic,strong) id objClass;


@end

@implementation OY_ActionStopButton


- (void)sendAction:(SEL)action to:(id)target forEvent:(UIEvent *)event
{    if (self.isNeedStop)
{        self.selector = NSStringFromSelector(action);
    self.objClass = target;
    [self checkIsLogin];
}    else
{
    [super sendAction:action to:target forEvent:event];
}
}
- (void)checkIsLogin
{
    
    
    NSLog(@"isNeedStop === yes");
    sleep(2);
    
    SEL sel = NSSelectorFromString(self.selector);
    
    if ([self.objClass respondsToSelector:sel])
    {
        if ([self.selector hasSuffix:@":"]){
            objc_msgSend(self.objClass,sel,self);
        } else{
            objc_msgSend(self.objClass, sel);
        }
    }
    
}
@end
