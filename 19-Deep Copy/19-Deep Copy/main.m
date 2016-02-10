//
//  main.m
//  19-Deep Copy
//
//  Created by red on 16/2/8.
//  Copyright © 2016年 red. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
     
        NSMutableArray * dataArray = [NSMutableArray arrayWithObjects:
            [NSMutableString stringWithString:@"one"],
            [NSMutableString stringWithString:@"two"],
            [NSMutableString stringWithString:@"three"],
                                      nil];
        NSMutableArray *dataArray2;
        
        NSMutableString *mStr;
        
        NSLog(@"dataArray");
        for (NSString * elem in dataArray) {
            NSLog(@"  %@",elem);
        }
        
        //slight copy array2
        dataArray2 = [dataArray mutableCopy];
        
        //change array1
        mStr = dataArray[0];
        [mStr appendString:@"111"];
        
    
        //show 2arrays after slight copy
        for (NSString * elem in dataArray) {
            NSLog(@"array1:   %@",elem);
        }
        
        for (NSString * elem in dataArray2) {
            NSLog(@"array2:   %@",elem);
        }
        
        
        
        mStr = [NSMutableString stringWithString:@"222"];
        
        [dataArray2 replaceObjectAtIndex:0 withObject:mStr];
        
        
        
        //show 2arrays after deep copy
        NSLog(@"deep copy:");
        for (NSString * elem in dataArray) {
            NSLog(@"array1:   %@",elem);
        }
        
        for (NSString * elem in dataArray2) {
            NSLog(@"array2:   %@",elem);
        }
        
    }
    return 0;
}
