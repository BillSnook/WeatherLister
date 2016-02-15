//
//  WeatherModel.h
//  WeatherList
//
//  Created by William Snook on 2/14/16.
//  Copyright © 2016 BillSnook. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WeatherModel : NSObject

@property (nonatomic, strong) NSDictionary *currentModel;

- (Boolean)makeModel: (NSDictionary *)newData;

@end
