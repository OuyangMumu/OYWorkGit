//
//  NSObject+Swizzling.h
//  OYWorkGit
//
//  Created by Dyang on 2016/12/1.
//  Copyright © 2016年 Ouyang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>
@interface NSObject (Swizzling)

+ (void)methodSwizzlingWithOriginalSelector:(SEL)originalSelector bySwizzledSelector:(SEL)swizzledSelector;

@end
