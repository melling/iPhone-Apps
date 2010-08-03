//
//  MinutesToMidnightAppDelegate.m
//  MinutesToMidnight
//
//  Created by Michael Mellinger on 6/14/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import "MinutesToMidnightAppDelegate.h"
#import "MinutesToMidnightViewController.h"

@implementation MinutesToMidnightAppDelegate

@synthesize window;
@synthesize viewController;


- (void)applicationDidFinishLaunching:(UIApplication *)application {    
    
	timer = [NSTimer scheduledTimerWithTimeInterval:(1.0) target:self selector:@selector(onTimer) userInfo:nil repeats:YES];        

    // Override point for customization after app launch    
    [window addSubview:viewController.view];
    [window makeKeyAndVisible];

}

- (void)onTimer {
	[viewController updateLabel];
}

- (void)applicationWillTerminate:(UIApplication *)application {
	[timer invalidate];
}



- (void)dealloc {
	[timer release];

    [viewController release];
    [window release];
    [super dealloc];
}


@end
