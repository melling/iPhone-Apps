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
	myTable = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].applicationFrame style:UITableViewStylePlain];
	theSimpsons = [[NSArray arrayWithObjects:@"Homer Jay Simpson", @"Marjorie \"Marge\" Simpson",
                  @"Bartholomew \"Bart\" J. Simpson", @"Lisa Marie Simpson",
                  @"Margaret \"Maggie\" Simpson", 
                  @"Abraham J. Simpson",
                  @"Santa's Little Helper", 
                  @"Ned Flanders", @"Apu Nahasapeemapetilon", 
                  @"Clancy Wiggum", @"Charles Montgomery Burns",					
                  nil] retain];
	myTable.delegate = self;
	myTable.dataSource = self;
	[window addSubview:myTable];
	[window makeKeyAndVisible];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
	return [theSimpsons count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"simpsons"];
	if (cell == nil) {
		cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"simpsons"] autorelease];
	}
	cell.textLabel.text  = [theSimpsons objectAtIndex:indexPath.row];
	NSString *imageName = [NSString stringWithFormat:@"%d.png", indexPath.row];
	cell.imageView.image = [UIImage imageNamed:imageName];	
	return cell;
}

- (void)dealloc {	
	[window release];
	[myTable release];
	[theSimpsons release];
	[super dealloc];
}
@end
