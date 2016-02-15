//
//  UIColor+CustomColors.h
//  WeatherList
//
//  Created by William Snook on 2/13/16.
//  Copyright © 2016 BillSnook. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (CustomColors)

+ (UIColor *)coldColor;
+ (UIColor *)niceColor;
+ (UIColor *)warmColor;
+ (UIColor *)backColor;

+ (UIColor *)backgroundColor: (int)temperature;

@end
