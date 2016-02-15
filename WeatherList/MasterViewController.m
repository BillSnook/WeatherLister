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

@property NSMutableArray *cities;

@end

@implementation MasterViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
	self.detailViewController = (DetailViewController *)[[self.splitViewController.viewControllers lastObject] topViewController];
    
    if ( UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad ) {
        self.view.backgroundColor = [UIColor coldColor];
        if ( self.splitViewController.collapsed ) {
            [self.navigationController setNavigationBarHidden: NO animated: NO];
        }
    } else {
        self.view.backgroundColor = [UIColor backColor];
    }
    
    self.cities = [NSMutableArray arrayWithObjects: @"San Francisco",@"London",@"Cairo",@"Tokyo",@"New York", nil];

    NSString *theName = NotificationForWeatherData;
    [[NSNotificationCenter defaultCenter]
     addObserver: self
     selector: @selector(newModelData:)
     name:theName
     object: nil];
    
    [self nextCity];
    
}

- (void)viewWillAppear:(BOOL)animated {
	self.clearsSelectionOnViewWillAppear = self.splitViewController.isCollapsed;

    [self.navigationController setNavigationBarHidden: YES animated: NO];

	[super viewWillAppear:animated];
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)nextCity {
    if ( [self.cities count] > 0 ) {
        NSString *next = [self.cities objectAtIndex: 0];
        [self.cities removeObjectAtIndex: 0];
        [[[Networking alloc] init] getData: next];
    }
}

- (void)newModelData: (NSNotification *)notification {
    NSLog( @"In newModelData: %@", [[notification userInfo] description] );
    dispatch_async( dispatch_get_main_queue(), ^{
        [self insertNewRow: [notification userInfo]];
        [self nextCity];
    });
//    [self.tableView reloadData];
}

- (void)insertNewRow:(NSDictionary *)newCity {
    if (!self.objects) {
        self.objects = [[NSMutableArray alloc] init];
    }
    [self.objects addObject: newCity];
    unsigned long countIndex = [self.objects count] - 1;
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:countIndex inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
//    [self.detailViewController setDetailItem: newCity];
}

#pragma mark - Segues

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
	if ([[segue identifier] isEqualToString:@"showDetail"]) {
        [self.navigationController setNavigationBarHidden: YES animated: NO];
	    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
	    NSDictionary *object = self.objects[indexPath.row];
        self.title = @"";
	    DetailViewController *controller = (DetailViewController *)[[segue destinationViewController] topViewController];
        [controller.navigationController setNavigationBarHidden: YES animated: NO];
	    [controller setDetailItem: object];
	    controller.navigationItem.leftBarButtonItem = self.splitViewController.displayModeButtonItem;
	    controller.navigationItem.leftItemsSupplementBackButton = YES;
	}
}

- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id <UIViewControllerTransitionCoordinator>)coordinator {
//  Cleanup drop shadows on table cells
//  NSLog( @"In viewWillTransitionToSize" );
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

	NSDictionary *city = self.objects[indexPath.row];
	
	if ( UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad ) {
		PadCell *pad = (PadCell *)[tableView dequeueReusableCellWithIdentifier:@"padMasterCell" forIndexPath:indexPath];

        pad.contentView.backgroundColor = [UIColor coldColor];
		
		pad.cityName.text = [city objectForKey: @"name"];
        NSNumber *tempNumber = [[[city objectForKey: @"list"] firstObject] objectForKey: @"temp"];
        int tempInt = [tempNumber intValue];
        pad.cityTemp.text = [@(tempInt) stringValue]; // @"68";
        pad.padView.backgroundColor = [UIColor backgroundColor: tempInt];
        
        [pad setNeedsLayout];
        [pad layoutIfNeeded];
        
		CALayer *layer = pad.padView.layer;
		layer.shadowOffset = CGSizeMake(0, 3);
		layer.shadowColor = [[UIColor blackColor] CGColor];
		layer.shadowRadius = 1.0f;
		layer.shadowOpacity = 0.50f;
        layer.shadowPath = [[UIBezierPath bezierPathWithRect:layer.bounds] CGPath];
        
		return pad;
	} else {
		PhoneCell *phone = (PhoneCell *)[tableView dequeueReusableCellWithIdentifier:@"phoneMasterCell" forIndexPath:indexPath];

        phone.contentView.backgroundColor = [UIColor backColor];

        phone.cityName.text = [city objectForKey: @"name"];
        NSNumber *tempNumber = [[[city objectForKey: @"list"] firstObject] objectForKey: @"temp"];
        int tempInt = [tempNumber intValue];
        phone.cityTemp.text = [@(tempInt) stringValue]; // @"68";
        phone.phoneView.backgroundColor = [UIColor backgroundColor: tempInt];

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
