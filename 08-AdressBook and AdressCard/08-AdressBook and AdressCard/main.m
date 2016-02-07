//
//  main.m
//  08-AdressBook and AdressCard
//
//  Created by red on 16/1/23.
//  Copyright © 2016年 red. All rights reserved.
//

#import <Foundation/Foundation.h>

#include "AdressBook.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSString * aName = @"FFFF";
        NSString * aEmail = @"F@@@";
        NSString * bName = @"BBBB";
        NSString * bEmail = @"B@@@";
        NSString * cName = @"CCCC";
        NSString * cEmail = @"C@@@";
        
        
        AdressCard * card1 = [[AdressCard alloc] init];
        AdressCard * card2 = [[AdressCard alloc] init];
        AdressCard * card3 = [[AdressCard alloc] init];
        
        
        AdressBook * mybook = [[AdressBook alloc] initWithName:@"red adress book"];
        NSLog(@"entries in adress book: %i",[mybook entries]);
        
        [card1 setName:aName];
        [card1 setEmail:aEmail];
        [card2 setName:bName];
        [card2 setEmail:bEmail];
        [card3 setName:cName];
        [card3 setEmail:cEmail];
        
        
        [mybook addCard:card1];
        [mybook addCard:card2];
        [mybook addCard:card3];
        
        NSLog(@"entries in adress book: %i",[mybook entries]);
        
        [mybook list];
        
        AdressCard * temp = [mybook lookup:@"BBBB"];
        if (temp != nil)
            [temp print];
        else
            NSLog(@"not found");
        
        [mybook removeCard:@"AAAA"];
        
        //[mybook list];
        
        
        [mybook sort];
        [mybook list];
        
        
    }
    return 0;
}
