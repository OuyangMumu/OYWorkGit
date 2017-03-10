//
//  OY_TableView.h
//  OYWorkGit
//
//  Created by Dyang on 2017/3/2.
//  Copyright © 2017年 Ouyang. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^tipClick)(void);

@interface DY_TableView : UITableView

@property (nonatomic, strong) UIView *tipView;
@property (nonatomic,copy) tipClick tipClickCall;

-(void)addEmptyViewWithImageName:(NSString*)imageName title:(NSString*)title action:(tipClick)call;

-(void)addEmptyViewWithImageName:(NSString*)imageName title:(NSString*)title defaultErrorTip:(BOOL)ErrorTip  action:(tipClick)call;

-(void)addNetWorkErrorWithImageName:(NSString*)imageName title:(NSString*)title action:(tipClick)call;

@end
