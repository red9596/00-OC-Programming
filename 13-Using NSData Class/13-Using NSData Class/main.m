//
//  main.m
//  13-Using NSData Class
//
//  Created by red on 16/2/6.
//  Copyright © 2016年 red. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSFileManager * fm;
        NSData * fileData,*fileDatatemp;
                
        //init a NSdata
        fileDatatemp = [@"this is  flie123" dataUsingEncoding:NSUTF8StringEncoding];
        NSLog(@"%@",fileDatatemp);
        //creat a new file of newfile2
        [fm createFileAtPath:@"newflie2" contents:fileDatatemp attributes:nil];
       
        
        //read the newflie2 into a string
        NSLog(@"%@", [NSString stringWithContentsOfFile:@"newfile3" encoding:NSUTF8StringEncoding error: NULL]);
        
        
        //read newflie2
        fileData = [fm contentsAtPath:@"newflie2"];
        
        if (fileData == nil) {
            NSLog(@"file read falied");
            NSLog(@"%@",fileDatatemp);
            
            return 1;
        }
        
        //creat and write data into newflie3
        if ([fm createFileAtPath:@"newflie3" contents:fileData attributes:nil] == NO) {
            NSLog(@"creat newflie3 falied");
            return 2;
        }
        
        NSLog(@"file copy done");
        
        //read the newflie3 into a string
        NSString * str = [NSString stringWithContentsOfFile:@"newfile3" encoding:NSUTF8StringEncoding error: NULL];
        NSLog(@"%@", str);
        
        
        
        //remove newfile2
        [fm removeItemAtPath:@"newfile2" error:NULL];
        
    
    }
    return 0;
}
