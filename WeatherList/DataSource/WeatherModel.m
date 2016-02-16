//
//  WeatherModel.m
//  WeatherList
//
//  Created by William Snook on 2/14/16.
//  Copyright © 2016 BillSnook. All rights reserved.
//

#import "WeatherModel.h"

@implementation WeatherModel


- (instancetype)init {
    self = [super init];
    if (!self) {
        return nil;
    }
    return self;
}

/*
        Input JSON data
{   "city": {"name":"London"},
    "list":[
            {   "dt":1455472800,
                "main": {
                    "temp_max": 78.0
                },
                "weather": [{
                    "main":"rain"
                }
				]
            },
            {   "dt":1455472800,
                "main": {
                    "temp_max": 78.0
                }
				"weather": [{
					"main":"rain"
				}
				]
            }
    ]
}
*/
/*
        Model structure
{   "name" : "Cairo"
    "list" : [
              {"dt":1455472800,"temp":72,"weather":"rain"},
              {"dt":1455472800,"temp":72,"weather":"rain"}
             ]
}
*/

- (Boolean)makeModel: (NSDictionary *)newData  {
    
    // First check incoming data is valid
    if ( nil == newData ) {
        // Error
        return false;
    }
//    NSLog( @"Reponse: %@", [newData description] );

    NSDictionary *city = [newData objectForKey: @"city"];
    if ( nil == city ) {
        // Error
        return false;
    }
    NSString *cityName = [city objectForKey: @"name"];
    if ( nil == cityName ) {
        // Error
        return false;
    }
    
    NSArray *list = [newData objectForKey: @"list"];
    if ( nil == list ) {
        // Error
        return false;
    }
    
    // Then extract selected data to our model
    NSMutableDictionary *buildModel = [NSMutableDictionary dictionaryWithCapacity: 5];
    [buildModel setObject: cityName forKey: @"name"];

    NSMutableArray *buildCityList = [NSMutableArray arrayWithCapacity: 8];
    for ( NSDictionary *listEntry in list ) {
        NSMutableDictionary *buildList = [NSMutableDictionary dictionaryWithCapacity: 3];
        NSNumber *dateNumber = [listEntry objectForKey: @"dt"];
        [buildList setObject: dateNumber forKey: @"dt"];

        NSDictionary *entryMain = [listEntry objectForKey: @"temp"];
        NSNumber *tempNumber = [entryMain objectForKey: @"max"];
        [buildList setObject: tempNumber forKey: @"temp"];

        NSArray *weatherList = [listEntry objectForKey: @"weather"];
        NSDictionary *entryWeather = [weatherList firstObject];
        NSString *weatherString = [entryWeather objectForKey: @"main"];
        [buildList setObject: weatherString forKey: @"weather"];
        
        [buildCityList addObject: buildList];
    }
    
    [buildModel setObject: buildCityList forKey: @"list"];
    self.currentModel = [NSDictionary dictionaryWithDictionary: buildModel];
    return true;
}

@end
