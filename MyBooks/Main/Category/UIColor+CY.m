//
//  UIColor+CY.m
//  MyBooks
//
//  Created by zcy on 2018/7/26.
//  Copyright © 2018年 CY. All rights reserved.
//

#import "UIColor+CY.h"

@implementation UIColor (CY)
+ (UIColor *)colorWithHex:(long)hexColor{
    return [UIColor colorWithHex:hexColor alpha:1.];
}

+ (UIColor *)labelColorWithHexString:(NSString *)colorStrig{
    const char *hexChar = [colorStrig cStringUsingEncoding:NSUTF8StringEncoding];
    int hexNumber;
    sscanf(hexChar, "%x", &hexNumber);
    return [UIColor colorWithHex:(NSInteger)hexNumber alpha:1.];
}

+ (UIColor *)colorWithHex:(long)hexColor alpha:(float)opacity{
    float red = ((float)((hexColor & 0xFF0000) >> 16))/255.0;
    float green = ((float)((hexColor & 0xFF00) >> 8))/255.0;
    float blue = ((float)(hexColor & 0xFF))/255.0;
    return [UIColor colorWithRed:red green:green blue:blue alpha:opacity];
}

@end
