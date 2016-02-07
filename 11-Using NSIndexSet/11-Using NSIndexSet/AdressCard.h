//
//  AdressCard.h
//  08-AdressBook and AdressCard
//
//  Created by red on 16/1/23.
//  Copyright © 2016年 red. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AdressCard : NSObject

-(void) setName: (NSString *) theName;
-(void) setEmail: (NSString *) theEmail;
-(NSString *) name;
-(NSString *) email;
-(void)print;

-(BOOL)isEqual: (AdressCard *) thecard;

-(NSComparisonResult) compareNames: (AdressCard *) element;
@end
