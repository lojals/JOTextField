//
//  JOTextField.h
//
//
//  Created by Jorge Raul Ovalle Zuleta on 04/25/15.
//  Copyright (c) 2015 All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Vars.h"

@interface JOTextField : UITextField <UITextFieldDelegate>{
    NSString *err;
    BOOL active;
}

//Properties
@property int  type;
@property BOOL required;

@property (strong,nonatomic) UIView *view;
@property (strong,nonatomic) UIButton *tooltip;

- (instancetype)initWithFrame:(CGRect)frame :(int)type;

-(void)config;
-(NSString*)validate;
-(void)setError;

@end
