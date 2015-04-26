//
//  Vars.h
//  eldorado
//
//  Created by Jorge Raul Ovalle Zuleta on 12/15/14.
//  Copyright (c) 2014 jomobile.co. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Vars : NSObject

typedef enum JOTypes
{
    TYPE_EMAIL    = 100,
    TYPE_NUMBER   = 101,
    TYPE_TEXT     = 102,
    TYPE_NAME     = 103,
    TYPE_PASSWORD = 104
} JOTypes;


typedef enum JOFontSizes
{
    FONT_XSMALL  = 13,
    FONT_SMALL   = 15,
    FONT_XMEDIUM  = 18,
    FONT_MEDIUM  = 21,
    FONT_LARGE   = 25,
    FONT_XLARGE  = 30
} JOFontSizes;

@end
