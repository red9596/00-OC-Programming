//
//  main.m
//  00-例题9.6使用try处理异常
//
//  Created by red on 16/1/20.
//  Copyright © 2016年 red. All rights reserved.
//
//   实现自定义异常  与 多异常分类处理

#import <Foundation/Foundation.h>

//自定义异常类A
@interface MyExceptionA : NSException

@end
@implementation MyExceptionA

@end

//自定义异常类B
@interface MyExceptionB : NSException

@end
@implementation MyExceptionB

@end


@interface Person : NSObject

@end

@implementation Person

@end


@interface Student : Person
- (void) setNum: (int ) x;

@end

@implementation Student
- (void)setNum:(int)x
{
    if ( x == 1) {
        MyExceptionA * ExceptionA = (MyExceptionA* )[MyExceptionA exceptionWithName: @"MyExceptionA"
                                                                             reason: @"you input a number  1"
                                                                           userInfo: nil];
        @throw ExceptionA;
    }
    if (x == 2) {
        MyExceptionB * ExceptionB = (MyExceptionB * )[MyExceptionB exceptionWithName: @"MyExceptionB"
                                                                              reason: @"you input a number  2"
                                                                            userInfo: nil];
        @throw ExceptionB;
    }}
@end


int main(int argc, const char * argv[])
{
    @autoreleasepool {
        //多态运行，动态绑定
        Person *person = [[Person alloc] init];
        Person *student = [[Student alloc] init];
        id stuObj = student;
        
        
        
        //set num :1  to  cause excaptionA
        @try {
            [stuObj setNum:1];
        }
        @catch (MyExceptionA *exception) {
            NSLog(@"%@  %@",[exception name],[exception reason] );
        }
        
        
        //set num 2 to cause exceptionB
        @try {
            [stuObj setNum:2];
        }
        @catch (MyExceptionB *exception) {
            NSLog(@"%@  %@",[exception name],[exception reason] );
        }
        
        
        id perObj = person;
        //person类没有setSchool方法，但这里在编译时不会出错，运行时会抛出错误
        //通过加入@try语句捕获异常
        @try {
            [perObj setNum:123];
        }
        @catch (NSException *exception) {
            NSLog(@"Exception Name:  %@", exception.name);
            NSLog(@"Exception Reason:%@", exception.reason);
        }
        @finally {
            NSLog(@"perObj is not a student object!");
        }
    }
    return 0;
}

