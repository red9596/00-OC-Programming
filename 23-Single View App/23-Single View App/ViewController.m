//
//  ViewController.m
//  23-Single View App
//
//  Created by red on 16/2/11.
//  Copyright © 2016年 red. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize display;

-(IBAction)click1
{
    display.text = @"show";
}



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
