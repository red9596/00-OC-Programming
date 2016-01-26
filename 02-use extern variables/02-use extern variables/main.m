//  全局变量的使用
//  main.m
//  02-use extern variables
//
//  Created by red on 16/1/21.
//  Copyright © 2016年 red. All rights reserved.
//

/*
名词解释：
1、全局变量：
 是在所有函数体的外部定义的,程序的所有部分(甚至其他文件中的代码)都可以使用.
 全局变量不受作用哉的影响,总是可用的(也就是说,全局变量的生命期一直到程序的结束)
2、外部变量：
 是指在文件a中定义了一个全局变量,
 在文件b中声明并使用这个全局变量时,这个全局变量对于b来说是外部变量
3、
extern 的作用：
在头文件中: extern int g_Int;  它的作用就是声明函数或全局变量的作用范围的关键字，
 其声明的函数和变量可以在本模块活其他模块中使用，记住它是一个声明不是定义!（所以不要给他在此处赋值，有了赋值操作就相当于是进行了定义）
 也就是说B模块(编译单元)要是引用模块(编译单元)A中定义的全局变量或函数时，
 它只要包含A模块的头文件即可, 在编译阶段，模块B虽然找不到该函数或变量，但它不会报错，它会在连接时从模块A生成的目标代码中找到此函数。

tips:
 变量的使用包含： 1、声明
               2、定义    
               声明可用有很多次，定义只可以有一次     
 使用extern 修饰全局变量时，   只在声明时使用 extern  定义时不要用
 所以在 Year.h 中声明它 （ extern int gYear;  ）
 但不能用   extern int gYear = 0;   因为赋值操作会使这条语句变成定义操作 extern就失去了作用
 就相当于   在 Year.h 中定义了它 int gYear = 0;  
 而 Year.m中又包含了Year.h 就相当于定义了两次 
 会产生链接错误： duplicate symbol for architecture
 
所以   记住， 只在头文件中做声明
      记住， 只在头文件中做声明
      记住， 只在头文件中做声明
 正确的做法就是把   extern声明  与 变量的定义分开
 不要使用   extern int gYear = 0;
 
 
 

*/

#import <Foundation/Foundation.h>
#import "Person.h"
#import "Year.h"





int main(int argc, const char * argv[]) {
    @autoreleasepool {
    
        Person * p = [[Person alloc] init];
        p.age = 10;
        printf("p age is %d\n",p.age);
        [Year yearpass];
        printf("p age is %d\n",p.age);
        
    }
    return 0;
}
