//
//  OY_TableView.m
//  OYWorkGit
//
//  Created by Dyang on 2017/3/2.
//  Copyright © 2017年 Ouyang. All rights reserved.
//

#import "OY_TableView.h"
@interface DY_TableView()

{
    UIView *_noMessageView;
    UIImageView *_tipImageView;
    UILabel *_tipLabel;
}

@property (nonatomic,assign) BOOL showEmptyView;//是否提示空数据
@property (nonatomic, copy) NSString *emptyTipString;     // 空提示文字
@property (nonatomic, copy) NSString *emptyTipImageName;  // 空提示图片

@property (nonatomic,assign) BOOL showErrorView;//是否提示网络异常
@property (nonatomic, copy) NSString *errorTipString;     // 网络提示文字
@property (nonatomic, copy) NSString *errorTipImageName;  // 网络提示图片

@end

@implementation DY_TableView

-(void)reloadData{
    [super reloadData];
    [self.mj_footer endRefreshing];
    [self.mj_header endRefreshing];
    
    
    if (self.showEmptyView){// 显示空数据提示
        NSInteger count = 0;
        for (NSInteger i=0; i<[self numberOfSections]; i++) {
            count +=[self numberOfRowsInSection:i];
        }
        if (!count) {
            self.tipView.hidden = NO;
            _tipLabel.text = self.emptyTipString;
            _tipImageView.image = [UIImage imageNamed:self.emptyTipImageName];
        }else{
            self.tipView.hidden = YES;
        }
    }
    
    if (self.showErrorView) {//显示网络异常
//        if(![GM_APP connectionRequired]){
//            _tipLabel.text = self.errorTipString;
//            _tipImageView.image = [UIImage imageNamed:self.errorTipImageName];
//        }
        
    }
    
}

-(UIView *)tipView{
    if (!_tipView) {
        CGRect frame = self.bounds;
        UIImage* image = [UIImage imageNamed:self.emptyTipImageName];
        _tipView = [[UIView alloc] initWithFrame:frame];
        _tipView.backgroundColor = [UIColor clearColor];
        
        _tipImageView = [[UIImageView alloc] initWithFrame:CGRectMake((frame.size.width-image.size.width)/2, (frame.size.height-image.size.height)/2, image.size.width, image.size.height)];
        [_tipImageView setImage:image];
        [_tipView addSubview:_tipImageView];
        
        _tipLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(_tipImageView.frame)+10, frame.size.width, 20)];
        _tipLabel.textAlignment = NSTextAlignmentCenter;
        _tipLabel.textColor = [UIColor lightGrayColor];
        _tipLabel.text = self.emptyTipString;
        _tipLabel.backgroundColor = [UIColor clearColor];
        _tipLabel.font = [UIFont systemFontOfSize:15];
        [_tipView addSubview:_tipLabel];
        [self  addSubview:_tipView];
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tipClickAction)];
        [_tipView addGestureRecognizer:tap];
        
    }
    return _tipView;
}

-(void)tipClickAction{
    
    if (self.tipClickCall) {
        self.tipClickCall();
    }
}


-(void)addEmptyViewWithImageName:(NSString*)imageName title:(NSString*)title action:(tipClick)call
{
    self.emptyTipString = title;
    self.emptyTipImageName = imageName;
    self.showEmptyView = YES;
    self.tipClickCall = call;
}


-(void)addEmptyViewWithImageName:(NSString*)imageName title:(NSString*)title defaultErrorTip:(BOOL)ErrorTip  action:(tipClick)call{
    
    [self addEmptyViewWithImageName:imageName title:title action:call];
    
    self.showErrorView = ErrorTip;
    if (ErrorTip) {
//        self.errorTipString = NETERR;
        self.errorTipImageName = @"空状态_简介";
    }
}


-(void)addNetWorkErrorWithImageName:(NSString*)imageName title:(NSString*)title action:(tipClick)call{
    
    self.errorTipString = title;
    self.errorTipImageName = imageName;
    self.showErrorView = YES;
    self.tipClickCall = call;
}


@end
