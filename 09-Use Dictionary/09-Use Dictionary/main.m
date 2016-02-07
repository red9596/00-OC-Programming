//
//  main.m
//  09-Use Dictionary
//
//  Created by red on 16/1/28.
//  Copyright © 2016年 red. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSMutableDictionary * mydictionary = [NSMutableDictionary dictionary];
        
        [mydictionary setObject:@"it" forKey:@"a"];
        [mydictionary setObject:@"a" forKey:@"c"];
        [mydictionary setObject:@"person" forKey:@"d"];
        [mydictionary setObject:@"is" forKey:@"b"];
        
//        NSLog(@"%@",[mydictionary objectForKey:@"a"]);
//        NSLog(@"%@",[mydictionary objectForKey:@"b"]);
//        NSLog(@"%@",[mydictionary objectForKey:@"c"]);
//        NSLog(@"%@",[mydictionary objectForKey:@"d"]);
        
        
        //快速访问字典元素
        mydictionary[@"a1"] = @"a";
        mydictionary[@"a2"] = @"other";
        mydictionary[@"a3"] = @"person";
        
//        NSLog(@"%@",mydictionary[@"a1"]);
//        NSLog(@"%@",mydictionary[@"a2"]);
//        NSLog(@"%@",mydictionary[@"a3"]);
//
        
        
        //词典对象是无序的，所以会以随机顺序枚举
//        for (NSString * key in mydictionary) {
//            NSLog(@"key:%@   %@",key,mydictionary[key]);
//        }
//        
        //把词典的所有对象的key赋给了keys这个数组
        NSArray * keys = [mydictionary allKeys];
        //对keys这个数组内部进行排序操作（已经与词典不发生关系）
        keys = [keys sortedArrayUsingComparator:
                ^(id obj1, id obj2)
                {
                    return [obj1 compare:obj2];
                }];
        
        for (NSArray * showkeys in keys) {
            NSLog(@"%@  : %@",showkeys,[mydictionary objectForKey:showkeys]);
        }
        
    }
    return 0;
}
