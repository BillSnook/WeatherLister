//
//  DetailPhoneViewController.m
//  WeatherList
//
//  Created by William Snook on 2/14/16.
//  Copyright © 2016 BillSnook. All rights reserved.
//

#import "DetailPhoneViewController.h"
#import "PhoneDetailCell.h"
#import "UIColor+CustomColors.h"


@interface DetailPhoneViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (weak, nonatomic) IBOutlet UIView *headerView;
@property (weak, nonatomic) IBOutlet UILabel *cityLabel;
@property (weak, nonatomic) IBOutlet UILabel *cityTemp;
@property (weak, nonatomic) IBOutlet UIImageView *cityIcon;

@end

@implementation DetailPhoneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self configureView];
    self.tableView.allowsSelection = NO;
    self.cityLabel.text = [self.detailItem objectForKey: @"name"];
    NSArray *list = [self.detailItem objectForKey: @"list"];
    NSDictionary *day = list[0];
    NSNumber *tempNumber = [day objectForKey: @"temp"];
    int tempInt = [tempNumber intValue];
    self.cityTemp.text = [@(tempInt) stringValue]; // @"68";
    
    self.backColorValue = [UIColor backgroundColor: tempInt];
    self.view.backgroundColor = self.backColorValue;
    self.tableView.backgroundColor = self.backColorValue;
    self.headerView.backgroundColor = self.backColorValue;
}

- (IBAction)touchBackButton:(UIButton *)sender {
    if (self.splitViewController.collapsed) {
        [(UINavigationController *)self.splitViewController.viewControllers[0]
         popToRootViewControllerAnimated:YES];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table View

- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {   // custom view for header. will be adjusted to default or specified header height
    return self.headerView;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSArray *list = [self.detailItem objectForKey: @"list"];
    return [list count] - 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    long listRow = indexPath.row + 1;       // list index for next
    NSArray *list = [self.detailItem objectForKey: @"list"];
    NSDictionary *day = list[listRow];
    PhoneDetailCell *phone = (PhoneDetailCell *)[tableView dequeueReusableCellWithIdentifier:@"phoneDetailCell" forIndexPath:indexPath];
    
    phone.contentView.backgroundColor = self.backColorValue;
    NSNumber *dateNumber = [day objectForKey: @"dt"];
    double dateValue = [dateNumber doubleValue];
    
    if ( 0 == indexPath.row ) {
        phone.cityDay.text = @"Tomorrow";
    } else {
        NSDateFormatter *ts = [[NSDateFormatter alloc] init];
        NSDate *testDate = [NSDate dateWithTimeIntervalSince1970:dateValue];
        
        [ts setDateFormat:@"EEEE"];
        //    [ts setDateFormat:@"yyyy-MM-dd kk:mm:ss.SSS"];
        NSString *timeInfo = [ts stringFromDate: testDate];
        
        phone.cityDay.text = timeInfo;
    }
    NSNumber *tempNumber = [day objectForKey: @"temp"];
    int tempInt = [tempNumber intValue];
    phone.cityTemp.text = [@(tempInt) stringValue]; // @"68";
    //    phone.cityTemp.text = [day objectForKey: @"temp"];
    
    return phone;
}


@end
