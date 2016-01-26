//
//  Year.m
//  02-use extern variables
//
//  Created by red on 16/1/21.
//  Copyright © 2016年 red. All rights reserved.
//

#import "Year.h"


gYear = 0;



@implementation Year
+ (void)yearpass
{
    gYear++;
    printf("1 year passed\n");
}
@end
