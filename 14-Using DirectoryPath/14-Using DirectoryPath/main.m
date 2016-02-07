//
//  main.m
//  14-Using DirectoryPath
//
//  Created by red on 16/2/6.
//  Copyright © 2016年 red. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSString * dirName = @"testdir";
        NSString * path ;
        NSFileManager *fm;
        
        
        //创建文件管理器实例
        fm = [NSFileManager defaultManager];
 
        //获取当前工作目录路径
        path = [fm currentDirectoryPath];
        NSLog(@"Current directory path is %@",path);
        
        
        //创建一个新目录
        if ([fm createDirectoryAtPath:dirName withIntermediateDirectories:YES attributes:nil error:NULL] == NO) {
            NSLog(@"can't create diectory");
            return  1;
            
        }
        
        
        //重命名新目录
        if ([fm moveItemAtPath:dirName toPath:@"newdir" error:NULL] == NO) {
            NSLog(@"directory rename failed");
            return 2;
            
        }
        
        //更改目录到新的目录
        if ([fm changeCurrentDirectoryPath:@"newdir"] ==NO) {
            NSLog(@"change die falied");
            return  3;
        }
        
        //获取并显示当前工作目录
        path = [fm currentDirectoryPath];
        NSLog(@"current dir path is %@",path);
        
        
        
        //清除创建的目录
        if ([fm removeItemAtPath:path error:nil] == NO) {
            NSLog(@"path clean failed");
        }
        else
            NSLog(@"path newdir clean success");
        
        
        NSLog(@"all done");
    }
    return 0;
}
