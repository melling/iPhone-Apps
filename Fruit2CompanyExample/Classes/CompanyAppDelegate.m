//
//  CompanyAppDelegate.m
//  Fruit
//
//  Created by Michael Mellinger on 6/14/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import "CompanyAppDelegate.h"
#import "RootViewController.h"
#import "Company.h"


@implementation CompanyAppDelegate

@synthesize window;
@synthesize navigationController;
@synthesize companies;

#pragma mark -
#pragma mark Application lifecycle

- (void)applicationDidFinishLaunching:(UIApplication *)application {    
    
	Company *aapl = [[Company alloc] initWithName:@"AAPL" description:@"Apple Inc."];
	Company *goog = [[Company alloc] initWithName:@"GOOG" description:@"Google Inc."];
	Company *msft = [[Company alloc] initWithName:@"MSFT" description:@"Microsoft Corporation"];
	Company *ibm = [[Company alloc] initWithName:@"IBM" description:@"International Business Machines Corp."];
	Company *orcl = [[Company alloc] initWithName:@"ORCL" description:@"Oracle"];
	Company *csco = [[Company alloc] initWithName:@"CSCO" description:@"Cisco"];
	Company *c = [[Company alloc] initWithName:@"C" description:@"Citibank"];

	NSLog(@"Loading companies");
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

