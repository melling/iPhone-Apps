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
	myTable = [[UITableView alloc] initWithFrame:[UIScreen  mainScreen].applicationFrame style:UITableViewStylePlain];
	
	democratic = [[NSArray arrayWithObjects:
                 @"Barack Obama", @"Joe Biden", @"Hillary Clinton",
                 @"Christopher Dodd", @"John Edwards", 
                 @"Maurice Robert \"Mike\" Gravel",
                 @"Dennis Kucinich",
                 nil] retain];	
	republican = [[NSArray arrayWithObjects:
                 @"Ron Paul", @"John McCain", @"Mike Huckabee", @"Mitt Romney",
                 nil] retain];	
	independent  = [[NSArray arrayWithObjects:
                   @"Ralph Nader",
                   nil] retain];
  libertarian   = [[NSArray arrayWithObjects:
                    @"Bob Barr",
                    nil] retain];
	socialist   = [[NSArray arrayWithObjects:
                  @"Brian Moore",
                  nil] retain];
	
	myTable.dataSource = self;
	[window addSubview:myTable];
	[window makeKeyAndVisible];
}

- (void)dealloc {	
	[window release];
	[myTable release];
	[democratic release];
	[republican release];
	[independent release];
	[libertarian release];
	[socialist release];
	[super dealloc];
}

// DataSource methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	return 5;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
	switch (section) {
		case 0:
			return [democratic count];
		case 1:
			return [independent count];
		case 2:
			return [libertarian count];
		case 3:
			return [republican count];
		case 4:
			return [socialist count];		
	} 
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"shows"];
	if (cell == nil) {
		cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                     reuseIdentifier:@"shows"] autorelease];
	}
	// Set up the cell
	switch (indexPath.section) {
		case 0:
			cell.textLabel.text = [democratic objectAtIndex:indexPath.row];
			break;
		case 1:
			cell.textLabel.text = [independent objectAtIndex:indexPath.row];
			break;
		case 2:
			cell.textLabel.text = [libertarian objectAtIndex:indexPath.row];
			break;
		case 3:
			cell.textLabel.text = [republican objectAtIndex:indexPath.row];
			break;		
		case 4:
			cell.textLabel.text = [socialist objectAtIndex:indexPath.row];
			break;			
	}
	return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
	
	NSString *title = nil;
	switch (section) {
		case 0:
			title = @"Democratic";
			break;
		case 1:
			title = @"Independent";
			break;
		case 2:
			title = @"Libertarian";
			break;
		case 3:
			title = @"Republican";
			break;
		case 4:
			title = @"Socialist Party USA";
			break;
	}
	return title;
}

- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView {
	return[NSArray arrayWithObjects:@"D", @"I", @"L", @"R", @"S", nil];
}


- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index {
	return index;
}


@end
