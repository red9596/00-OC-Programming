//
//  main.m
//  15-Enumerate Directory
//
//  Created by red on 16/2/7.
//  Copyright © 2016年 red. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSString * path;
        NSFileManager * fm;
        NSDirectoryEnumerator *dirEnum;
        NSArray * dirArray;
        
        fm = [NSFileManager defaultManager];
        
        path = [fm currentDirectoryPath];
        
        
        //使用此方法枚举目录，会枚举包括子文件夹在内的所有文件  方法2不枚举子目录
        //enumerate directory
        dirEnum = [fm enumeratorAtPath:path];
        
        NSLog(@"contents of %@",path);
        
        while ((path = [dirEnum nextObject]) != nil) {
            NSLog(@"The first way shows:   %@",path);
            
        }
        
        
        //another way to enumerate   不枚举子目录
        dirArray = [fm contentsOfDirectoryAtPath:[ fm currentDirectoryPath] error:nil];
//        此处快速枚举为不必要    可以使用NSLog(@"%@",dirArray)，作用相同
        for (path in dirArray) {
            NSLog(@"Another way shows:%@",path);
//            NSLog(@"%@",dirArray);
        }
        
    }
    return 0;
}
