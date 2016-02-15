//
//  PadDetailCell.h
//  WeatherList
//
//  Created by Bill Snook on 2/15/16.
//  Copyright © 2016 BillSnook. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PadDetailCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIView *padView;
@property (weak, nonatomic) IBOutlet UILabel *cityDay;
@property (weak, nonatomic) IBOutlet UILabel *cityTemp;

@end
