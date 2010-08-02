//
//  FirstViewController.m
//  NavigationController
//
//  Created by Chakra on 31/03/10.
//  Copyright 2010 Chakra Interactive Pvt Ltd. All rights reserved.
//

#import "FirstViewController.h"
#import "SecondViewController.h"


@implementation FirstViewController

@synthesize secondViewController;

- (void)viewDidLoad {
	[super viewDidLoad];
	self.title = @"First View";
}

- (IBAction)PressMe:(id)sender
{
	NSLog(@"aaaaaaaaaaaa");
	[[self navigationController] pushViewController:secondViewController animated:YES];
}


- (void)dealloc {
    [super dealloc];
}


@end
