//
//  NSSet+print.m
//  10-Using Set
//
//  Created by red on 16/1/31.
//  Copyright © 2016年 red. All rights reserved.
//

#import "NSSet+print.h"

@implementation NSSet(print)

-(void)print
{
    printf("{");
    
    for (NSNumber * element in self) {
        printf("%l4i",(long)[element integerValue]);
    }
    
    printf("}\n");
}
@end
