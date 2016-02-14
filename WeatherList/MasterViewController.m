//
//  MasterViewController.m
//  WeatherList
//
//  Created by Bill Snook on 2/13/16.
//  Copyright © 2016 BillSnook. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"

#import "PhoneCell.h"
#import "PadCell.h"

#import "Networking.h"

#import "UIColor+CustomColors.h"


@interface MasterViewController ()

@property NSMutableArray *objects;
@property Networking *netMgr;

@end

@implementation MasterViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
//	self.navigationItem.leftBarButtonItem = self.editButtonItem;

	UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
	self.navigationItem.rightBarButtonItem = addButton;
	self.detailViewController = (DetailViewController *)[[self.splitViewController.viewControllers lastObject] topViewController];
    
    self.view.backgroundColor = [UIColor coldColor];
    
    self.netMgr = [[Networking alloc] init];
    [self.netMgr getData];
    
}

- (void)viewWillAppear:(BOOL)animated {
	self.clearsSelectionOnViewWillAppear = self.splitViewController.isCollapsed;
	[super viewWillAppear:animated];
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

- (void)insertNewObject:(id)sender {
	if (!self.objects) {
	    self.objects = [[NSMutableArray alloc] init];
	}
	[self.objects insertObject:[NSDate date] atIndex:0];
	NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
	[self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}

#pragma mark - Segues

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
	if ([[segue identifier] isEqualToString:@"showDetail"]) {
	    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
	    NSDate *object = self.objects[indexPath.row];
	    DetailViewController *controller = (DetailViewController *)[[segue destinationViewController] topViewController];
	    [controller setDetailItem:object];
	    controller.navigationItem.leftBarButtonItem = self.splitViewController.displayModeButtonItem;
	    controller.navigationItem.leftItemsSupplementBackButton = YES;
	}
}

- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id <UIViewControllerTransitionCoordinator>)coordinator {
    
    NSLog( @"In viewWillTransitionToSize" );
    [self.tableView reloadData];
}


#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return self.objects.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

	NSDate *object = self.objects[indexPath.row];
	
	if ( UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad ) {
		PadCell *pad = (PadCell *)[tableView dequeueReusableCellWithIdentifier:@"padMasterCell" forIndexPath:indexPath];

        pad.contentView.backgroundColor = [UIColor coldColor];
        pad.padView.backgroundColor = [UIColor warmColor];
		
///		pad.cityName.text = [object description];
///		pad.cityTemp.text = @"68";
        
        [pad setNeedsLayout];
        [pad layoutIfNeeded];
        
		CALayer *layer = pad.padView.layer;
		layer.shadowOffset = CGSizeMake(0, 2);
		layer.shadowColor = [[UIColor blackColor] CGColor];
		layer.shadowRadius = 1.0f;
		layer.shadowOpacity = 0.80f;
        layer.shadowPath = [[UIBezierPath bezierPathWithRect:layer.bounds] CGPath];
        
		return pad;
	} else {
		PhoneCell *phone = (PhoneCell *)[tableView dequeueReusableCellWithIdentifier:@"phoneMasterCell" forIndexPath:indexPath];

        phone.contentView.backgroundColor = [UIColor coldColor];
        phone.phoneView.backgroundColor = [UIColor warmColor];

///		phone.cityName.text = [object description];
///		phone.cityTemp.text = @"68";
//		phone.cityIcon = @"68";
		
        [phone setNeedsLayout];
        [phone layoutIfNeeded];

		CALayer *layer = phone.phoneView.layer;
		layer.shadowOffset = CGSizeMake(0, 2);
		layer.shadowColor = [[UIColor blackColor] CGColor];
		layer.shadowRadius = 2.0f;
		layer.shadowOpacity = 0.80f;
        layer.shadowPath = [[UIBezierPath bezierPathWithRect:layer.bounds] CGPath];

		return phone;
	}
}

@end
