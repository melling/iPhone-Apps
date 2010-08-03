//
//  FirstViewController.m
//  TabBarNavigator
//
//  Created by Michael Mellinger on 7/25/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import "FirstViewController.h"
#import "NewViewController.h"
#import "WatchlistViewController.h"
#import "Notes1ViewController.h"
#import "Notes2ViewController.h"
#import "HackerNewsController.h"
#import "GoogleController.h"

@implementation FirstViewController

- (IBAction)push:(id)sender
{
	NSLog(@"FVC: push");
	NewViewController *controller = [[NewViewController alloc] initWithNibName:@"NewViewController" bundle:nil];
	[[self navigationController] pushViewController:controller animated:YES];
	[controller release], controller = nil;

}

- (IBAction)notes2:(id)sender
{
	NSLog(@"FVC: Notes #2");
	Notes2ViewController *controller = [[Notes2ViewController alloc] initWithNibName:@"Notes2ViewController" bundle:nil];
	[[self navigationController] pushViewController:controller animated:YES];
	[controller release], controller = nil;
	
}

- (IBAction)notes1:(id)sender
{
	NSLog(@"FVC: Notes #1");
	Notes1ViewController *controller = [[Notes1ViewController alloc] initWithNibName:@"Notes1ViewController" bundle:nil];
	[[self navigationController] pushViewController:controller animated:YES];
	[controller release], controller = nil;
	
}

- (IBAction)startHackerNews:(id)sender
{
	NSLog(@"FVC: Loading Hacker News");
	HackerNewsController *controller = [[HackerNewsController alloc] initWithNibName:@"HackerNewsController" bundle:nil];
	[[self navigationController] pushViewController:controller animated:YES];
	[controller release], controller = nil;
	
}

- (IBAction)startGoogle:(id)sender
{
	NSLog(@"FVC: Loading Google");
	GoogleController *controller = [[GoogleController alloc] initWithNibName:@"GoogleController" bundle:nil];
	[[self navigationController] pushViewController:controller animated:YES];
	[controller release], controller = nil;
	
}

- (IBAction)watchlist:(id)sender
{
	NSLog(@"FVC: RootViewController");
	WatchlistViewController *controller = [[WatchlistViewController alloc] initWithNibName:@"WatchlistViewController" bundle:nil];
	[[self navigationController] pushViewController:controller animated:YES];
	[controller release], controller = nil;
	
}

- (IBAction)openDrudgeReport:(id)sender {
	
	NSLog(@"Opening Drudge");
	NSString *urlAddress = @"http://drudgereport.com";
//	NSLog(urlAddress);
	//Create a URL object.
	NSURL *url = [NSURL URLWithString:urlAddress];
	
	[[UIApplication sharedApplication] openURL:url];
	
}

/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}
*/

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}

@end
