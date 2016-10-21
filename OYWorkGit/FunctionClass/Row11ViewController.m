//
//  Row11ViewController.m
//  OYWorkGit
//
//  Created by Dyang on 16/9/20.
//  Copyright © 2016年 Ouyang. All rights reserved.
//

#import "Row11ViewController.h"
#import "Row10ViewController.h"


@interface Row11ViewController (){

    NSString *_sting3;
}

@property (nonatomic,copy) NSString *string2;

@property (nonatomic,assign) NSInteger integer2;

@property (nonatomic,strong) NSArray  *array2;


@end

@implementation Row11ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *btn1 =[UIButton buttonWithType:UIButtonTypeContactAdd]
    ;
    btn1.tag = 1;
    btn1.frame = CGRectMake(100, 100, 100, 40);
    [btn1 addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn1];
    
    UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeContactAdd];
    btn2.tag = 2;
    btn2.frame = CGRectMake(100, 150, 100, 40);
    [btn2 addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn2];
   
   NSLog(@"name = %@",[self nameWithClass]);
    
   NSLog(@"property = %@",[self propertyWithClass]);
    
}


//对比下 class_copyIvarList 函数，使用 class_copyPropertyList 函数只能获取类的属性，而不包含成员变量。但此时获取的属性名是不带下划线的。

//获取属性名 (带下划线)
-(NSArray  *)nameWithClass{
    unsigned int numIvars = 0;
    NSString *key=nil;
    NSMutableArray  *ivarNameArr = [NSMutableArray new];
    Ivar * ivars = class_copyIvarList([self class], &numIvars);
    NSLog(@"numIvars== %u",numIvars);
    for(int i = 0; i < numIvars; i++) {
        Ivar thisIvar = ivars[i];
        const char *type = ivar_getTypeEncoding(thisIvar);
        NSString *stringType =  [NSString stringWithCString:type encoding:NSUTF8StringEncoding];
        NSLog(@"stringType == %@",stringType);

        key = [NSString stringWithUTF8String:ivar_getName(thisIvar)];
        [ivarNameArr addObject:[key substringWithRange:NSMakeRange(1, key.length-1)]];
    }
    free(ivars);
    return ivarNameArr;
}


//获取属性名
-(NSArray *)propertyWithClass{

    unsigned int numProperty = 0;
    NSMutableArray *propertyArr = [NSMutableArray new];
    
    objc_property_t *propertys = class_copyPropertyList([self class], &numProperty);
    for (int i = 0; i<numProperty; i++) {
        objc_property_t property = propertys[i];
//        NSLog(@"property_getName === %s , property_getAttributes === %s",property_getName(property),property_getAttributes(property));
        NSString *propretyStr = [NSString stringWithFormat:@"%s",property_getName(property)];
        [propertyArr addObject:propretyStr];
    }
    return propertyArr;
}


-(void)buttonClick:(UIButton *)sender{

    NSLog(@"self = %@,  sender == %@", self,sender);
}

-(id)forwardingTargetForSelector:(SEL)aSelector{

    Row10ViewController *VC = [Row10ViewController new];
    if (aSelector == @selector(buttonClick:)) {
        return VC;
    }
    return  [super forwardingTargetForSelector:aSelector];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
