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
#import "TableView10AppDelegate.h"

@implementation TableView10AppDelegate


- (void)applicationDidFinishLaunching:(UIApplication *)application {    
  window = [[UIWindow alloc] initWithFrame:[[UIScreen  mainScreen] bounds]] ;
  myTable = [[UITableView alloc] initWithFrame:[UIScreen  mainScreen].applicationFrame style:UITableViewStylePlain];
  myTable.dataSource = self;
	[window addSubview:myTable];
	[window makeKeyAndVisible];
}  

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
  
  
  UITableViewCell *cell;
  switch (indexPath.row) {
    case 0:
      cell   = [[[UITableViewCell alloc] 
                  initWithStyle:UITableViewCellStyleDefault
                  reuseIdentifier:nil] autorelease];
      cell.textLabel.text = @"Main text goes here";
      cell.imageView.image = [UIImage imageNamed:@"4.png"];
      break;
    case 1:
      cell   = [[[UITableViewCell alloc] 
                 initWithStyle:UITableViewCellStyleSubtitle
                 reuseIdentifier:nil] autorelease];
      cell.textLabel.text = @"Main text goes here";
      cell.detailTextLabel.text = @"Detail text goes here";
      cell.imageView.image = [UIImage imageNamed:@"5.png"];
      break;
    case 2:
      cell   = [[[UITableViewCell alloc] 
                 initWithStyle:UITableViewCellStyleValue1
                 reuseIdentifier:nil] autorelease];
      cell.textLabel.text = @"Main text";
      cell.detailTextLabel.text = @"Detail text";
      cell.imageView.image = [UIImage imageNamed:@"7.png"];      
      break;
    case 3:
      cell   = [[[UITableViewCell alloc] 
                 initWithStyle:UITableViewCellStyleValue2
                 reuseIdentifier:nil] autorelease];
      cell.textLabel.text = @"Main text";
      cell.detailTextLabel.text = @"Detail text";
      cell.imageView.image = [UIImage imageNamed:@"10.png"];
      break;
  }
  return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
  return 4;
}

- (void)dealloc {
  [myTable release];
  [window release];
  [super dealloc];
}


@end
