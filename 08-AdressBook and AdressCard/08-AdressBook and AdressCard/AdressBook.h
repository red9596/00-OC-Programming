//
//  AdressBook.h
//  08-AdressBook and AdressCard
//
//  Created by red on 16/1/23.
//  Copyright © 2016年 red. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "AdressCard.h"

@interface AdressBook : NSObject
@property (nonatomic,copy) NSString * bookname;
@property (nonatomic,strong) NSMutableArray * book;

-(instancetype) initWithName:(NSString*) name;

-(void) addCard:(AdressCard *) theCard;
-(void) removeCard: (NSString *) theCardName;

-(AdressCard *) lookup:(NSString*) theName;

-(int) entries;  //返回card数量
-(void) list;


@end
