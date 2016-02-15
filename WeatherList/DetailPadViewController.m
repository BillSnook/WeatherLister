//
//  DetailPadViewController.m
//  WeatherList
//
//  Created by William Snook on 2/14/16.
//  Copyright © 2016 BillSnook. All rights reserved.
//

#import "DetailPadViewController.h"
#import "UIColor+CustomColors.h"

@interface DetailPadViewController ()

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet UIView *currentView;
@property (weak, nonatomic) IBOutlet UILabel *currentTemp;
@property (weak, nonatomic) IBOutlet UILabel *tomorrowTemp;

@end

@implementation DetailPadViewController

//- (void)setDetailItem:(id)newDetailItem {
//    [super setDetailItem: newDetailItem];
//}

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

    self.backColorValue = [UIColor backgroundColor: tempInt];

    day = list[1];
    tempNumber = [day objectForKey: @"temp"];
    tempInt = [tempNumber intValue];
    self.tomorrowTemp.text = [@(tempInt) stringValue]; // @"68";
    
    self.view.backgroundColor = self.backColorValue;
    self.currentView.backgroundColor = self.backColorValue;
    self.collectionView.backgroundColor = self.backColorValue;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
