//
//  main.m
//  21-Using NSkeyArchiver
//
//  Created by red on 16/2/10.
//  Copyright © 2016年 red. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        NSDictionary * glossary = @{
                                    @"A class":@"aaa",
                                    @"B class":@"bbb",
                                    @"C class":@"ccc",
                                    };
        [NSKeyedArchiver archiveRootObject:glossary toFile:@"glossary.archive"];
        
        
        
        
        NSDictionary * readGlossary = [NSKeyedUnarchiver unarchiveObjectWithFile:@"glossary.archive"];
        
        for (NSString * str in readGlossary) {
            NSLog(@"%@ :%@",str,readGlossary[str]);
        }
        
    }
    return 0;
}
