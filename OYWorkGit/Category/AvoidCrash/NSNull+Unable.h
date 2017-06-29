//
//  NSNull+Unable.h
//  071701test
//
//  Created by Ray on 2017/4/17.
//  Copyright © 2017年 com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSNull (Unable)

@property (nonatomic,readonly) NSUInteger count;
@property (nonatomic,readonly) NSUInteger length;

@property (readonly) char charValue;
@property (readonly) unsigned char unsignedCharValue;
@property (readonly) short shortValue;
@property (readonly) unsigned short unsignedShortValue;
@property (readonly) int intValue;
@property (readonly) unsigned int unsignedIntValue;
@property (readonly) long longValue;
@property (readonly) unsigned long unsignedLongValue;
@property (readonly) long long longLongValue;
@property (readonly) unsigned long long unsignedLongLongValue;
@property (readonly) float floatValue;
@property (readonly) double doubleValue;
@property (readonly) BOOL boolValue;
@property (readonly) NSInteger integerValue ;
@property (readonly) NSUInteger unsignedIntegerValue;
@property (readonly, copy) NSString *stringValue;


- (NSUInteger)indexOfObject:(id _Nullable )anObject;
- (id _Nullable )objectAtIndex:(NSUInteger)index;
- (nullable id)objectForKey:(id _Nullable )aKey;
- (id _Nullable )objectForKeyedSubscript:(id _Nullable )key;
- (BOOL)isEqualToString:(NSString *)aString;


@end
