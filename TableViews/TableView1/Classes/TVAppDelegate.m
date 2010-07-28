//
//  TVAppDelegate.m
//  TV
//
//  Created by Michael Mellinger on 7/27/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import "TVAppDelegate.h"

@implementation TVAppDelegate

@synthesize window;


#pragma mark -
#pragma mark Application lifecycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
    
	window = [[UIWindow alloc]
			  initWithFrame:[[UIScreen mainScreen] bounds]] ;
	myTable = [[UITableView alloc]
			   initWithFrame:[UIScreen mainScreen].applicationFrame
			   style:UITableViewStylePlain];
	theSimpsons = [[NSArray arrayWithObjects: @"Homer Jay Simpson",
					@"Bartholomew \"Bart\" J. Simpson",
					@"Marjorie \"Marge\" Simpson", 
					@"Lisa Marie Simpson",
					@"Margaret \"Maggie\" Simpson",
					@"Abraham J. Simpson",
					@"Santa’s Little Helper",
					@"Ned Flanders",
					@"Apu Nahasapeemapetilon",
					@"Clancy Wiggum", @"Charles Montgomery Burns",
					nil] retain];
	myTable.dataSource = self; [window addSubview:myTable];
    // Override point for customization after application launch.
	
    [window makeKeyAndVisible];
	
	return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, called instead of applicationWillTerminate: when the user quits.
     */
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    /*
     Called as part of  transition from the background to the inactive state: here you can undo many of the changes made on entering the background.
     */
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}


- (void)applicationWillTerminate:(UIApplication *)application {
    /*
     Called when the application is about to terminate.
     See also applicationDidEnterBackground:.
     */
}


#pragma mark -
#pragma mark Memory management

- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application {
    /*
     Free up as much memory as possible by purging cached data objects that can be recreated (or reloaded from disk) later.
     */
}

- (void)dealloc {	
	[window release];
	[myTable release];
	[theSimpsons release];
	[super dealloc];
}

// DataSource methods
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
	return [theSimpsons count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"simpsons"];
	if (cell == nil) {
		cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"simpsons"] autorelease];
	}
	cell.textLabel.text = [theSimpsons objectAtIndex:indexPath.row];
	return cell;
}


@end
