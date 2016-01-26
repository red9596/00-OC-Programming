//  NSLog函数的用法
//  main.m
//  04-Use NSLog function
//
//  Created by red on 16/1/22.
//  Copyright © 2016年 red. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject
@property NSString* name;
@end

@implementation Person
- (NSString *)description
{
    return [NSString stringWithFormat:@"this person's name is %@",_name];
}

@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSString * str  = @"hello";
        NSLog(@"%@",str);
        //还可以用来显示其他对象
        NSNumber * Num = [NSNumber numberWithInt:100];
        NSLog(@"%@",Num);
        
        
        //用作用户定义的类时，显示类名和该对象在内存中的地址。
        Person * p = [[Person alloc] init];
        NSLog(@"%@",p);
        
        //如果想自定义输出，可以重载用户自定义类中的description方法
        p.name = @"jack";
        NSLog(@"%@",p);
    }
    return 0;
}
