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

#import "ShowCharactersTableViewController.h"
#import "TVAppDelegate.h"
#import "CharacterViewController.h"

@implementation ShowCharactersTableViewController


- (id)initWithStyle:(UITableViewStyle)style {
	if (self = [super initWithStyle:style]) {
		TVAppDelegate *delegate = [[UIApplication sharedApplication] delegate];
		self.title = [delegate showNameAtIndex:delegate.selectedShow.row];
    self.navigationItem.backBarButtonItem.title = [delegate showNameAtIndex:delegate.selectedShow.row];
    
	}
	return self;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
	TVAppDelegate *delegate = [[UIApplication sharedApplication] delegate];
	return [delegate numberOfCharactersForShowAtIndex:delegate.selectedShow.row];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
	TVAppDelegate *delegate = [[UIApplication sharedApplication] delegate];
	delegate.selectedCharacter = indexPath;
	CharacterViewController *characterController = [[CharacterViewController alloc] init];
	[[delegate navigationController] pushViewController:characterController animated:YES];
	[characterController release];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	static NSString *MyIdentifier = @"Character";
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
	if (cell == nil) {
		cell = [[[UITableViewCell alloc] 
             initWithStyle:UITableViewCellStyleDefault
             reuseIdentifier:MyIdentifier] autorelease];
	}
	TVAppDelegate *delegate = [[UIApplication sharedApplication] delegate];
	cell.textLabel.text =  [delegate characterNameForShowIndex:delegate.selectedShow.row atIndex:indexPath.row];
	cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
	return cell;
}
@end

