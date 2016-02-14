//
//  Networking.m
//  WeatherList
//
//  Created by William Snook on 2/13/16.
//  Copyright © 2016 BillSnook. All rights reserved.
//

#import "Networking.h"
#import "AFNetworking.h"

static NSString * const BaseURLString = @"http://api.openweathermap.org/data/2.5/forecast/daily";

static NSString * const APP_ID = @"bf98d8919f8a2f660ef889b7c056fdf5";

@implementation Networking


- (void)getData {
//    NSString *string = [NSString stringWithFormat:@"%@?APPID=%@&format=json&cnt=7&cityID=%@", BaseURLString, APP_ID, @"Tokyo"];
//    NSURL *url = [NSURL URLWithString: BaseURLString];
//    NSURLRequest *request = [NSURLRequest requestWithURL:url];

    NSURL *URL = [NSURL URLWithString: BaseURLString];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    NSMutableDictionary *params = [NSMutableDictionary dictionaryWithCapacity: 7];
    [params setObject: APP_ID forKey: @"APPID"];
    [params setObject: @"Tokyo" forKey: @"q"];
    [params setObject: @"json" forKey: @"mode"];
    [params setObject: @"7" forKey: @"cnt"];
    [params setObject: @"imperial" forKey: @"units"];
    [manager GET:URL.absoluteString parameters:params progress:nil success:^(NSURLSessionTask *task, id responseObject) {
//        NSLog( @"JSON: %@", responseObject );
        NSDictionary *resultDict = (NSDictionary *)responseObject;
        NSLog( @"List: %@", [[resultDict objectForKey: @"list"] description] );
        
    } failure:^(NSURLSessionTask *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
    
    
    
    
//    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
//    operation.responseSerializer = [AFJSONResponseSerializer serializer];
//    
//    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
//        
//        // 3
//        self.weather = (NSDictionary *)responseObject;
//        self.title = @"JSON Retrieved";
//        [self.tableView reloadData];
//        
//    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//        
//        // 4
//        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Error Retrieving Weather"
//                                                            message:[error localizedDescription]
//                                                           delegate:nil
//                                                  cancelButtonTitle:@"Ok"
//                                                  otherButtonTitles:nil];
//        [alertView show];
//    }];
//    
//    [operation start];

}

@end
