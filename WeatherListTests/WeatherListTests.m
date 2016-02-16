//
//  WeatherListTests.m
//  WeatherListTests
//
//  Created by Bill Snook on 2/13/16.
//  Copyright © 2016 BillSnook. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "WeatherModel.h"




@interface WeatherListTests : XCTestCase

@end

@implementation WeatherListTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (NSMutableDictionary *)createTestDictionary {

	NSMutableDictionary *testDictionary = [NSMutableDictionary dictionaryWithCapacity: 2];
	NSMutableDictionary *workingDictionary1 = [NSMutableDictionary dictionaryWithCapacity: 1];
	NSMutableArray *listArray = [NSMutableArray arrayWithCapacity: 2];
	NSMutableDictionary *workingDictionary2 = [NSMutableDictionary dictionaryWithCapacity: 3];
	NSMutableDictionary *deepDictionary1 = [NSMutableDictionary dictionaryWithCapacity: 1];
	NSMutableDictionary *deepDictionary2 = [NSMutableDictionary dictionaryWithCapacity: 1];
	NSMutableArray *weatherArray = [NSMutableArray arrayWithCapacity: 2];
	
	[workingDictionary1 setObject: @"London" forKey: @"name"];
	[testDictionary setObject: workingDictionary1 forKey: @"city"];
	
	[workingDictionary2 setObject: @(1455472800) forKey:@"dt"];
	[deepDictionary1 setObject: @(78) forKey:@"max"];
	[workingDictionary2 setObject: deepDictionary1 forKey:@"temp"];
	[deepDictionary2 setObject: @"Rain" forKey:@"main"];
	[weatherArray addObject: deepDictionary2];
	[workingDictionary2 setObject: weatherArray forKey:@"weather"];
	[listArray addObject: workingDictionary2];
	
	[deepDictionary1 removeAllObjects];
	[deepDictionary2 removeAllObjects];
	[weatherArray removeAllObjects];
	[workingDictionary2 removeAllObjects];
	[workingDictionary2 setObject: @(1455489600) forKey:@"dt"];
	[deepDictionary1 setObject: @(69) forKey:@"max"];
	[workingDictionary2 setObject: deepDictionary1 forKey:@"temp"];
	[deepDictionary2 setObject: @"Clear" forKey:@"main"];
	[weatherArray addObject: deepDictionary2];
	[workingDictionary2 setObject: weatherArray forKey:@"weather"];
	[listArray addObject: workingDictionary2];
	
	[testDictionary setObject: listArray forKey: @"list"];
	return testDictionary;
}

- (void)test1 {
	// Test handling of nil model input data
	
	NSLog( @"Test example" );
	WeatherModel *modelData = [[WeatherModel alloc] init];
	Boolean result = [modelData makeModel: nil];
	XCTAssertFalse( result );
}

- (void)test2 {
	// Test handling of expected downloaded data
	
	NSDictionary *testDictionary;
	testDictionary = [self createTestDictionary];
	
	WeatherModel *modelData = [[WeatherModel alloc] init];
	Boolean result = [modelData makeModel: testDictionary];
	NSLog( @"Test example, modelData: %@", [modelData.currentModel description] );
	XCTAssertTrue( result );
}

//- (void)testPerformanceExample {
//    // This is an example of a performance test case.
//    [self measureBlock:^{
//        // Put the code you want to measure the time of here.
//    }];
//}

@end
