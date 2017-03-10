//
//  UITableView+Swizzling.m
//  OYWorkGit
//
//  Created by Dyang on 2016/12/1.
//  Copyright © 2016年 Ouyang. All rights reserved.
//

#import "UITableView+Swizzling.h"
#import "NSObject+Swizzling.h"

@implementation UITableView (Swizzling)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        //方法交换，将reloadData实现交换为sure_reloadData
        [self methodSwizzlingWithOriginalSelector:@selector(reloadData) bySwizzledSelector:@selector(sure_reloadData)];
    });
}

- (void)sure_reloadData {
    [self checkEmpty];
    [self sure_reloadData];
}


- (void)checkEmpty {
    BOOL isEmpty = YES;//flag标示
    
    id <UITableViewDataSource> dataSource = self.dataSource;
    NSInteger sections = 1;//默认一组
    if ([dataSource respondsToSelector:@selector(numberOfSectionsInTableView:)]) {
        sections = [dataSource numberOfSectionsInTableView:self];//获取当前TableView组数
    }
    
    for (NSInteger i = 0; i < sections; i++) {
        NSInteger rows = [dataSource tableView:self numberOfRowsInSection:sections];//获取当前TableView各组行数
        if (rows) {
            isEmpty = NO;//若行数存在，不为空
        }
    }
    if (isEmpty) {//若为空，加载占位图
        if (!self.placeholderView) {//若未自定义，展示默认占位图
            [self makeDefaultPlaceholderView];
        }
        self.placeholderView.hidden = NO;
        [self addSubview:self.placeholderView];
    } else {//不为空，隐藏占位图
        self.placeholderView.hidden = YES;
    }
}

- (void)makeDefaultPlaceholderView {
    SurePlaceholderView *placeholderView = [[SurePlaceholderView alloc]initWithFrame:self.bounds];
    __weak typeof(self) weakSelf = self;
    
    [placeholderView setReloadClickBlock:^{
        if (weakSelf.reloadBlock) {
            weakSelf.reloadBlock();
        }
    }];
    self.placeholderView = placeholderView;
}

- (UIView *)placeholderView {
    return objc_getAssociatedObject(self, @selector(placeholderView));
}

- (void)setPlaceholderView:(UIView *)placeholderView {
    objc_setAssociatedObject(self, @selector(placeholderView), placeholderView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void (^)(void))reloadBlock {
    return objc_getAssociatedObject(self, @selector(reloadBlock));
}

- (void)setReloadBlock:(void (^)(void))reloadBlock {
    objc_setAssociatedObject(self, @selector(reloadBlock), reloadBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}


@end
