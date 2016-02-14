//
//  padCell.h
//  WeatherList
//
//  Created by Bill Snook on 2/13/16.
//  Copyright © 2016 BillSnook. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PadCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIView *padView;
@property (weak, nonatomic) IBOutlet UILabel *cityName;
@property (weak, nonatomic) IBOutlet UILabel *cityTemp;

@end
