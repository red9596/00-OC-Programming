//
//  AdressCard.m
//  08-AdressBook and AdressCard
//
//  Created by red on 16/1/23.
//  Copyright © 2016年 red. All rights reserved.
//

#import "AdressCard.h"

@implementation AdressCard
{
    NSString * _name;
    NSString * _email;
}



-(void)setName:(NSString *)theName
{
    _name = [NSString stringWithString:theName];
}
- (void)setEmail:(NSString *)theEmail
{
    _email = [NSString stringWithString:theEmail];
}
-(NSString *)name
{
    return _name;
}
- (NSString *)email
{
    return _email;
}
-(void)print
{
    NSLog(@"name is %@",_name);
    NSLog(@"Email is %@",_email);
}


-(BOOL)isEqual: (AdressCard *) thecard
{
    if ([self.name isEqualToString:thecard.name] == YES && [self.email isEqualToString:thecard.email] == YES) {
        return YES;
    }
    return NO;
}

-(NSComparisonResult)compareNames:(AdressCard *)element
{
    
    return [_name compare:[element name]];
}

@end
