//
//  OY_PopTableView.h
//  OYWorkGit
//
//  Created by Dyang on 16/9/18.
//  Copyright © 2016年 Ouyang. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^addBtncellClick)(NSInteger);

typedef NS_ENUM(NSInteger,DirectionType){
    DirectionTypeUp=1,
    DirectionTypeDown=2,
    DirectionTypeLeft=3,
    DirectionTypeRitht=4
};

@interface OY_PopTableView : UIView

@property (nonatomic,copy) addBtncellClick cellClick;

singleH(OY_PopTableView)

+(void)show:(UIView *)target direction:(DirectionType)type icons:(NSArray *)icons titles:(NSArray *)titles;

+(void)dismiss;



@end
