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

#import "MainViewController.h"
#import "SecondaryViewController.h"
#import "MainView.h"

@implementation MainViewController

- (void)loadView {
	CGRect	rectFrame = [UIScreen mainScreen].applicationFrame;
	MainView *theView   = [[MainView alloc] initWithFrame:rectFrame];
	theView.myController = self;
	theView.backgroundColor = [UIColor grayColor];
	theView.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
	self.view = theView;
	[theView release];
}

-(void) showModalController{
	secondaryCtrl1 = 
	[[SecondaryViewController alloc] initWithNibName:nil bundle:nil parent:self];
	secondaryNavigationCtrl =
	[[UINavigationController alloc] initWithRootViewController:secondaryCtrl1]; 
  secondaryCtrl1.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;// UIModalTransitionStyleCrossDissolve UIModalTransitionStyleCoverVertical UIModalTransitionStyleFlipHorizontal
	[self presentModalViewController:secondaryNavigationCtrl animated:YES];
}

-(void) dismissModelController {
	[secondaryCtrl1 release];
	[secondaryNavigationCtrl release];
	[self dismissModalViewControllerAnimated:YES];
}
@end
