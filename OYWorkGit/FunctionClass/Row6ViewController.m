//
//  Row6ViewController.m
//  OuyangGaojun
//
//  Created by Dyang on 16/8/29.
//  Copyright © 2016年 Ouyang. All rights reserved.
//

#import "Row6ViewController.h"

@interface Row6ViewController ()

@property (nonatomic,strong) UIImageView *iconImg;

@property (nonatomic,strong) UILabel *upDownLab;

@end


@implementation Row6ViewController

-(UILabel *)upDownLab{

    if (!_upDownLab) {
        _upDownLab = [[UILabel alloc]initWithFrame:CGRectMake(100, 200, 150, 40)];
        _upDownLab.textColor = [UIColor redColor];
        _upDownLab.text = @"点击切换文字";
    }
    return _upDownLab;
}

-(UIImageView *)iconImg{

    if (!_iconImg) {
        _iconImg = [[UIImageView alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
        
    }
    return _iconImg;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.iconImg];
    [self.view addSubview:self.upDownLab];
    
   NSString  *headIconImgString = @"http://qlogo3.store.qq.com/qzone/804716454/804716454/100?1460126220";
//    使用SDWebImage移除单个图片URL
    BOOL cache  = [[SDWebImageManager sharedManager] cachedImageExistsForURL:[NSURL URLWithString:headIconImgString]];
    if (cache) {
        [[SDImageCache sharedImageCache] removeImageForKey:headIconImgString fromDisk:YES];
    }
    //这样每次都会重新去下载头像
    [self.iconImg sd_setImageWithURL:[NSURL URLWithString:headIconImgString]];

}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{

    
    CATransition *animation = [CATransition animation];
    animation.delegate = self;
    animation.duration  = 1;
    animation.timingFunction = UIViewAnimationCurveEaseInOut;
    animation.subtype = kCATransitionFromTop;
    animation.fillMode = kCAFillModeBackwards;
    animation.removedOnCompletion = YES;
    animation.type = @"push";
    self.upDownLab.text = @"push";
    [self.upDownLab.layer addAnimation:animation forKey:@"animationID"];
    
    
}














@end
