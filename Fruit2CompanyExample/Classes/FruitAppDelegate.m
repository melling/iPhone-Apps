//
//  FruitAppDelegate.m
//  Fruit
//
//  Created by Michael Mellinger on 6/14/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import "FruitAppDelegate.h"
#import "RootViewController.h"
#import "Company.h"


@implementation FruitAppDelegate

@synthesize window;
@synthesize navigationController;
@synthesize companies;

#pragma mark -
#pragma mark Application lifecycle

- (void)applicationDidFinishLaunching:(UIApplication *)application {    
    
	Company *aapl = [[Company alloc] initWithName:@"AAPL" description:@"Red Delicious..."];
	Company *goog = [[Company alloc] initWithName:@"GOOG" description:@"best when squeezed into a juice..."];
	Company *msft = [[Company alloc] initWithName:@"MSFT" description:@"Flavor of Jolly Rancher..."];
	Company *ibm = [[Company alloc] initWithName:@"IBM" description:@"Flavor of Jolly Rancher..."];
	Company *orcl = [[Company alloc] initWithName:@"ORCL" description:@"Flavor of Jolly Rancher..."];
	Company *csco = [[Company alloc] initWithName:@"CSCO" description:@"Flavor of Jolly Rancher..."];
	Company *c = [[Company alloc] initWithName:@"C" description:@"Flavor of Jolly Rancher..."];

	self.companies = [[NSMutableArray alloc] initWithObjects:aapl,goog,msft,ibm,orcl,csco,c,nil];
				
    // Override point for customization after app launch    
	
	[window addSubview:[navigationController view]];
    [window makeKeyAndVisible];
}


- (void)applicationWillTerminate:(UIApplication *)application {
	// Save data if appropriate
}


#pragma mark -
#pragma mark Memory management

- (void)dealloc {
	[navigationController release];
	[window release];
	[super dealloc];
}


@end

