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


- (NSIndexSet *)lookupall:(NSString *)theName
{
    //look up only
//    NSIndexSet * result =[book indexesOfObjectsPassingTest:
//     ^ (id obj,NSUInteger idx,BOOL *stop)
//     {
//         if ([[obj name] caseInsensitiveCompare:theName] == NSOrderedSame) {
//             return YES;
//         }
//         else
//         {
//             return NO;
//         }
//     }];
//    NSArray * indexarray = [book objectsAtIndexes:result];
//    
//    [indexarray enumerateObjectsUsingBlock:^(AdressCard * obj, NSUInteger idx, BOOL *stop) {
//        
//        NSLog(@"%@   %@",obj.name,obj.email);
//        
//    }];
//    
//    return result;

    
    //look up and print
    NSLog(@"now is looking up: \"%@\"",theName);
    NSIndexSet * result =[book indexesOfObjectsPassingTest:
                          ^ (AdressCard* obj,NSUInteger idx,BOOL *stop)
                          {
                              
                              if ([[obj name] rangeOfString: theName].length != 0)
                              {
                                  [obj print];
                                  return YES;
                              }
                              else
                              {
                                  return NO;
                              }
                          }];
    return  result;
    
}


-(AdressCard *)lookupNew:(NSString *)theName
{
    NSUInteger  result = [book indexOfObjectPassingTest:
                         ^ (id obj,NSUInteger idx,BOOL * stop)
                         {
                             if ([[obj name] caseInsensitiveCompare:theName] == NSOrderedSame) {
                                 *stop = YES;
                                 return YES;
                             }
                             else
                                 return NO;
                         } ];
    if (result != NSNotFound) {
        return book[result];
        
    }
    else
        return  nil;
}

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

-(void)sort
{
    [book sortUsingSelector:@selector(compareNames:)];
}

@end
