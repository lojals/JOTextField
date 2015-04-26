//
//  JOTextField.m
//  eldorado
//
//  Created by Jorge Raul Ovalle Zuleta on 12/15/14.
//  Copyright (c) 2014 jomobile.co. All rights reserved.
//

#import <Pop/POP.h>
#import "JOTextField.h"
#import "JOLabel.h"
#import "Vars.h"

@implementation JOTextField
@synthesize type,view,tooltip;
-(void)awakeFromNib{
    self.layer.cornerRadius = 5.0f;
    self.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.layer.borderWidth = 0.5;
    self.delegate = self;
    self.keyboardAppearance = UIKeyboardAppearanceDark;
    self.autocorrectionType = UITextAutocorrectionTypeNo;
    self.autocapitalizationType = UITextAutocapitalizationTypeNone;
    self.font = [UIFont fontWithName:@"Roboto-Light" size:FONT_SMALL];
    UIView *views = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 20)];
    self.leftView = views;
    self.leftViewMode = UITextFieldViewModeAlways;
}

-(void)config{
    switch (type) {
        case TYPE_EMAIL:
            self.placeholder = @"EJEMPLO@MAIL.COM";
            self.keyboardType = UIKeyboardTypeEmailAddress;
        break;
        case TYPE_NAME:
            self.placeholder = @"EJ: RODOLFO MOTA";
        break;
        case TYPE_PASSWORD:
            self.placeholder = @"••••••";
            self.secureTextEntry = true;
        break;
        case TYPE_NUMBER:
            self.placeholder = @"45";
            self.keyboardType = UIKeyboardTypeNumberPad;
        break;
    }
}

-(void)textFieldDidBeginEditing:(UITextField *)textField{
    self.rightViewMode = UITextFieldViewModeNever;
    textField.layer.borderColor = [UIColor colorWithRed:0.067 green:0.608 blue:0.608 alpha:1].CGColor;
    textField.layer.borderWidth = 2.0f;
}

-(void)textFieldDidEndEditing:(UITextField *)textField{
    textField.layer.borderColor = [UIColor lightGrayColor].CGColor;
    textField.layer.borderWidth = 0.5f;
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    if(textField){
        [textField resignFirstResponder];
    }
    return NO;
}

-(NSString*)validate{
    err = @"";
    switch (type) {
        case TYPE_EMAIL:
            err = ([self validateEmail:self.text]&&![self.text isEqualToString:@""])? @"" : @"Email no válido";
            break;
        case TYPE_NAME:
            err = (![self.text isEqualToString:@""])? @"" : @"Ingresa tu nombre";
            break;
        case TYPE_PASSWORD:
            err = self.text.length < 6 ? @"Mayor a 6 carácteres" : @"";
            break;
        case TYPE_NUMBER:
            err = (![self.text isEqualToString:@""])? @"" : @"¿Edad?";
            break;
    }
    if (![err isEqualToString:@""]) {
        [self setError];
    }
    return err;
}

- (BOOL) validateEmail: (NSString *) candidate {
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:candidate];
}

-(void)setError{
    self.layer.borderColor = [UIColor colorWithRed:0.561 green:0.157 blue:0.063 alpha:1].CGColor;
    self.layer.borderWidth = 2.0f;
    tooltip = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 30, self.frame.size.height)];
    tooltip.backgroundColor = [UIColor colorWithRed:0.561 green:0.157 blue:0.063 alpha:1];
    [tooltip setBackgroundColor:[UIColor colorWithRed:0.561 green:0.157 blue:0.063 alpha:1]];
    [tooltip setTitle:@"?" forState:UIControlStateNormal];
    [tooltip setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    tooltip.titleLabel.font = [UIFont fontWithName:@"Roboto-Light" size: FONT_MEDIUM];
    [tooltip addTarget:self action:@selector(extendHelp) forControlEvents:UIControlEventTouchUpInside];
    self.rightView = tooltip;
    self.rightViewMode = UITextFieldViewModeUnlessEditing;
}


-(void)extendHelp{
    if (active) {
        active = false;
        tooltip.titleLabel.font = [UIFont fontWithName:@"Roboto-Light" size: FONT_MEDIUM];
        [tooltip setTitle:@"?" forState:UIControlStateNormal];
        POPSpringAnimation *sA1 = [POPSpringAnimation animation];
        sA1.property = [POPAnimatableProperty propertyWithName:kPOPViewFrame];
        sA1.toValue = [NSValue valueWithCGRect:CGRectMake(0, 0, 30, self.frame.size.height)];
        [sA1 setValue:@"toCenter2" forKey:@"animName"];
        sA1.springBounciness = 10;
        sA1.springSpeed = 10;
        [self.rightView pop_addAnimation:sA1 forKey:@"toCenter2"];
    }else{
        active = true;
        tooltip.titleLabel.font = [UIFont fontWithName:@"Roboto-Light" size: FONT_XSMALL];
        [tooltip setTitle:err forState:UIControlStateNormal];
        POPSpringAnimation *sA1 = [POPSpringAnimation animation];
        sA1.property = [POPAnimatableProperty propertyWithName:kPOPViewFrame];
        sA1.toValue = [NSValue valueWithCGRect:self.frame];
        [sA1 setValue:@"toCenter2" forKey:@"animName"];
        sA1.springBounciness = 10;
        sA1.springSpeed = 10;
        [self.rightView pop_addAnimation:sA1 forKey:@"toCenter2"];
    }
}

@end
