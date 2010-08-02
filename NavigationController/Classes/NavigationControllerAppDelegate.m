//
//  NavigationControllerAppDelegate.m
//  NavigationController
//
//  Created by Chakra on 31/03/10.
//  Copyright Chakra Interactive Pvt Ltd 2010. All rights reserved.
//

#import "NavigationControllerAppDelegate.h"

@implementation NavigationControllerAppDelegate

@synthesize window,navigationController;


- (void)applicationDidFinishLaunching:(UIApplication *)application {    

    // Override point for customization after application launch
	[window addSubview:navigationController.view];
    [window makeKeyAndVisible];
}


- (void)dealloc {
    [window release];
	[navigationController release];
    [super dealloc];
}


@end
