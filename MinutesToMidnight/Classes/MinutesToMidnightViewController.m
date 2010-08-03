//
//  MinutesToMidnightViewController.m
//  MinutesToMidnight
//
//  Created by Michael Mellinger on 6/14/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import "MinutesToMidnightViewController.h"

@implementation MinutesToMidnightViewController



/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
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
	[countdownLabel setFont:[UIFont fontWithName:@"DBLCDTempBlack" size:128.0]];
	countdownLabel.text = @"I0A0IN6";

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

-(void)updateLabel {
	/*
	NSDate* now = [NSDate date];
	 int hour =  [[now dateWithCalendarFormat:nil timeZone:nil] hourOfDay];
	
	 
	 int min = 59 - [[now dateWithCalendarFormat:nil timeZone:nil] minuteOfHour];
	 int sec = 59 - [[now dateWithCalendarFormat:nil timeZone:nil] secondOfMinute];
	 */
	/*
//	int hour = 23;
	int min = 59;
	int sec = 59;
	countdownLabel.text = [NSString stringWithFormat:@"%02d:%02d:%02d", hour, min,sec];
	*/
	NSDate* now = [NSDate date];
	NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
	NSDateComponents *dateComponents = [gregorian components:(NSHourCalendarUnit  | NSMinuteCalendarUnit | NSSecondCalendarUnit) fromDate:now];
	NSInteger hour = [dateComponents hour];
	NSInteger minute = [dateComponents minute];
	NSInteger second = [dateComponents second];
	[gregorian release];
	countdownLabel.text = [NSString stringWithFormat:@"%02d:%02d:%02d", hour, minute, second];
}  

@end
