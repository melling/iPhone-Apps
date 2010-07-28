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

#import "CharacterViewController.h"
#import "TVAppDelegate.h"

@implementation CharacterViewController


- (id)init
{
	if (self = [super init]) {
		TVAppDelegate *delegate = [[UIApplication sharedApplication] delegate];
		self.title =  [delegate characterNameForShowIndex:delegate.selectedShow.row atIndex:delegate.selectedCharacter.row];
	}
	return self;
}



- (void)loadView {
	TVAppDelegate *delegate = [[UIApplication sharedApplication] delegate];
	theView   = [[UIView alloc] initWithFrame:[UIScreen mainScreen].applicationFrame];
	theView.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
	theView.backgroundColor = [UIColor  whiteColor];
	
	CGRect labelFrame =  CGRectMake(80, 10, 190, 50);
	nameLabel = [[UILabel alloc] initWithFrame:labelFrame];
    nameLabel.font = [UIFont systemFontOfSize:25.0];
	nameLabel.textColor = [UIColor  blackColor];
	nameLabel.backgroundColor = [UIColor clearColor];
	nameLabel.textAlignment = UITextAlignmentLeft;   
	nameLabel.lineBreakMode = UILineBreakModeWordWrap;
	NSString  *theName = [delegate characterNameForShowIndex:delegate.selectedShow.row atIndex:delegate.selectedCharacter.row];
	nameLabel.text = [NSString stringWithFormat:@"%@:  %@", @"Name", theName];
    [theView addSubview: nameLabel];
	UIImageView   *imgView = [[UIImageView alloc] 
								initWithImage:[UIImage
												imageNamed:[NSString stringWithFormat:@"%@.jpg",  theName]]];
	imgView.frame = CGRectMake(30, 70, 250, 300);
	[theView addSubview:imgView];
	[imgView release];
	
	self.view = theView;
}
 

- (void)dealloc {
	[nameLabel release];
	[theView release];
	[super dealloc];
}


@end
