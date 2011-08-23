//
//  BookAppViewController.m
//  BookApp
//
//  Created by Michael Mellinger on 8/22/11.
//  Copyright 2011 h4labs. All rights reserved.
//

#import "BookAppViewController.h"
#import "Book.h"
#import "BookAppAppDelegate.h"

@implementation BookAppViewController

@synthesize books = _books;
@synthesize bookTableViewController = _bookTableViewController;
@synthesize bookTable = _bookTable;

static int counter=0;

- (IBAction)populateBookData:(id)sender
{
    NSLog(@"Filling in the data");
    if (_books != nil) {
        [_books release];
    }
    _books = [[NSMutableArray alloc] init];
    
    if (counter % 2 == 0) {
        Book *aBook1 = [[Book alloc] initWithTitle:@"For Whom the Bell Tolls" author:@"Ernest Hemmingway" year:1940 rating:[NSNumber numberWithFloat: 10.0]];
        [_books addObject:aBook1];
        [aBook1 release];
        
        Book *aBook2 = [[Book alloc] initWithTitle:@"Grapes of Wrath" author:@"John Steinbeck" year:1939 rating:[NSNumber numberWithFloat: 10.0]];
        [_books addObject:aBook2];
        [aBook2 release];
    } else {
        Book *aBook1 = [[Book alloc] initWithTitle:@"Great Gasby" author:@"F. Scott Fitzgerald" year:1925 rating:[NSNumber numberWithFloat: 10.0]];
        [_books addObject:aBook1];
        [aBook1 release];
        
        Book *aBook2 = [[Book alloc] initWithTitle:@"Sound and the Fury" author:@"William Faulkner" year:1929 rating:[NSNumber numberWithFloat: 10.0]];
        [_books addObject:aBook2];
        [aBook2 release];        
        
        
        Book *aBook3 = [[Book alloc] initWithTitle:@"Harry Potter" author:@"J.K. Rowling" year:1929 rating:[NSNumber numberWithFloat: 10.0]];
        [_books addObject:aBook3];
        [aBook3 release];        
    }
    counter++;
    id appDelegate = [[UIApplication sharedApplication] delegate];
    
    // Give everyone the new list
    NSLog(@"We've got new books: n=%d\n\n", [_books count]);
//    [appDelegate setBookList: _books];
    [_bookTableViewController setBookList: _books];
    NSLog(@"From Controller: %@", _bookTableViewController.tableView);
    NSLog(@"BookTable: From Controller: %@", self.bookTable);
    
//    [_bookTableViewController.tableView reloadData];
    [self.bookTable reloadData];
}


- (IBAction)dumpBookData:(id)sender
{
    id appDelegate = [[UIApplication sharedApplication] delegate];
    NSMutableArray *aBookArray = [appDelegate getBookList];
    for (Book *b in aBookArray) {
        NSLog(@"%@, %@, %d, %lf", b.title, b.author, b.year, [b.rating doubleValue]);
    }
    
}


- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"\nBookTable: %@", self.bookTable);
    
    if (_bookTableViewController == nil) {
        NSLog(@"== Initing table ==");
        _bookTableViewController = [[BookTableViewController alloc] init];
        NSLog(@"_bookTable: %@", _bookTable);
        [_bookTable setDelegate: _bookTableViewController];
        [_bookTable setDataSource: _bookTableViewController];
        
        _bookTableViewController.view = _bookTableViewController.tableView;
    }else{
        NSLog(@"Table already setup");
        
    }
    
}


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)dealloc {
    [_bookTableViewController release];
    [_books release];
    
    [super dealloc];
}

@end
