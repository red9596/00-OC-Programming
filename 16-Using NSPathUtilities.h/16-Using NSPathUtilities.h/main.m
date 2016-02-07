//
//  main.m
//  16-Using NSPathUtilities.h
//
//  Created by red on 16/2/7.
//  Copyright © 2016年 red. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSString * fName = @"path.m";
        NSFileManager *fm;
        NSString * path,*tempdir,*extension,*homedir,*fullpath;
        
        NSArray * components;
        
        
        fm = [NSFileManager defaultManager];
        
        //obtain system temporary directory
        tempdir = NSTemporaryDirectory();
        NSLog(@"temporary directory is %@",tempdir);
        
        
        //obtain the base directory
        //[path lastPathComponent]方法显示最后一级文件夹名称
        path = [fm currentDirectoryPath];
        NSLog(@"base dir is %@",[path lastPathComponent]);
        
        //获取文件的路径  并把文件名添加到路径后，形成完整路径 需要加“/”
        fullpath = [[path  stringByAppendingString:@"/"] stringByAppendingString:fName];
        NSLog(@"fullpath to %@   is %@ ",fName,fullpath);
        
        //获取文件名
        extension = [fullpath lastPathComponent];
        NSLog(@"extension for %@ is %@",fullpath,extension);
        
        //获取用户的主目录
        homedir = NSHomeDirectory();
        NSLog(@"your home directory is %@",homedir);
        
        
        //拆分路径为各组成部分
        components = [homedir pathComponents];
        
        for (path in components) {
            NSLog(@"%@",path);
        }
    }
    return 0;
}
