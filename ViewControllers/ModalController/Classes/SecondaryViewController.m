/******************************************************************************
 * Copyright (c) 2009, Maher Ali <maher.ali@gmail.com>
 * iPhone SDK 3 Programming - Advanced Mobile Development for Apple iPhone and iPod touch
 *
 * Permission is hereby granted, free of charge, to any person obtaining a
 * copy of this software and associated documentation files (the "Software"),
 * to deal in the Software without restriction, including without limitation
 * the rights to use, copy, modify, merge, publish, distribute, sublicense,
 * and/or sell copies of the Software, and to permit persons to whom the
 * Software is furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included
 * in all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
 * OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
 * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
 * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
 * DEALINGS IN THE SOFTWARE.
 ******************************************************************************/


#import "SecondaryViewController.h"
#import "SecondaryView.h"
#import "MainViewController.h"


@implementation SecondaryViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil 
				parent:(MainViewController*) myParent{
	if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
		UIBarButtonItem *rightButton = 
		[[UIBarButtonItem alloc] initWithTitle:@"Dismiss" 
										 style:UIBarButtonItemStyleDone
										target:myParent 
										action:@selector(dismissModelController)
		 ];
		self.navigationItem.rightBarButtonItem=rightButton; 
		[rightButton release];
		
	}
	return self;
}


- (void)loadView {
	CGRect	rectFrame = [UIScreen mainScreen].applicationFrame;
	SecondaryView *theView   = [[SecondaryView alloc] initWithFrame:rectFrame];
	theView.backgroundColor = [UIColor yellowColor];
	theView.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
	self.view = theView;
	[theView release];
	
}
@end
