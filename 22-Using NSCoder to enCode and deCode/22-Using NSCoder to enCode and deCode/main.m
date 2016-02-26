//
//  main.m
//  22-Using NSCoder to enCode and deCode
//
//  Created by red on 16/2/10.
//  Copyright © 2016年 red. All rights reserved.
//

//利用NSCoder类归档类对象
//会直接将对象写入文件



#import <Foundation/Foundation.h>






@interface Person : NSObject<NSCoding>
@property int age;
@property NSString *name;

@end

@implementation Person
- (void)encodeWithCoder:(NSCoder *)aCoder
{
    /*此处的key值在编码和解码的时候需要一致,注意在同一文件中要和其他类的key避免冲突*/
    //父类的归档方法不能被子类继承，继承后会导致冲突
    [aCoder encodeObject:_name forKey:@"PersonName"];
    [aCoder encodeInt:_age forKey:@"PersonAge"];
    NSLog(@"Person: %@ is archived",self.name);
    
}
-(Person*)initWithCoder:(NSCoder *)aDecoder
{
    _name =  [aDecoder decodeObjectForKey:@"PersonName"];
    _age  =  [aDecoder decodeIntForKey:@"PersonAge"];
    NSLog(@"Person: %@ is unarchived",self.name);
    return self;
}
@end


@interface Student : Person
@property float mark;
@end

@implementation Student
-(void)encodeWithCoder:(NSCoder *)aCoder
{
    //不可以继承父类的编码方法
    //[super encodeWithCoder:aCoder];
    [aCoder encodeObject:self.name forKey:@"StudentName"];
    [aCoder encodeInt:self.age forKey:@"StudentAge"];
    [aCoder encodeFloat:_mark forKey:@"StudentMark"];
    NSLog(@"Student: %@ is archived",self.name);
}
-(Student *)initWithCoder:(NSCoder *)aDecoder
{
    //不可以继承父类的解码方法
    //self = [super initWithCoder:aDecoder];
    self.name =  [aDecoder decodeObjectForKey:@"StudentName"];
    self.age  =  [aDecoder decodeIntForKey:@"StudentAge"];
    self.mark = [aDecoder decodeFloatForKey:@"StudentMark"];
    NSLog(@"Student: %@ is unarchived",self.name);
    return self;

}


@end


int main(int argc, const char * argv[]) {
    @autoreleasepool {
//  编码过程
//        Person * p = [[Person alloc]init];
//        p.name = @"penson1";
//        p.age = 10;
//        
//        
//        Student * s = [[Student alloc] init];
//        s.name = @"student1";
//        s.age = 20;
//        s.mark = 33.33;
//        
//        [NSKeyedArchiver archiveRootObject:p toFile:@"person"];
//        [NSKeyedArchiver archiveRootObject:s toFile:@"person"];

        
        
        
       //解码过程,两个类编码和解码同一文件会导致覆盖
       
        
        Person * p = [NSKeyedUnarchiver unarchiveObjectWithFile:@"person"];
        NSLog(@"---person p name:%@  age:%i",p.name,p.age);
        Student * s = [NSKeyedUnarchiver unarchiveObjectWithFile:@"person"];
    NSLog(@"---student name:%@  age:%i  mark:%f",s.name,s.age,s.mark);
       
        
        
        
        
        
    }
    return 0;
}
