//
//  UIColor+CY.h
//  MyBooks
//
//  Created by zcy on 2018/7/26.
//  Copyright © 2018年 CY. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (CY)

/**
 * 通过十六进制数字进行创建color
 */
+ (UIColor*) colorWithHex:(long)hexColor;

/**
 * 通过十六进制字符串进行创建标签color
 */
+ (UIColor *)labelColorWithHexString:(NSString *)colorStrig;

@end
