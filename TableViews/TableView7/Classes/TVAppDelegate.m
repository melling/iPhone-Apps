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

#import "TVAppDelegate.h"
#import "ShowTableViewController.h"

@implementation TVAppDelegate
@synthesize selectedShow;
@synthesize selectedCharacter;
@synthesize navigationController;


- (void)applicationDidFinishLaunching:(UIApplication *)application {	
	[self prepareDataModel];
	window = [[UIWindow alloc] initWithFrame:[[UIScreen  mainScreen] bounds]] ;
	ShowTableViewController *showViewController = [[[ShowTableViewController alloc] initWithStyle:UITableViewStylePlain] autorelease];
  navigationController = [[UINavigationController alloc] initWithRootViewController:showViewController];
  [window addSubview:[navigationController view]];	
	[window makeKeyAndVisible];
}

-(void)prepareDataModel{
	NSDictionary    *dic1 = [NSDictionary dictionaryWithObjectsAndKeys:
                           @"Seinfeld", 
                           @"Name", 
                           [NSArray arrayWithObjects:
                            @"Jerry", @"George", @"Elaine", @"Kramer",  
                            @"Newman", @"Frank",  @"Susan",  @"Peterman",  @"Bania", nil],
                           @"Characters", 
                           nil
                           ];
	NSDictionary    *dic2 = [NSDictionary dictionaryWithObjectsAndKeys:
                           @"Lost", 
                           @"Name", 
                           [NSArray arrayWithObjects:
                            @"Kate", @"Sayid", @"Sun", @"Hurley",  
                            @"Boone", @"Claire",  @"Jin",  @"Locke",  @"Charlie", @"Eko", @"Ben", nil],
                           @"Characters", 
                           nil
                           ];
	theShows = [[NSArray arrayWithObjects:dic1, dic2, nil] retain];
  
}               

-(NSInteger)numberOfShows{
	return [theShows count];
}

-(NSString*)showNameAtIndex:(NSInteger) index{
	return [[theShows objectAtIndex:index] valueForKey:@"Name"] ;
}

-(NSInteger)numberOfCharactersForShowAtIndex:(NSInteger) index{
  return [[[theShows objectAtIndex:index] valueForKey:@"Characters"] count];
}


-(NSString*)characterNameForShowIndex:(NSInteger) showIndex atIndex:(NSInteger) index{
	return [[[theShows objectAtIndex:showIndex] valueForKey:@"Characters"] objectAtIndex:index];
}

- (void)dealloc {	
	[window release];
	[navigationController release];
	[theShows release];
	[super dealloc];
}


@end
