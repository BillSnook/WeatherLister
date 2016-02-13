//
//  DetailViewController.h
//  WeatherList
//
//  Created by Bill Snook on 2/13/16.
//  Copyright © 2016 BillSnook. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end

