//
//  Networking.m
//  WeatherList
//
//  Created by William Snook on 2/13/16.
//  Copyright © 2016 BillSnook. All rights reserved.
//

#import "Networking.h"
#import "AFNetworking.h"
#import "WeatherModel.h"


static NSString * const BaseURLString = @"http://api.openweathermap.org/data/2.5/forecast/daily";

static NSString * const APP_ID = @"bf98d8919f8a2f660ef889b7c056fdf5";

@implementation Networking


- (void)getData: (NSString *)cityName {

    NSURL *URL = [NSURL URLWithString: BaseURLString];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    NSMutableDictionary *params = [NSMutableDictionary dictionaryWithCapacity: 7];
    [params setObject: APP_ID forKey: @"APPID"];
    [params setObject: cityName forKey: @"q"];
    [params setObject: @"json" forKey: @"mode"];
    [params setObject: @"8" forKey: @"cnt"];
    [params setObject: @"imperial" forKey: @"units"];
    [manager GET:URL.absoluteString parameters:params progress:nil success:^(NSURLSessionTask *task, id responseObject) {
//        NSLog( @"JSON: %@", responseObject );
        NSDictionary *resultDict = (NSDictionary *)responseObject;
//        NSLog( @"List: %@", [[resultDict objectForKey: @"list"] description] );
        
        WeatherModel *modelData = [[WeatherModel alloc] init];
        if ( [modelData makeModel: resultDict] ) {
            [[NSNotificationCenter defaultCenter] postNotificationName:NotificationForWeatherData object:nil userInfo: [modelData currentModel]];
        }
    } failure:^(NSURLSessionTask *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];

}

@end
