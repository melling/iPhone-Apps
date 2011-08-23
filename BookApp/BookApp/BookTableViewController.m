//
//  BookTableViewController.m
//  BookApp
//
//  Created by Michael Mellinger on 8/22/11.
//  Copyright 2011 h4labs. All rights reserved.
//

#import "BookTableViewController.h"
#import "Book.h"

@implementation BookTableViewController

@synthesize bookList = _bookList;

-(void)setBookList:(NSMutableArray *)aBookList
{
    NSLog(@"BookTableViewController has new Book list");
    [_bookList release];
    _bookList = [[NSMutableArray alloc] initWithArray:aBookList];
//    _bookList = aBookList;
    for (Book *b in _bookList) {
        NSLog(@"%@, %@, %d, %lf", b.title, b.author, b.year, [b.rating doubleValue]);
    }
    NSLog(@"tableView: %@", self.tableView);
    NSLog(@"\n =>Book List now has # rows = %d", [_bookList count]);
    [self.tableView reloadData];
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle


//-(void)loadView
//{
// 
//}

- (void)viewDidLoad
{
    NSLog(@"Table Controller: viewDidLoad");
    [super viewDidLoad];

    NSLog(@"\n========== TableView: loadView ========");
    _bookList = [[NSMutableArray alloc] init];
    Book *aBook1 = [[Book alloc] initWithTitle:@"[Click Load Button]" author:@"Ernest Hemmingway" year:1940 rating:[NSNumber numberWithFloat: 10.0]];
    [_bookList addObject:aBook1];
    [aBook1 release];
    /*
     Book *aBook2 = [[Book alloc] initWithTitle:@"Grapes of Wrath" author:@"John Steinbeck" year:1939 rating:[NSNumber numberWithFloat: 10.0]];
     [_bookList addObject:aBook2];
     [aBook2 release];
     */
       // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.bookList count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    NSLog(@"\n--------- Fetching row: %d ------------", indexPath.row);
    NSLog(@"Table row count: %d", [_bookList count]);
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
    // Configure the cell...
    Book *aBook = [_bookList objectAtIndex:indexPath.row];
    cell.textLabel.text = aBook.title;
                 
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     [detailViewController release];
     */
}

@end
