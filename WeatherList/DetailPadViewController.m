//
//  DetailPadViewController.m
//  WeatherList
//
//  Created by William Snook on 2/14/16.
//  Copyright © 2016 BillSnook. All rights reserved.
//

#import "DetailPadViewController.h"
#import "PadDetailCell.h"
#import "UIColor+CustomColors.h"

@interface DetailPadViewController ()

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet UIView *currentView;
@property (weak, nonatomic) IBOutlet UILabel *currentTemp;
@property (weak, nonatomic) IBOutlet UILabel *tomorrowTemp;
@property (weak, nonatomic) IBOutlet UILabel *cityName;
@property (weak, nonatomic) IBOutlet UIImageView *cityIcon;

@end

@implementation DetailPadViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self configureView];

    if ( self.detailItem ) {
        self.currentView.hidden = NO;
    } else {
        self.currentView.hidden = YES;
    }
    NSArray *list = [self.detailItem objectForKey: @"list"];
    NSDictionary *day = list[0];
    NSNumber *tempNumber = [day objectForKey: @"temp"];
    int tempInt = [tempNumber intValue];
	self.currentTemp.text = [@(tempInt) stringValue]; // @"68";
	self.cityName.text = [self.detailItem objectForKey: @"name"];
	self.cityIcon.image = [self getIcon: [day objectForKey: @"weather"]];

    self.backColorValue = [UIColor backgroundColor: tempInt];

    day = list[1];
    tempNumber = [day objectForKey: @"temp"];
    tempInt = [tempNumber intValue];
    self.tomorrowTemp.text = [@(tempInt) stringValue]; // @"68";
    
    self.view.backgroundColor = self.backColorValue;
    self.currentView.backgroundColor = self.backColorValue;
	self.collectionView.backgroundColor = self.backColorValue;
	self.collectionView.hidden = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)touchBackButton:(id)sender {
//	if (self.splitViewController.collapsed) {
		[(UINavigationController *)self.splitViewController.viewControllers[0]
		 popToRootViewControllerAnimated:YES];
//	}
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
	NSArray *list = [self.detailItem objectForKey: @"list"];
	return [list count] - 2;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
	NSArray *list = [self.detailItem objectForKey: @"list"];
	long listRow = indexPath.row + 2;       // list index for next
	NSDictionary *day = list[listRow];
	
	PadDetailCell *pad = (PadDetailCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"padDetailCell" forIndexPath:indexPath];
	
	pad.contentView.backgroundColor = self.backColorValue;
	NSNumber *dateNumber = [day objectForKey: @"dt"];
	double dateValue = [dateNumber doubleValue];
	NSDateFormatter *ts = [[NSDateFormatter alloc] init];
	NSDate *testDate = [NSDate dateWithTimeIntervalSince1970: dateValue];
	
	[ts setDateFormat:@"EE"];
	NSString *timeInfo = [ts stringFromDate: testDate];
	
	pad.cityDay.text = timeInfo;
	NSNumber *tempNumber = [day objectForKey: @"temp"];
	int tempInt = [tempNumber intValue];
	pad.cityTemp.text = [@(tempInt) stringValue]; // @"68";
	pad.padView.backgroundColor = [UIColor warmColor];
	
	[pad setNeedsLayout];
	[pad layoutIfNeeded];
	
	CALayer *layer = pad.padView.layer;
	layer.shadowOffset = CGSizeMake(0, 3);
	layer.shadowColor = [[UIColor blackColor] CGColor];
	layer.shadowRadius = 1.0f;
	layer.shadowOpacity = 0.50f;
	layer.shadowPath = [[UIBezierPath bezierPathWithRect:layer.bounds] CGPath];
	
	return pad;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
	return 1;
}


@end
