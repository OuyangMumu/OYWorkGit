//
//  OY_ParentsNaviController.m
//  OuyangGaojun
//
//  Created by Dyang on 16/8/25.
//  Copyright © 2016年 Ouyang. All rights reserved.
//

#import "OY_ParentsNaviController.h"

@implementation OY_ParentsNaviController

-(void)viewDidLoad{

    [super viewDidLoad];
    
    self.navigationBar.barTintColor = OYRGBColor(124, 124, 124);
    
   id target =  self.interactivePopGestureRecognizer.delegate;
    
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc]initWithTarget:target action:@selector(handleNavigationTransition:)];
    pan.delegate = (id<UIGestureRecognizerDelegate>)self;
    [self.view addGestureRecognizer:pan];
    
    
}
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer{

    return self.viewControllers.count > 1;
}



@end
