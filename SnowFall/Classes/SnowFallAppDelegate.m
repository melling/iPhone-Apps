//
//  SnowFallAppDelegate.m
//  SnowFall
//
//  Created by apple on 10/9/08.
//  Copyright Amuck LLC 2008. All rights reserved.
//

#import "SnowFallAppDelegate.h"
#import "SnowFallViewController.h"

@implementation SnowFallAppDelegate

@synthesize window;
@synthesize viewController;


- (void)applicationDidFinishLaunching:(UIApplication *)application {	
	
	// Override point for customization after app launch	
    [window addSubview:viewController.view];
	[window makeKeyAndVisible];
}


- (void)dealloc {
    [viewController release];
	[window release];
	[super dealloc];
}


@end
