//
//  main.m
//  18-Using NSFileHandle To Add Contents
//
//  Created by red on 16/2/7.
//  Copyright © 2016年 red. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSFileManager * fm = [NSFileManager defaultManager];
        NSString *fileA, *fileB;
        
        fileA = @"fileA";
        fileB = @"fileB";
        
        NSData *contents1, *contents2;
        
        contents1 = [@"  and fileA" dataUsingEncoding:NSUTF8StringEncoding];
        contents2 = [@"this is fileB" dataUsingEncoding:NSUTF8StringEncoding];
        
        //create fileA and fileB
        [fm createFileAtPath:fileA contents:contents1 attributes:nil];
        [fm createFileAtPath:fileB contents:contents2 attributes:nil];
        
        
        
        NSFileHandle *inFile, *outFile;
        
        //open fileA to read
        inFile = [NSFileHandle fileHandleForReadingAtPath:@"fileA"];
        if (inFile == nil) {
            NSLog(@"open fileA fail");
            return 1;
        }
        
        //open fileB
        outFile = [NSFileHandle fileHandleForWritingAtPath:@"fileB"];
        if (outFile == nil) {
            NSLog(@"open fileB fail");
            return 2;
        }
        
        //look up at the end of fileB
        [outFile seekToEndOfFile];
        
        //read from fileA and write into fileB
        NSData *buffer;
        buffer = [inFile readDataToEndOfFile];
        [outFile writeData:buffer];
        
        //close the two file
        [inFile closeFile];
        [outFile closeFile];
        
        NSLog(@"%@",[NSString stringWithContentsOfFile:@"fileB" encoding:NSUTF8StringEncoding error:nil]);
        
        [fm removeItemAtPath:@"fileA" error:nil];
        [fm removeItemAtPath:@"fileB" error:nil];
        NSLog(@"temporary file removed  \nall done");
        
    }
    return 0;
}
