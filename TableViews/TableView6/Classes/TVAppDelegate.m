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
	
	editButton = [[UIButton buttonWithType:UIButtonTypeRoundedRect] retain];
	editButton.frame = CGRectMake(105.0, 25.0, 100, 40);
	[editButton setTitle:@"Edit" forState:UIControlStateNormal];
	[editButton addTarget:self action:@selector(editAction:) forControlEvents:UIControlEventTouchUpInside];
	[window addSubview: editButton];
	
	
	CGRect frame = CGRectMake(0, 70, 320, 420);
	myTable = [[UITableView alloc] initWithFrame:frame style:UITableViewStylePlain];
	
	theSimpsons = [[NSMutableArray arrayWithObjects:@"Homer Jay Simpson", @"Marjorie \"Marge\" Simpson",
                  @"Bartholomew \"Bart\" J. Simpson", @"Lisa Marie Simpson",
                  @"Margaret \"Maggie\" Simpson", 
                  @"Abraham J. Simpson",
                  @"Santa's Little Helper", 
                  @"Ned Flanders", @"Apu Nahasapeemapetilon", 
                  @"Clancy Wiggum", @"Charles Montgomery Burns",					
                  nil] retain];	
	myTable.dataSource = self;
	[window addSubview:myTable];
	[window makeKeyAndVisible];
}

-(void)editAction:(id)sender{
	
	if(sender == editButton){
		if([editButton.currentTitle isEqualToString:@"Edit"] == YES){
			[editButton setTitle:@"Done" forState:UIControlStateNormal];
			[myTable setEditing:YES animated:YES];
		}
		else {
			[editButton setTitle:@"Edit" forState:UIControlStateNormal];
			[myTable setEditing:NO animated:YES];
		}
		
	}
	
}


// DataSource methods
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
	return [theSimpsons count];
}

- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath{
	
	NSString  *string = [theSimpsons objectAtIndex:indexPath.row];
	if( [string  isEqualToString:@"Bartholomew \"Bart\" J. Simpson"] == YES )
		return NO;
	if( [string  isEqualToString:@"Santa's Little Helper"] == YES )
		return NO;
	return YES;
}

- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath
			toIndexPath:(NSIndexPath *)toIndexPath{
	NSString *str = [[theSimpsons objectAtIndex:fromIndexPath.row] retain];
	[theSimpsons removeObjectAtIndex:fromIndexPath.row];
	[theSimpsons insertObject:str atIndex:toIndexPath.row];
	[str release];
	
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"simpsons"];
	if (cell == nil) {
		cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                   reuseIdentifier:@"simpsons"] autorelease];
	}
	cell.textLabel.text = [theSimpsons objectAtIndex:indexPath.row];
	return cell;
}

- (void)dealloc {	
	[window release];
	[myTable release];
	[theSimpsons release];
	[editButton release];
	[super dealloc];
}

@end
