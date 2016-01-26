//
//  Person.h
//  02-use extern variables
//
//  Created by red on 16/1/21.
//  Copyright © 2016年 red. All rights reserved.
//


#import <Foundation/Foundation.h>

@interface Person : NSObject
{
    int _age;
}
- (void)setAge: (int)a;
- (int)age;

@end
