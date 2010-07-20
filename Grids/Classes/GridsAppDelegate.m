//
//  GridsAppDelegate.m
//  Grids
//
//  Created by Tracy Snell on 10/17/08.
//  Copyright __MyCompanyName__ 2008. All rights reserved.
//

#import "GridsAppDelegate.h"
#import "RootViewController.h"


@implementation GridsAppDelegate

@synthesize window;
@synthesize navigationController;


- (id)init {
	if (self = [super init]) {
		// 
	}
	return self;
}


- (void)applicationDidFinishLaunching:(UIApplication *)application {
	
	// Configure and show the window
	[window addSubview:[navigationController view]];
	[window makeKeyAndVisible];
}


- (void)applicationWillTerminate:(UIApplication *)application {
	// Save data if appropriate
}


- (void)dealloc {
	[navigationController release];
	[window release];
	[super dealloc];
}

@end
