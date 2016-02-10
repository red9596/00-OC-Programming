//
//  main.m
//  17-Using NSFileHandle
//
//  Created by red on 16/2/7.
//  Copyright © 2016年 red. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        
        //create a flie named n
        NSFileManager * fm = [NSFileManager defaultManager];
        NSData * fileData;
        NSString * path = @"testFile";
        fileData = [@"this is  testflie" dataUsingEncoding:NSUTF8StringEncoding];
        [fm createFileAtPath:path contents:fileData attributes:nil];
        
      
        
        NSFileHandle *inFile, *outFile;
        NSData *buffer;
        
        inFile = [NSFileHandle fileHandleForReadingAtPath:path];
        
        
        if (inFile == nil) {
            NSLog(@"open fail");
            return 1;
            
        }
        
        
        //create a output file if necessary
        [fm createFileAtPath:@"testout" contents:nil attributes:nil];
        
        
        //open outfile to write
        outFile = [NSFileHandle fileHandleForWritingAtPath:@"testout"];
        
        if (outFile == nil) {
            NSLog(@"open outfile fail");
            return  2;
        }
        
        [outFile truncateFileAtOffset:0];
        
        
        //read from inFile and write to outFile
        buffer = [inFile readDataToEndOfFile];
        
        
        [outFile writeData:buffer];
        
        //close the inFile and outFile
        [inFile closeFile];
        [outFile closeFile];
        
        //show the files
        NSLog(@"%@",[NSString stringWithContentsOfFile:@"testout" encoding: NSUTF8StringEncoding error:NULL]);
        
        
        
        
        
        
        //remove newfile2
        [fm removeItemAtPath:@"testFile" error:NULL];
        

    }
    return 0;
}
