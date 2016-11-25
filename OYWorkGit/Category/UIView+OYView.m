//
//  UIView+OYView.m
//  OYWorkGit
//
//  Created by Dyang on 2016/11/22.
//  Copyright © 2016年 Ouyang. All rights reserved.
//

#import "UIView+OYView.h"

@implementation UIView (OYView)

-(UIViewController *)viewController:(NSString *)ControllerName{
    
    Class className = NSClassFromString(ControllerName);

    UIViewController *VC = nil;
    UIResponder *nextResponder = self.nextResponder;
    
    while (nextResponder) {
        if ([nextResponder isKindOfClass:className]) {
            VC = (UIViewController *)nextResponder;
            break;
        }
        nextResponder = nextResponder.nextResponder;
    }
    return VC;
    
}
@end
