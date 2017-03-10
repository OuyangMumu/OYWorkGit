//
//  UITableView+Swizzling.h
//  OYWorkGit
//
//  Created by Dyang on 2016/12/1.
//  Copyright © 2016年 Ouyang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SurePlaceholderView.h"

@interface UITableView (Swizzling)
@property (nonatomic, strong) UIView *placeholderView;
@property (nonatomic,   copy) void(^reloadBlock)(void);

@end
