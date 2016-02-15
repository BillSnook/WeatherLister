//
//  DetailViewController.h
//  WeatherList
//
//  Created by Bill Snook on 2/13/16.
//  Copyright © 2016 BillSnook. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong,nonatomic) NSDictionary *detailItem;
@property (nonatomic,strong) UIColor *backColorValue;

- (void)setDetailItem:(NSDictionary *)newDetailItem;

- (void)configureView;

- (UIImage *)getIcon: (NSString *)fileName;

@end

