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

@interface MasterViewController ()

@property NSMutableArray *objects;
@end

@implementation MasterViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	self.navigationItem.leftBarButtonItem = self.editButtonItem;

	UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
	self.navigationItem.rightBarButtonItem = addButton;
	self.detailViewController = (DetailViewController *)[[self.splitViewController.viewControllers lastObject] topViewController];
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
///		pad.cityName.text = [object description];
///		pad.cityTemp.text = @"68";
		
//		CALayer *layer = pad.padView.layer;
//		layer.shadowOffset = CGSizeMake(0, 2);
//		layer.shadowColor = [[UIColor blackColor] CGColor];
//		layer.shadowRadius = 2.0f;
//		layer.shadowOpacity = 0.80f;
//		CGRect f = layer.bounds;
//		NSLog( @"layer.bounds -> x: %02f, y: %02f, w: %02f, h: %02f", f.origin.x, f.origin.y, f.size.width, f.size.height);
//		
//		f.size.width -= 20;
//		layer.shadowPath = [[UIBezierPath bezierPathWithRect:f] CGPath];

		return pad;
	} else {
		PhoneCell *phone = (PhoneCell *)[tableView dequeueReusableCellWithIdentifier:@"phoneMasterCell" forIndexPath:indexPath];;
///		phone.cityName.text = [object description];
///		phone.cityTemp.text = @"68";
//		phone.cityIcon = @"68";
		
		CALayer *layer = phone.phoneView.layer;
//		layer.shadowOffset = CGSizeMake(0, 2);
//		layer.shadowColor = [[UIColor blackColor] CGColor];
//		layer.shadowRadius = 2.0f;
//		layer.shadowOpacity = 0.80f;
		CGRect f = layer.frame;
		NSLog( @"layer.frame -> x: %02f, y: %02f, w: %02f, h: %02f", f.origin.x, f.origin.y, f.size.width, f.size.height);
		f = phone.phoneView.frame;
		NSLog( @"phone.phoneView.frame -> x: %02f, y: %02f, w: %02f, h: %02f", f.origin.x, f.origin.y, f.size.width, f.size.height);
		f = self.view.bounds;
		NSLog( @"self.view.bounds -> x: %02f, y: %02f, w: %02f, h: %02f", f.origin.x, f.origin.y, f.size.width, f.size.height);
//
//		f.size.width -= 20;
//		layer.shadowPath = [[UIBezierPath bezierPathWithRect:f] CGPath];
		
		return phone;
	}
}

//- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
//	// Return NO if you do not want the specified item to be editable.
//	return YES;
//}
//
//- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
//	if (editingStyle == UITableViewCellEditingStyleDelete) {
//	    [self.objects removeObjectAtIndex:indexPath.row];
//	    [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
//	} else if (editingStyle == UITableViewCellEditingStyleInsert) {
//	    // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
//	}
//}

@end
