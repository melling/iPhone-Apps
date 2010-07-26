//
//  SecondView.m
//
//  Created by Michael Mellinger on 7/26/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "SecondView.h"

@implementation SecondView

-(IBAction)back {

	[self.parentViewController dismissModalViewControllerAnimated:YES];
	
}


@end
