//
//  AdressBook.m
//  08-AdressBook and AdressCard
//
//  Created by red on 16/1/23.
//  Copyright © 2016年 red. All rights reserved.
//

#import "AdressBook.h"

@implementation AdressBook

@synthesize bookname,book;

- (instancetype)initWithName:(NSString *)name
{
    self = [super init];
    if (self) {
        bookname = [NSString stringWithString: name];
        book =[NSMutableArray array];
    }
    return self;
}
-(instancetype) init
{
    return [self initWithName:@"No name"];
}
-(void)addCard:(AdressCard *)theCard
{
    [book addObject:theCard];
}
-(int)entries
{
    return (int)[book count];
}
-(void)list
{
    //快速枚举的for
    for (AdressCard * theCard in book) {
        NSLog(@"index: %lu    name:%@    adress:%@",(unsigned long)[book indexOfObject: theCard ],theCard.name,theCard.email);
    }
}


- (AdressCard *)lookup:(NSString *)theName
{
    for (AdressCard * tempCard in book) {
        if ([[tempCard name] isEqualToString:theName]) {
            return tempCard;
        }
    }
    return nil;
}

-(void)removeCard:(NSString *)theCardName
{
    AdressCard * toRemove;
    if ([self lookup: theCardName] != nil) {
        toRemove = [self lookup: theCardName];
        [book removeObjectIdenticalTo:toRemove];
        NSLog(@"object removed");
    }
    else
        NSLog(@"remove failed");
}

@end
