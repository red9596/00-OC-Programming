//
//  main.m
//  03-Use Number Object
//
//  Created by red on 16/1/22.
//  Copyright © 2016年 red. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSNumber *myNumber,*floatNumber,*intNumber;
        NSInteger myInt; //NSInteger 不是一个类，只是一个基本数据类型long的typedefine
        
        
        //Integer 型值
        intNumber = [NSNumber numberWithInteger:100];
        myInt = [intNumber integerValue];
        NSLog(@"%li",(long)myInt);
        
        //long
        myNumber = [NSNumber numberWithLong:0xabcdef];
        myInt = [myNumber longValue];
        NSLog(@"%lx",myInt);
        
        //char
        myNumber = [NSNumber numberWithChar:'X'];
        NSLog(@"%c",[myNumber charValue]);
        
        //float
        floatNumber = [NSNumber numberWithFloat:100.00];
        NSLog(@"%f",[floatNumber floatValue]);
        
        //double
        myNumber = [NSNumber numberWithDouble:12345e+15];
        NSLog(@"%g",[myNumber doubleValue]);
        
        //wrong use
        NSLog(@"%li",(long)[myNumber integerValue]);
        NSLog(@"%c",[myNumber charValue]);
        
        //验证两个Number是否相等
        if ([intNumber isEqualToNumber:floatNumber]) {
            NSLog(@"is equal!");
        }
        else
            NSLog(@"not equal!");
    
    }
    return 0;
}
