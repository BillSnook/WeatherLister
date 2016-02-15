//
//  Networking.h
//  WeatherList
//
//  Created by William Snook on 2/13/16.
//  Copyright © 2016 BillSnook. All rights reserved.
//

#import <Foundation/Foundation.h>

static NSString * const NotificationForWeatherData = @"NotificationForWeatherData";

@interface Networking : NSObject

- (void)getData: (NSString *)cityName;

@end
