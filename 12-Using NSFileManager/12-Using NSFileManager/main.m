//
//  main.m
//  12-Using NSFileManager
//
//  Created by red on 16/2/6.
//  Copyright © 2016年 red. All rights reserved.
//



#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
     
        
        //testName 文件的默认路径需要与main的可执行文件的路径相同
        NSString * fName = @"testName";
        NSFileManager *fm;
        NSDictionary * attr;
        
        //需要创建文件管理器的实例
        fm = [NSFileManager defaultManager];
        
        //test if the flie exist
        if ([fm fileExistsAtPath:fName] == NO) {
            NSLog(@"File Not Exist!");
            return 1;
        }
        
        //creat a duplicate
        if ([fm copyItemAtPath:fName toPath:@"newfile" error:nil] == NO) {
            NSLog(@"File Copy Failed");
            return 2;
        }
        
        //test if the 2 file is the same
        if ([fm contentsEqualAtPath:fName andPath:@"newfile"] ==NO) {
            NSLog(@"2 files are not equal");
            return 3;
        }
        
        //rename the duplicate
        if ([fm moveItemAtPath:@"newfile" toPath:@"newfile2" error:nil] == NO) {
            NSLog(@"file rename Failed");
            return 4;
        }
        
        //obtain the size of newfile2
        if ((attr = [fm attributesOfItemAtPath:@"newfile2" error:NULL]) == nil) {
            NSLog(@"could not read newflie2");
            return 5;
        }
        
        NSLog(@"flie size is %llu bytes",[[attr objectForKey:NSFileSize]  unsignedLongLongValue]);
       
        //read the flie into a string
        NSString * str = [NSString stringWithContentsOfFile:@"newfile2" encoding:NSUTF8StringEncoding error: NULL];
        NSLog(@"%@", str);
        
        
        
        //remove newfile2
       [fm removeItemAtPath:@"newfile2" error:NULL];
        
        
        
    }
    return 0;
}
