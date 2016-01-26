//
//  main.m
//  07-Use NSArray
//
//  Created by red on 16/1/23.
//  Copyright © 2016年 red. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // NSArray不声明大小，所以要在结尾加入nil，nil并不存储
        NSArray * season = [NSArray arrayWithObjects:
        @"Spring",@"Summer",@"Autum",@"Winter",nil];
        
        //使用 @[]； 创建NSArray对象
        NSArray * directions = @[@"up",@"down",@"left",@"right"];
        for (int i  = 0; i < 4; i++) {
            NSLog(@"%@",directions[i]);
        }
        
        
        //创建了一个空的可变数组，数组元素个数未指定，并可按照需要增加
        NSMutableArray * num = [NSMutableArray array];
        //使用 = 初始化NSArray对象
        for (int i  = 0; i < 9; i++) {
            num[i] = @(i);
            //不能把int之类的基本数据类型直接存入NSArray数组中
            //所以要把它先对象化
        }
        
        //直接用%@格式显示
        NSLog(@"%@",num);
        
        NSLog(@"serial season");
        for (int i  = 0; i < 4; i++) {
            //使用objectAtIndex:方法按照序号0~n 获取对象
            NSLog(@"%i     %@",i + 1,[season objectAtIndex:i]);
            
            //也可以使用season[i]获取
            NSLog(@"%i     %@",i + 1,season[i]);
        }
        
        
        
        
    }
    return 0;
}
