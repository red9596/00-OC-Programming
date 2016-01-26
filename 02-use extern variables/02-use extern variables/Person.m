//
//  Person.m
//  02-use extern variables
//
//  Created by red on 16/1/21.
//  Copyright © 2016年 red. All rights reserved.
//

#import "Person.h"



@implementation Person
- (int)age
{
    //declare it in some file with "extern" when use
    extern int gYear;

    return _age + gYear;
}
- (void)setAge:(int)a
{
    _age = a;
}

@end
