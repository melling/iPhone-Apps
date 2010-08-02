//
//  ThirdViewController.m
//  NavigationController
//
//  Created by Chakra on 31/03/10.
//  Copyright 2010 Chakra Interactive Pvt Ltd. All rights reserved.
//

#import "ThirdViewController.h"
#import "ForthViewController.h"

@implementation ThirdViewController

@synthesize forthViewController;

- (void)viewDidLoad {
	[super viewDidLoad];
	self.title = @"Third View";
}


- (IBAction)PressMe:(id)sender
{
	[[self navigationController] pushViewController:forthViewController animated:YES];
}


- (void)dealloc {
    [super dealloc];
}


@end
