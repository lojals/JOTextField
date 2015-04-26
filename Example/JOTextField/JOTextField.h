//
//  JOTextField.h
//  eldorado
//
//  Created by Jorge Raul Ovalle Zuleta on 12/15/14.
//  Copyright (c) 2014 jomobile.co. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Vars.h"

@interface JOTextField : UITextField <UITextFieldDelegate>{
    NSString *err;
    BOOL active;
}

//@property int type
@property int type;
@property (strong,nonatomic) UIView *view;
@property (strong,nonatomic) UIButton *tooltip;


-(void)config;
-(NSString*)validate;
-(void)setError;

@end
