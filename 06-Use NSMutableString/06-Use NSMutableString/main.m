//
//  main.m
//  06-Use NSMutableString
//
//  Created by red on 16/1/22.
//  Copyright © 2016年 red. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        
        NSString *str1 = @"this is string A";  //str1就是不可变字符串
        NSString *search,*replace;
        //使用 NSMutableString 关键字 创建了一个可变字符串
        NSMutableString * mstr;
        NSRange substr;
        
        //使用c格式字符串时，要进行UTF8转换
        NSString * str3 = [[NSString alloc] initWithUTF8String:"123"];
        NSLog(@"%@",str3);
        
        
        //从不可变字符串创建可变字符串
        mstr = [NSMutableString stringWithString:str1];
        NSLog(@"%@",mstr);
        
        //插入字符
        [mstr insertString:@"mutable" atIndex:7];
        NSLog(@"%@",mstr);
        
        //在末尾拼接
        [mstr insertString:@" and string B" atIndex:[mstr length]];
        NSLog(@"%@",mstr);
        //直接添加
        [mstr appendString:@" and string C"];
        NSLog(@"%@",mstr);
        
        
        //根据范围删除字符
        [mstr deleteCharactersInRange: NSMakeRange(16, 13)];
        NSLog(@"%@",mstr);
        
        //查找后删除
        substr = [mstr rangeOfString:@"string B and "];
        
        if (substr.location != NSNotFound) {
            [mstr deleteCharactersInRange:substr];
            NSLog(@"%@",mstr);
        }
        
        //直接设置为可变的字符串
        [mstr setString:@"this is string A"];
        NSLog(@"%@",mstr);
        
        //替换一些字符
        [mstr replaceCharactersInRange:NSMakeRange(8, 8)
                            withString:@"a mutable string"];
        NSLog(@"%@",mstr);
        
        //查找和替换
        search = @"this is";
        replace =@"an example of";
        substr = [mstr rangeOfString:search];
        
        if ( substr.location != NSNotFound) {
            [mstr replaceCharactersInRange:substr withString:replace];
            NSLog(@"%@",mstr);
        }
        
        //查找和替换所有匹配项
        // 如果 replace中的字符串包含search，则会引起无限循环
        search = @"a";
        replace = @"X";
        
        substr = [mstr rangeOfString:search];
        while (substr.location != NSNotFound) {
            [mstr replaceCharactersInRange:substr withString:replace];
            substr = [mstr rangeOfString:search];
            
        }
        NSLog(@"%@",mstr);
        
    
        //搜索并全部替换操作方法，这个方法有避免无限循环的功能
        //replaceOccurrencesOfString:<#(nonnull NSString *)#> withString:<#(nonnull NSString *)#>
        //options:<#(NSStringCompareOptions)#>
        //range:<#(NSRange)#>
        
        [mstr replaceOccurrencesOfString:@"e" withString:@"---e---" options:nil
                                   range: NSMakeRange(0,[mstr length])  ];
        NSLog(@"%@",mstr);
        
        
        
        //删除字符串，用 deleteCharactersInRange:<#(NSRange)#>
        [mstr deleteCharactersInRange: NSMakeRange(3, 3)];
        NSLog(@"%@",mstr);
        
    }
    return 0;
}
