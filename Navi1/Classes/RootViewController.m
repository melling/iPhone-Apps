    //
//  RootViewController.m
//  Navi1
//
//  Created by Michael Mellinger on 8/2/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "RootViewController.h"
#import "FirstViewController.h"

@implementation RootViewController

@synthesize pressMe;

-(IBAction)pressMe:(id)sender {
	FirstViewController *firstView = [[FirstViewController alloc] initWithNibName:@"FirstViewController"
																		   bundle:nil];

	[self.navigationController pushViewController:firstView animated:YES];
	[firstView release];
}

/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
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


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	self.title = @"Root Level";
	UIImage *buttonImageNormal = [UIImage imageNamed:@"whiteButton.png"];
	UIImage *stretchableButtonImageNormal = [buttonImageNormal stretchableImageWithLeftCapWidth:12
																				   topCapHeight:0];
	[pressMe setBackgroundImage:stretchableButtonImageNormal forState:UIControlStateNormal];

	UIImage *buttonImagePressed = [UIImage imageNamed:@"blueButton.png"];

	UIImage *stretchableButtonImagePressed = [buttonImagePressed stretchableImageWithLeftCapWidth:12
																				   topCapHeight:0];

	[pressMe setBackgroundImage:stretchableButtonImagePressed forState:UIControlStateHighlighted];
	UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Root View"
																   style:UIBarButtonItemStyleBordered
																  target:nil action:nil];
	self.navigationItem.backBarButtonItem = backButton;
	[backButton release];
	
	[super viewDidLoad];
}


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
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}


@end
