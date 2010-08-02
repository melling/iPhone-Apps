//
//  SecondViewController.m
//  NavigationController
//
//  Created by Chakra on 31/03/10.
//  Copyright 2010 Chakra Interactive Pvt Ltd. All rights reserved.
//

#import "SecondViewController.h"
#import "ThirdViewController.h"


@implementation SecondViewController

@synthesize thirdViewController;

- (void)viewDidLoad {
	[super viewDidLoad];
	self.title = @"Second View";
}


- (IBAction)PressMe:(id)sender
{
	[[self navigationController] pushViewController:thirdViewController animated:YES];
}



- (void)dealloc {
    [super dealloc];
}


@end
