//
//  main.m
//  08-AdressBook and AdressCard
//
//  Created by red on 16/1/23.
//  Copyright © 2016年 red. All rights reserved.
//

/*
利用NSIndexSet方法重写lookup函数
 NSIndexSet类的使用
NSIndexSet类代表一个不可变的独特的无符号整数的集合,称为索引,因为使用它们的方式。这个集合被称为索引集。你不应该使用索引集存储任意集合的整数值,因为索引集按索引排序范围的方式存储的。这使得它们更有效率比存储单个整数的集合。这也意味着每个索引值指数中只能出现一次。通俗点讲NSIndexSet就是一个唯一的，有序的，无符号整数的集合。

NSMutableIndexSet是一个可变的集合，其使用方法如：
NSMutableIndexSet *idxSet = [[NSMutableIndexSet alloc] init];

[idxSet addIndex:5];

[idxSet addIndex:2];

[idxSet addIndex:8];

[idxSet addIndex:12];

//  添加 4到13的索引值

[idxSet addIndexesInRange:NSMakeRange(4, 10)];

[idxSet enumerateIndexesUsingBlock:^(NSUInteger idx, BOOL *stop)
 
 {
     
     NSLog(@"%lu", (unsigned long)idx);
     
 }];
//   book objectsAtIndexes:<#(nonnull NSIndexSet *)#>

 
 
 
 
 
 NSIndexSet同时还包含许多方法判断是否包含某区间或者从一个索引值内获取临近的区间内的索引。如下代码：
 
 NSUInteger a = [idxSet indexGreaterThanIndex:5];
 
 NSUInteger b = [idxSet indexLessThanIndex:5];
 
 NSUInteger c = [idxSet indexGreaterThanOrEqualToIndex:5];
 
 NSUInteger d = [idxSet indexLessThanOrEqualToIndex:5];
 
 NSLog(@"a = %lu, b = %lu, c = %lu, d = %lu", (unsigned long)a,(unsigned long)b,(unsigned long)c,(unsigned long)d);
 
 结果：2013-11-29 15:42:23.053 Tables[1165:a0b] a = 6, b = 4, c = 5, d = 5
 
 
 
 NSIndexSet还取一个NSRange范围中的交集，然后还可以以相反的顺序进行枚举。
 
 这个需求需要使用NSIndexSet的enumerateIndexesInRange:options:usingBlock:方法，如下代码
 
 [idxSet enumerateIndexesInRange:NSMakeRange(4, 4) options:NSEnumerationReverse usingBlock:^(NSUInteger idx, BOOL *stop) {
 
 NSLog(@"%lu", (unsigned long)idx);
 
 }]
*/


#import <Foundation/Foundation.h>

#include "AdressBook.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSString * aName = @"ABCD";
        NSString * aEmail = @"A@@@";
        NSString * bName = @"BCD";
        NSString * bEmail = @"B@@@";
        NSString * cName = @"SLKJLKJC";
        NSString * cEmail = @"C@@@";
        
        
        AdressCard * card1 = [[AdressCard alloc] init];
        AdressCard * card2 = [[AdressCard alloc] init];
        AdressCard * card3 = [[AdressCard alloc] init];
        
        
        AdressBook * mybook = [[AdressBook alloc] initWithName:@"red adress book"];
        
        [card1 setName:aName];
        [card1 setEmail:aEmail];
        [card2 setName:bName];
        [card2 setEmail:bEmail];
        [card3 setName:cName];
        [card3 setEmail:cEmail];
        
        
        [mybook addCard:card1];
        [mybook addCard:card2];
        [mybook addCard:card3];
       
        
        AdressCard* temp = [mybook lookupNew:@"BBBB"];
        if (temp != nil)
            [temp print];
        else
            NSLog(@"not found");
        
        
        [mybook lookupall:@"D"];
      
        
    }
    return 0;
}
