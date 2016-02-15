
//
//  UIColor+CustomColors.m
//  WeatherList
//
//  Created by William Snook on 2/13/16.
//  Copyright © 2016 BillSnook. All rights reserved.
//

#import "UIColor+CustomColors.h"

@implementation UIColor (CustomColors)

+ (UIColor *)coldColor {
    return [UIColor colorWithRed:198/255.0 green:217/255.0 blue:240/255.0 alpha: 1.0];
}

+ (UIColor *)niceColor {
    return [UIColor colorWithRed:252.0/255.0 green:213.0/255.0 blue:181.0/255.0 alpha: 1.0];
}

+ (UIColor *)warmColor {
    return [UIColor colorWithRed:218/255.0 green:150/255.0 blue:148/255.0 alpha: 1.0];
}

+ (UIColor *)backColor {
    return [UIColor colorWithRed:238/255.0 green:235/255.0 blue:225/255.0 alpha: 1.0];
}

+ (UIColor *)backgroundColor: (int)temperature {
    if ( temperature < 65 ) {
        return [UIColor coldColor];
    } else if ( temperature > 75 ) {
        return [UIColor warmColor];
    } else {
        return [UIColor niceColor];
    }
}

@end
