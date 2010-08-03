//
//  SnowFallAppDelegate.m
//  SnowFall
//
//  Created by apple on 10/9/08.
//  Copyright Amuck LLC 2008. All rights reserved.
//

#import "SnowFallViewController.h"

@implementation SnowFallViewController

@synthesize flakeImage;

- (void)viewDidLoad {
	[super viewDidLoad];
	
	// set the background color to something COLD
	self.view.backgroundColor = [UIColor colorWithRed:0.5 green:0.5 blue:1.0 alpha:1.0];
	
	// load our flake image we will use the same image over and over
	flakeImage = [UIImage imageNamed:@"flake.png"];
	
	// start a timet that will fire 20 times per second
	[NSTimer scheduledTimerWithTimeInterval:(0.05) target:self selector:@selector(onTimer) userInfo:nil repeats:YES];
}
 
// Timer event is called whenever the timer fires
- (void)onTimer
{
	// build a view from our flake image
	UIImageView* flakeView = [[UIImageView alloc] initWithImage:flakeImage];
	
	// use the random() function to randomize up our flake attributes
	int startX = round(random() % 320);
	int endX = round(random() % 320);
	double scale = 1 / round(random() % 100) + 1.0;
	double speed = 1 / round(random() % 100) + 1.0;
	
	// set the flake start position
	flakeView.frame = CGRectMake(startX, -100.0, 25.0 * scale, 25.0 * scale);
	flakeView.alpha = 0.25;
	
	// put the flake in our main view
	[self.view addSubview:flakeView];
	
	[UIView beginAnimations:nil context:flakeView];
	// set up how fast the flake will fall
	[UIView setAnimationDuration:5 * speed];
	
	// set the postion where flake will move to
	flakeView.frame = CGRectMake(endX, 500.0, 25.0 * scale, 25.0 * scale);
	
	// set a stop callback so we can cleanup the flake when it reaches the
	// end of its animation
	[UIView setAnimationDidStopSelector:@selector(onAnimationComplete:finished:context:)];
	[UIView setAnimationDelegate:self];
	[UIView commitAnimations];
	
}
- (void)onAnimationComplete:(NSString *)animationID finished:(NSNumber *)finished context:(void *)context {
	
	UIImageView *flakeView = context;
	[flakeView removeFromSuperview];
	// open the debug log and you will see that all flakes have a retain count 
	// of 1 at this point so we know the release below will keep our memory 
	// usage in check
	NSLog([NSString stringWithFormat:@"[flakeView retainCount] = %d", [flakeView retainCount]]);
	[flakeView release];
	
	
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	// Return YES for supported orientations
	return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning]; // Releases the view if it doesn't have a superview
	// Release anything that's not essential, such as cached data
}


- (void)dealloc {
	[flakeImage release];
	[super dealloc];
}

@end
