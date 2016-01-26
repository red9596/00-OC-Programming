//
//  main.m
//  05-Use NSString Class
//
//  Created by red on 16/1/22.
//  Copyright © 2016年 red. All rights reserved.
//



/*
  @"Programming is fun" 以这种方式创建字符串时，创建的就是一个不可变的对象
  可以使用NSSring类来处理不可变字符串
 
 
 */
#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        //字符串@"This is string A"即为不可变对象
        //str1 str2是指针，是可以改变的
        //他们指向的地址可以改变
        //basic operations
        NSString *str1 = @"This is string A";
        NSString *str2 = @"This is string B";
        NSString *res;
        NSComparisonResult comparisonResult;
        
        //get length
        NSLog(@"Length of str1 is :%lu",[str1 length]);
        
        //copy
        res = [NSString stringWithString:str1];
        NSLog(@"copy : %@",res);

        //copy one string to the end of the other string
        str2 = [str1 stringByAppendingString: str2];
        NSLog(@"concatentation : %@",str2);
        
        //test wether they are equal
        if ([str1 isEqualToString:res] == YES) {
            NSLog(@"str1 is equal to res");
            
        }
        else
            NSLog(@"str1 is not equal to res");
    
        //test wether s string is greater ,equal or less than the other
        //NSOrderedAscending : 升序的
        //NSOrderedSame      : 同序的
        //NSOrderedDescending: 降序的
        comparisonResult = [str1 compare:str2];
        if (comparisonResult == NSOrderedAscending) {
            NSLog(@"str1 <  str2");
            
        }
        else if(comparisonResult == NSOrderedSame)
            NSLog(@"str1  = str2 ");
        else if(comparisonResult == NSOrderedDescending)
            NSLog(@"str1 > str2");
    
        //turn the string into capitals letters
        res = [str1 uppercaseString];  //no effect to str1
        NSLog(@"upper converse:%@",res);
        
        //turn the string into small letters
        res = [res lowercaseString];
        NSLog(@"lower converse:%@",res);
        

        //show the original string
        NSLog(@"%@",str1);
        
    }
    return 0;
}
