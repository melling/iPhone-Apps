//
//  RootViewController.m
//  PredicateFilter
//
//  Created by Michael Mellinger on 7/27/11.
//  Copyright 2011 h4labs. All rights reserved.
//

#import "RootViewController.h"
#import "Person.h"

@implementation RootViewController


@synthesize people, filteredPeople;
@synthesize searchDisplayController;

- (void)dealloc
{
	[searchDisplayController release];
	[people release];
	[filteredPeople release];
    [super dealloc];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
	self.title = @"Search People";
    
	Person *person1 = [Person personWithFirstName:@"Oliver" lastName:@"Drobnik"];
	Person *person2 = [Person personWithFirstName:@"Steve" lastName:@"Jobs"];
	Person *person3 = [Person personWithFirstName:@"Bill" lastName:@"Gates"];
	Person *person4 = [Person personWithFirstName:@"Obiwan" lastName:@"Kenobi"];
    
	people = [[NSArray alloc] initWithObjects:person1, person2, person3, person4, nil];
    
	// programmatically set up search bar
	UISearchBar *mySearchBar = [[UISearchBar alloc] init];
	[mySearchBar setScopeButtonTitles:[NSArray arrayWithObjects:@"First",@"Last",nil]];
	mySearchBar.delegate = self;
	[mySearchBar setAutocapitalizationType:UITextAutocapitalizationTypeNone];
	[mySearchBar sizeToFit];
	self.tableView.tableHeaderView = mySearchBar;
    
	// programmatically set up search display controller
	searchDisplayController = [[UISearchDisplayController alloc] initWithSearchBar:mySearchBar contentsController:self];
	[self setSearchDisplayController:searchDisplayController];
	[searchDisplayController setDelegate:self];
	[searchDisplayController setSearchResultsDataSource:self];
    
	[mySearchBar release];
}

#pragma mark Table view methods
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	if (tableView == self.searchDisplayController.searchResultsTableView)
	{
        return [self.filteredPeople count];
    }
	else
	{
        return [self.people count];
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
	Person *person;
    
	if (tableView == self.searchDisplayController.searchResultsTableView)
	{
        person = [self.filteredPeople objectAtIndex:indexPath.row];
    }
	else
	{
        person = [self.people objectAtIndex:indexPath.row];
    }
    
	cell.textLabel.text = [NSString stringWithFormat:@"%@ %@",
						   person.firstName, person.lastName];
    return cell;
}

#pragma mark Content Filtering

- (void)filterContentForSearchText:(NSString *)searchText scope:(NSString *)scope
{
	NSPredicate *predicate;
    
	if ([scope isEqualToString:@"First"])
	{
		predicate = [NSPredicate predicateWithFormat:
					 @"firstName CONTAINS[cd] %@", searchText];
	}
	else
	{
		predicate = [NSPredicate predicateWithFormat:
					 @"lastName CONTAINS[cd] %@", searchText];
	}
    
	self.filteredPeople = [people filteredArrayUsingPredicate:predicate];
}

#pragma mark UISearchDisplayController Delegate Methods

- (BOOL)searchDisplayController:(UISearchDisplayController *)controller
shouldReloadTableForSearchString:(NSString *)searchString
{
    [self filterContentForSearchText:searchString scope:
	 [[self.searchDisplayController.searchBar scopeButtonTitles]
	  objectAtIndex:[self.searchDisplayController.searchBar selectedScopeButtonIndex]]];
    
    // Return YES to cause the search result table view to be reloaded.
    return YES;
}

- (BOOL)searchDisplayController:(UISearchDisplayController *)controller
shouldReloadTableForSearchScope:(NSInteger)searchOption
{
    [self filterContentForSearchText:[self.searchDisplayController.searchBar text] scope:
	 [[self.searchDisplayController.searchBar scopeButtonTitles]
	  objectAtIndex:searchOption]];
    
    // Return YES to cause the search result table view to be reloaded.
    return YES;
}

@end
