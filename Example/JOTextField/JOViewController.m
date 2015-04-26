//
//  JOViewController.m
//  JOTextField
//
//  Created by Jorge Ovalle on 04/25/2015.
//  Copyright (c) 2014 Jorge Ovalle. All rights reserved.
//

#import "JOViewController.h"

@interface JOViewController ()

@end

@implementation JOViewController
@synthesize textFieldExample,textFieldExample2;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //Example 1: from Storyboard
    textFieldExample.type = TYPE_EMAIL;
    //textFieldExample.required = true;
    [textFieldExample config];
    
    //Example 2:
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
