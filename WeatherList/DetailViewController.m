//
//  DetailViewController.m
//  WeatherList
//
//  Created by Bill Snook on 2/13/16.
//  Copyright © 2016 BillSnook. All rights reserved.
//

#import "DetailViewController.h"
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
    self.view.backgroundColor = [UIColor coldColor];
	if (self.detailItem) {
	    self.detailDescriptionLabel.text = [self.detailItem description];
	}
}

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	[self configureView];
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

@end
