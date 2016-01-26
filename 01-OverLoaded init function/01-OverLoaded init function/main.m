//
//  main.m
//  01-OverLoaded init function
//
//  Created by red on 16/1/21.
//  Copyright © 2016年 red. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject
{
    int _age;
}
- (Person *) init;
- (void) print;
@end

@implementation Person

//it should be (instancetype) here
//otherwise Person's subclass would get a function which
//return type is (Person *)
- (Person * )init
{
    self = [super init];
    if (self) {
        _age = 1;
    }
    return self;
}
- (void)print
{
    NSLog(@"Person age is %d",_age);
}
@end

@interface Student : Person
- (void) print;
@end

@implementation Student
- (void)print
{
    NSLog(@"Student age is %d",_age);
}


@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        Person * p = [[Person alloc] init];
        [p print];
        id  s = [[Student alloc] init];
        [s print];
        
    }
    return 0;
}
