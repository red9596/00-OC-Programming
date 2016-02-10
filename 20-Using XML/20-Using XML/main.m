//
//  main.m
//  20-Using XML
//
//  Created by red on 16/2/8.
//  Copyright © 2016年 red. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
   //使用 NSDictionary   NSArray 对象的
     //writeToFile:<#(nonnull NSString *)#> atomically:<#(BOOL)#>
    //方法，将字典写入文件，字典的key必须是string
        //字典的值或数组的值可以是NSString NSArray NSDictionary NSData NSData NSNumber
        NSDictionary * glossary = @{
                                    @"A class":@"aaa",
                                    @"B class":@"bbb",
                                    @"C class":@"ccc",
                                    };
        
        if ([glossary writeToFile:@"glossary.xml" /*在此可以直接指定文件后缀名*/atomically:YES] == NO) {
            NSLog(@"save fail");
            
        }
        
        
        NSDictionary * readGlossary = [NSDictionary dictionaryWithContentsOfFile:@"glossary.xml"];
        for (NSString * str in readGlossary) {
            NSLog(@"%@ :%@",str,readGlossary[str]);
        }
        
    }
    return 0;
}
