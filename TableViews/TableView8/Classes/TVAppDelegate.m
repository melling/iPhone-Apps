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

@implementation TVAppDelegate

- (void)applicationDidFinishLaunching:(UIApplication *)application {	
	window = [[UIWindow alloc] initWithFrame:[[UIScreen  mainScreen] bounds]] ;
  
	
	myTable = [[UITableView alloc] initWithFrame:[UIScreen  mainScreen].applicationFrame style:UITableViewStyleGrouped];
	
	comedyShows = [[NSArray arrayWithObjects:
                  @"Seinfeld", @"Everybody Loves Raymond",
                  nil] retain];	
	politicalShows = [[NSArray arrayWithObjects:
                     @"60 Minutes", @"Meet The Press",
                     nil] retain];	
	dramaShows  = [[NSArray arrayWithObjects:
                  @"Lost",
                  nil] retain];
	
	myTable.dataSource = self;
	[window addSubview:myTable];
	[window makeKeyAndVisible];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
	switch (section) {
		case 0:
			return [comedyShows count];
			break;
		case 1:
			return [politicalShows count];
			break;
		case 2:
			return [dramaShows count];
			break;
	} 
  return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"shows"];
	if (cell == nil) {
		cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                    reuseIdentifier:@"shows"] autorelease];
	}
	switch (indexPath.section) {
		case 0:
			cell.textLabel.text = [comedyShows objectAtIndex:indexPath.row];
			break;
		case 1:
			cell.textLabel.text = [politicalShows objectAtIndex:indexPath.row];
			break;
		case 2:
			cell.textLabel.text = [dramaShows objectAtIndex:indexPath.row];
			break;
	}
	return cell;
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
	
	NSString *title = nil;
	switch (section) {
		case 0:
			title = @"Comedy Shows";
			break;
		case 1:
			title = @"Political Shows";
			break;
		case 2:
			title = @"Drama Shows";
			break;
		default:
			break;
	}
	return title;
}

- (void)dealloc {	
	[window release];
	[myTable release];
	[comedyShows release];
	[politicalShows release];
	[dramaShows release];
	[super dealloc];
}

@end
