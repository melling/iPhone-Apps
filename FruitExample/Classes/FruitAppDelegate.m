//
//  FruitAppDelegate.m
//  Fruit
//
//  Created by Michael Mellinger on 6/14/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import "FruitAppDelegate.h"
#import "RootViewController.h"
#import "Fruit.h"


@implementation FruitAppDelegate

@synthesize window;
@synthesize navigationController;
@synthesize fruits;

#pragma mark -
#pragma mark Application lifecycle

- (void)applicationDidFinishLaunching:(UIApplication *)application {    
    
	Fruit *apple = [[Fruit alloc] initWithName:@"Apple" description:@"Red Delicious..."];
	Fruit *orange = [[Fruit alloc] initWithName:@"Orange" description:@"best when squeezed into a juice..."];
	Fruit *watermelon = [[Fruit alloc] initWithName:@"Watermelon" description:@"Flavor of Jolly Rancher..."];

	self.fruits = [[NSMutableArray alloc] initWithObjects:apple,orange,watermelon,nil];
				
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

