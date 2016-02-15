//
//  DetailViewController.m
//  WeatherList
//
//  Created by Bill Snook on 2/13/16.
//  Copyright © 2016 BillSnook. All rights reserved.
//

#import "DetailViewController.h"
#import "PhoneDetailCell.h"
#import "UIColor+CustomColors.h"


@interface DetailViewController ()

@end

@implementation DetailViewController

#pragma mark - Managing the detail item

- (void)setDetailItem:(NSDictionary *)newDetailItem {
	if (_detailItem != newDetailItem) {
	    _detailItem = newDetailItem;
	        
	    // Update the view.
	    [self configureView];
	}
}

- (void)configureView {
    // Update the user interface for the detail item.
    if (self.detailItem) {
//        NSLog( @"detailItem: %@", [self.detailItem description] );
    }
}

- (UIImage *)getIcon: (NSString *)fileName {
	if ( [fileName isEqualToString: @"Clear"] ) {
		return [UIImage imageNamed: @"Sunny"];
	} else if ( [fileName isEqualToString: @"Rain"] ) {
		return [UIImage imageNamed: @"Rainy"];
	} else if ( [fileName isEqualToString: @"Snow"] ) {
		return [UIImage imageNamed: @"Snowy"];
	} else if ( [fileName isEqualToString: @"Cloud"] ) {
		return [UIImage imageNamed: @"Cloudy"];
	} else {
		NSLog( @"Unrecognized weather type: %@", fileName );
		return nil;
	}
}

@end
