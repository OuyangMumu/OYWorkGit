//
//  NSNull+Unable.m
//  071701test
//
//  Created by Ray on 2017/4/17.
//  Copyright © 2017年 com. All rights reserved.
//

#import "NSNull+Unable.h"

@implementation NSNull (Unable)

-(NSUInteger)length{
    NSLog(@"NSNull  没有 %s 属性 : %d",__func__,__LINE__);
    return 4;
}

-(NSUInteger)count{
    NSLog(@"NSNull  没有 %s 属性 : %d",__func__,__LINE__);
    return  0;
}


-(char)charValue{

    NSLog(@"NSNull  没有 %s 属性 : %d",__func__,__LINE__);

    return [[NSNumber numberWithInt:0] charValue];
}

-(unsigned char)unsignedCharValue{
    NSLog(@"NSNull  没有 %s 属性 : %d",__func__,__LINE__);

    return [[NSNumber numberWithInt:0] unsignedCharValue];
}

-(short)shortValue{
    NSLog(@"NSNull  没有 %s 属性 : %d",__func__,__LINE__);

    return [[NSNumber numberWithInt:0] shortValue];
}

-(unsigned short)unsignedShortValue{
    NSLog(@"NSNull  没有 %s 属性 : %d",__func__,__LINE__);

    return [[NSNumber numberWithInt:0] unsignedShortValue];
}

-(int)intValue{
    NSLog(@"NSNull  没有 %s 属性 : %d",__func__,__LINE__);

    return [[NSNumber numberWithInt:0] intValue];
}

-(unsigned int)unsignedIntValue{
    NSLog(@"NSNull  没有 %s 属性 : %d",__func__,__LINE__);

    return [[NSNumber numberWithInt:0] unsignedIntValue];
}


-(long)longValue{
    NSLog(@"NSNull  没有 %s 属性 : %d",__func__,__LINE__);

    return [[NSNumber numberWithInt:0] longValue];
}

-(unsigned long)unsignedLongValue{
    NSLog(@"NSNull  没有 %s 属性 : %d",__func__,__LINE__);

    return [[NSNumber numberWithInt:0] charValue];
}

-(long long)longLongValue{
    NSLog(@"NSNull  没有 %s 属性 : %d",__func__,__LINE__);

    return [[NSNumber numberWithInt:0] longLongValue];
}

-(unsigned long long)unsignedLongLongValue{
    NSLog(@"NSNull  没有 %s 属性 : %d",__func__,__LINE__);

    return [[NSNumber numberWithInt:0] unsignedLongLongValue];
}

-(float)floatValue{
    NSLog(@"NSNull  没有 %s 属性 : %d",__func__,__LINE__);

    return [[NSNumber numberWithInt:0] floatValue];
}

-(double)doubleValue{
    NSLog(@"NSNull  没有 %s 属性 : %d",__func__,__LINE__);

    return [[NSNumber numberWithInt:0] doubleValue];
}

-(BOOL)boolValue{
    NSLog(@"NSNull  没有 %s 属性 : %d",__func__,__LINE__);

    return [[NSNumber numberWithInt:0] boolValue];
}

-(NSUInteger)unsignedIntegerValue{
    NSLog(@"NSNull  没有 %s 属性 : %d",__func__,__LINE__);

    return [[NSNumber numberWithInt:0] unsignedIntegerValue];
}

-(NSString *)stringValue{
    NSLog(@"NSNull  没有 %s 属性 : %d",__func__,__LINE__);

    return nil;
}

-(NSInteger)integerValue{
    NSLog(@"NSNull  没有 %s 属性 : %d",__func__,__LINE__);
    return  0;
}

- (NSUInteger)indexOfObject:(id)anObject{
    NSLog(@"NSNull  没有 %s 属性 : %d",__func__,__LINE__);
    return  0;
}

- (id)objectAtIndex:(NSUInteger)index{
    NSLog(@"NSNull  没有 %s 属性 : %d",__func__,__LINE__);
    return nil;
}

- (nullable id)objectForKey:(id _Nullable )aKey{
    
    NSLog(@"NSNull  没有 %s 属性 : %d",__func__,__LINE__);
    return nil;
}

- (nullable id)objectForKeyedSubscript:(nullable id)key{
    NSLog(@"NSNull  没有 %s 属性 : %d",__func__,__LINE__);
    return nil;
};

- (BOOL)isEqualToString:(NSString *)aString{
    
    NSLog(@"NSNull  没有 %s 属性 : %d",__func__,__LINE__);

    return NO;
}


@end
