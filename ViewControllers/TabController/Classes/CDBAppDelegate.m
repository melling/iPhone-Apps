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

#import "CDBAppDelegate.h"
#import "CDBViewController.h"

@implementation CDBAppDelegate

- (void)applicationDidFinishLaunching:(UIApplication *)application {	
  
	window = [[UIWindow alloc] initWithFrame:[[UIScreen  mainScreen] bounds]] ;
	
	viewController1 = [[CDBViewController alloc] 
                     initWithMessage:@"Triangle"
                     andImage:[UIImage imageNamed:@"tri.png"]];
	viewController1.title =  @"Tri";
	viewController2 = [[CDBViewController alloc] 
                     initWithMessage:@"Rectangle"
                     andImage:[UIImage imageNamed:@"rect.png"]];
	viewController2.title =  @"Rect";
	viewController3 = [[CDBViewController alloc] 
                     initWithMessage:@"Ellipse"
                     andImage:[UIImage imageNamed:@"ellipse.png"]];
	viewController3.title =  @"Elli";
	viewController3.tabBarItem.badgeValue = @"3";
	
	viewController4 = [[CDBViewController alloc] 
                     initWithMessage:@"Rectangle+Ellipse"
                     andImage:[UIImage imageNamed:@"rect-elli.png"]];
	viewController4.title =  @"R&E";
	viewController5 = [[CDBViewController alloc] 
                     initWithMessage:@"Rectangle+Triangle"
                     andImage:[UIImage imageNamed:@"rect-tri.png"]];
	viewController5.title =  @"R&T";
	viewController6 = [[CDBViewController alloc] 
                     initWithMessage:@"Rectangle+Rectangle"
                     andImage:[UIImage imageNamed:@"two-tri.png"]];
	viewController6.title =  @"R&R";
	tabBarController = [[UITabBarController alloc] init];
	tabBarController.viewControllers = [NSArray arrayWithObjects:
                                      viewController1,
                                      viewController2, 
                                      viewController3,
                                      viewController4,
                                      viewController5,
                                      viewController6,
                                      nil];
	[window addSubview:tabBarController.view];	
	tabBarController.selectedViewController = viewController6;
	[window makeKeyAndVisible];
}

- (void)dealloc {	
	[window release];
	[viewController1 release];
	[viewController2 release];
	[viewController3 release];
	[viewController4 release];
	[viewController5 release];
	[viewController6 release];
	[tabBarController release];
	[super dealloc];
}
@end
