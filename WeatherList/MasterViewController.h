//
//  MasterViewController.h
//  WeatherList
//
//  Created by Bill Snook on 2/13/16.
//  Copyright © 2016 BillSnook. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DetailViewController;

@interface MasterViewController : UITableViewController

@property (strong, nonatomic) DetailViewController *detailViewController;


@end

