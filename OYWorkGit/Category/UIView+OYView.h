//
//  UIView+OYView.h
//  OYWorkGit
//
//  Created by Dyang on 2016/11/22.
//  Copyright © 2016年 Ouyang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (OYView)

/**
 返回承载视图的目标控制器

 @param ControllerName 所需返回的控制器类名
 @return 控制器实例
 */
-(UIViewController *)viewController:(NSString *)ControllerName;


@end
