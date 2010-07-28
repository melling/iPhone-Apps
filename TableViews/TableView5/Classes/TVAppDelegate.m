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
	window = [[UIWindow alloc] initWithFrame:[[UIScreen  mainScreen] bounds]];
	
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
	myTable.delegate = self;
	myTable.dataSource = self;
	[window addSubview:myTable];
	inputACharacterView  = nil;
	[window makeKeyAndVisible];
}

-(void)editAction:(id)sender{
  
	if(sender == editButton){
		if([editButton.currentTitle isEqual:@"Edit"] == YES){
			[editButton setTitle:@"Done" forState:UIControlStateNormal];
			[myTable setEditing:YES animated:YES];
		}
		else {
			[editButton setTitle:@"Edit" forState:UIControlStateNormal];
			[myTable setEditing:NO animated:YES];
		}
    
	}
  
}

-(void)cancelAction:(id)sender{
	[inputACharacterView removeFromSuperview];
	inputACharacterView = nil;
}


-(void)insertCharacter{
  
	inputACharacterView = [[[UIView alloc] initWithFrame:[UIScreen  mainScreen].applicationFrame] autorelease];
	inputACharacterView.backgroundColor = [UIColor lightGrayColor];
	
	UIButton *cancelButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
	cancelButton.frame = CGRectMake(105.0, 25.0, 100, 40);
	[cancelButton setTitle:@"Cancel" forState:UIControlStateNormal];
	[cancelButton addTarget:self action:@selector(cancelAction:) forControlEvents:UIControlEventTouchUpInside];
	[inputACharacterView addSubview: cancelButton];
	
  
	UILabel *label = [[[UILabel alloc] initWithFrame:CGRectMake(10,100, 70, 30)] autorelease];
  label.backgroundColor = [UIColor clearColor];
	label.text = @"Name:";
	[inputACharacterView addSubview: label];
	
	characterTextField = [[UITextField alloc] initWithFrame:CGRectMake(80,100, 220, 30)];	
	characterTextField.textColor = [UIColor blackColor];
	characterTextField.font  = [UIFont systemFontOfSize:17.0];
	characterTextField.placeholder = @"<enter a new character>";
	characterTextField.backgroundColor = [UIColor clearColor];
	characterTextField.borderStyle = UITextBorderStyleRoundedRect;
	characterTextField.keyboardType = UIKeyboardTypeDefault;
	characterTextField.returnKeyType = UIReturnKeyDone;
	characterTextField.clearButtonMode = UITextFieldViewModeAlways;
	characterTextField.enablesReturnKeyAutomatically = YES;
	characterTextField.delegate = self;
	[inputACharacterView addSubview: characterTextField];
	[window addSubview:inputACharacterView];	
}

// UITextFieldDelegate methods
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
	[theSimpsons addObject:textField.text];
	[myTable reloadData];
	[inputACharacterView removeFromSuperview];
	inputACharacterView = nil;
	return YES;
}


// DataSource methods
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
	return [theSimpsons count];
}

- (void)tableView:(UITableView *)tableView 
commitEditingStyle:(UITableViewCellEditingStyle)editingStyle
forRowAtIndexPath:(NSIndexPath *)indexPath{
	
	if(editingStyle == UITableViewCellEditingStyleInsert){
		[self insertCharacter];
	}
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"simpsons"];
	if (cell == nil) {
		cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                     reuseIdentifier:@"simpsons"] autorelease];
	}
	// Set up the cell
	cell.textLabel.text  = [theSimpsons objectAtIndex:indexPath.row];
	NSString *imageName = [NSString stringWithFormat:@"%d.png", indexPath.row];
	cell.imageView.image = [UIImage imageNamed:imageName];	
	if(cell.imageView.image == nil){
		cell.imageView.image  = [UIImage imageNamed:@"unknown-person.gif"];
  }
	return cell;
}

// table view delegate 
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath{
	return UITableViewCellEditingStyleInsert;
}

- (void)dealloc {	
	[window release];
	[myTable release];
	[theSimpsons release];
	[editButton release];
	[characterTextField release];
	[super dealloc];
}

@end
