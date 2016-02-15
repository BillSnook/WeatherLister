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

- (void)setDetailItem:(id)newDetailItem {
	if (_detailItem != newDetailItem) {
	    _detailItem = newDetailItem;
	        
	    // Update the view.
	    [self configureView];
	}
}

- (void)configureView {
    // Update the user interface for the detail item.
    if (self.detailItem) {
        NSLog( @"detailItem: %@", [self.detailItem description] );
    }
}

@end
