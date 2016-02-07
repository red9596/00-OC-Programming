//
//  main.m
//  10-Using Set
//
//  Created by red on 16/1/31.
//  Copyright © 2016年 red. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSSet+print.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        //可变集合
        NSMutableSet * mySet1 = [NSMutableSet setWithObjects:@1,@3,@5,@10, nil];
        //不可变集合
        NSSet * mySet2 = [NSMutableSet setWithObjects:@-5,@100,@5,@3, nil];
        NSSet * mySet3 = [NSMutableSet setWithObjects:@12,@200,@3, nil];
        
        printf("myset1 :");
        [mySet1 print];
        printf("myset2 :");
        [mySet2 print];
        
        
        //成员测试
        if ([mySet1 containsObject:@10] == YES) {
            NSLog(@"myset1 contains 10");
        }
        else
            NSLog(@"myset1 does not contains 10");
        
        
        //编辑可变集合
        [mySet1 addObject:@4];
        [mySet1 removeObject:@10];
        [mySet1 print];
        
        
        //获得两个集合的交集,并把相交的元素存储在mySet1
        [mySet1 intersectSet:mySet2];
        NSLog(@"mySet1  intersect with mySet2:");
        [mySet1 print];
        
        
        [mySet1 unionSet:mySet3];
        NSLog(@"mySet1 union with mySet3");
        [mySet1 print];
        
    }
    return 0;
}
