//
//  RootViewController.m
//  Fruit
//
//  Created by Michael Mellinger on 6/14/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import "WatchlistViewController.h"
#import "Company.h"
#import "/usr/include/sqlite3.h"

#import "MyTableCell.h"


@implementation WatchlistViewController
@synthesize companyView;
@synthesize companies;

#define LABEL_TAG 1 
#define VALUE_TAG 2 
#define FIRST_CELL_IDENTIFIER @"TrailItemCell" 
#define SECOND_CELL_IDENTIFIER @"RegularCell" 

void insertStockPurchase(sqlite3 *pDb, const char*symbol, float price, int units, const char* date, float lastPrice){
	char		*errorMsg; 
	int			returnCode; 
	char		*st;
	st	= sqlite3_mprintf("INSERT INTO stocks VALUES ('%q', %f, %d, '%q', %f)", 	
						  symbol, price, units, date, lastPrice);
	returnCode = sqlite3_exec(pDb, st, NULL, NULL, &errorMsg);
	if(returnCode!=SQLITE_OK) { 
		fprintf(stderr, "Error in inserting into the stocks table. Error: %s", errorMsg);
		sqlite3_free(errorMsg); 
	}
	sqlite3_free(st);
}


void addWatchlistTickers() {
	char		*sqlStatement;
	sqlite3		*pDb; 
	char		*errorMsg; 
	int			returnCode; 
	char		*databaseName;
	
	// to keep things simple, the DB file is located  at /
	// Consult Ch. 9 to find out how to locate files in your sandbox.
	databaseName = "/tmp/financial.db";
	returnCode = sqlite3_open(databaseName, &pDb); 
	if(returnCode!=SQLITE_OK) { 
		fprintf(stderr, "Error in opening the database. Error: %s", sqlite3_errmsg(pDb));
		sqlite3_close(pDb); 
		return;
	} 
	sqlStatement =  "DROP TABLE IF EXISTS stocks";
	returnCode = sqlite3_exec(pDb, sqlStatement, NULL, NULL, &errorMsg); 
	if(returnCode!=SQLITE_OK) { 
		fprintf(stderr, "Error in droping table stocks. Error: %s", errorMsg);
		sqlite3_free(errorMsg); 
	}else {
		fprintf(stderr, "Dropped table stocks.");
		
	}
	
	sqlStatement =  "CREATE TABLE stocks (symbol VARCHAR(5), "
	"purchasePrice FLOAT(10,4), unitsPurchased INTEGER, purchase_date VARCHAR(10),"
	"lastPrice FLOAT(10,4))";
	returnCode = sqlite3_exec(pDb, sqlStatement, NULL, NULL, &errorMsg); 
	if(returnCode!=SQLITE_OK) { 
		fprintf(stderr, "Error in creating the stocks table. Error: %s", errorMsg);
		sqlite3_free(errorMsg); 
	} 
	
	insertStockPurchase(pDb, "ALU",  14.23, 100, "03-17-2007", 14.00);
	insertStockPurchase(pDb, "GOOG",  600.77, 20, "01-09-2007", 300.43);
	insertStockPurchase(pDb, "NT",  20.23, 140, "02-05-2007", 18);
	insertStockPurchase(pDb, "MSFT",  30.23, 5, "01-03-2007", 25.25);
	sqlite3_close(pDb);
	NSLog(@"Populated table");
}

-(void)getWatchlistTickers {
	char		*sqlStatement;
	
	sqlite3		*database; 
	int			returnCode; 
	char		*databaseName;
	sqlite3_stmt *statement;
	// to keep things simple, the DB file is located  at /
	// Consult Ch. 9 to find out how to locate files in your sandbox.
	databaseName = "/tmp/financial.db";
	returnCode = sqlite3_open(databaseName, &database); 
	if(returnCode!=SQLITE_OK) { 
		fprintf(stderr, "Error in opening the database. Error: %s", sqlite3_errmsg(database));
		sqlite3_close(database); 
		return;
	} 
	
	sqlStatement = sqlite3_mprintf("SELECT S.symbol, S.unitsPurchased, S.purchasePrice, S.lastPrice FROM stocks AS S WHERE"
								   "  S.purchasePrice  >= %f", 1.0);
	
	returnCode = sqlite3_prepare_v2(database, sqlStatement, strlen(sqlStatement), &statement, NULL);
	if(returnCode!=SQLITE_OK) { 
		fprintf(stderr, "Error in preparation of query. Error: %s", sqlite3_errmsg(database));
		sqlite3_close(database); 
		return;
	} 
	returnCode = sqlite3_step(statement);
	while(returnCode == SQLITE_ROW){
		char *symbol;
		int  units;
		double price, lastPrice;
		
		symbol = (char *)sqlite3_column_text(statement, 0);
		units  = sqlite3_column_int(statement, 1);
		price  = sqlite3_column_double(statement, 2);
		lastPrice  = sqlite3_column_double(statement, 3);
		
		printf("We bought %d from %s at a price equal to %.4f\n",units, symbol, price);	
		
		NSString *aString = [NSString stringWithFormat:@"%s" , symbol];
		Company *aCompany = [[Company alloc] initWithName:aString description:@"Apple Inc." lastPrice:lastPrice];
		
		[self.companies addObject:aCompany];
		// Don't release this here.
		//[aString release];
		returnCode = sqlite3_step(statement);
	}
	sqlite3_finalize(statement);
	sqlite3_free(sqlStatement);
}

- (void)viewDidLoad {
	
	addWatchlistTickers();
	
	
	Company *aapl = [[Company alloc] initWithName:@"AAPL" description:@"Apple Inc." lastPrice:205.58];
	/*
	 Company *goog = [[Company alloc] initWithName:@"GOOG" description:@"Google Inc." lastPrice:205.58];
	 Company *msft = [[Company alloc] initWithName:@"MSFT" description:@"Microsoft Corporation"  lastPrice:205.58];
	 Company *ibm = [[Company alloc] initWithName:@"IBM" description:@"International Business Machines Corp." lastPrice:205.58];
	 Company *orcl = [[Company alloc] initWithName:@"ORCL" description:@"Oracle" lastPrice:205.58];
	 Company *csco = [[Company alloc] initWithName:@"CSCO" description:@"Cisco" lastPrice:205.58];
	 Company *c = [[Company alloc] initWithName:@"C" description:@"Citibank" lastPrice:205.58];
	 */
	
	NSLog(@"Loading companies");
	self.companies = [[NSMutableArray alloc] initWithObjects:aapl,nil];
	[self getWatchlistTickers];
    // Override point for customization after application launch.
	
	
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
	self.title = @"MarketApp";
	[super viewDidLoad];

}

/*
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}
*/
/*
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}
*/
/*
- (void)viewWillDisappear:(BOOL)animated {
	[super viewWillDisappear:animated];
}
*/
/*
- (void)viewDidDisappear:(BOOL)animated {
	[super viewDidDisappear:animated];
}
*/

/*
 // Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	// Return YES for supported orientations.
	return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
 */

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release anything that can be recreated in viewDidLoad or on demand.
	// e.g. self.myOutlet = nil;
}


#pragma mark Table view methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	//TabBarNavigatorAppDelegate *appDelegate = (TabBarNavigatorAppDelegate *)[[UIApplication sharedApplication] delegate];
	
    return self.companies.count;
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath22:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
	// Configure the cell.
	//TabBarNavigatorAppDelegate *appDelegate = (TabBarNavigatorAppDelegate *)[[UIApplication sharedApplication] delegate];
	Company *f = (Company *)[self.companies objectAtIndex:indexPath.row];
	
	[cell.textLabel setText:f.name];
	
	return cell;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	
	NSString *MyIdentifier = [NSString stringWithFormat:@"MyIdentifier %i", indexPath.row];
	
	MyTableCell *cell = (MyTableCell *)[tableView dequeueReusableCellWithIdentifier:MyIdentifier];
	
	if (cell == nil) {

		
		cell = [[[MyTableCell alloc] initWithFrame:CGRectZero reuseIdentifier:MyIdentifier] autorelease];
		
	//	TabBarNavigatorAppDelegate *appDelegate = (TabBarNavigatorAppDelegate *)[[UIApplication sharedApplication] delegate];
		Company *f = (Company *)[self.companies objectAtIndex:indexPath.row];

		
		UILabel *label = [[[UILabel	alloc] initWithFrame:CGRectMake(0.0, 0, 30.0, 
																	tableView.rowHeight)] autorelease]; 
		[cell addColumn:50];
		label.tag = LABEL_TAG; 
		label.font = [UIFont systemFontOfSize:12.0]; 
		label.text = [NSString stringWithFormat:@"%d", indexPath.row];
		label.textAlignment = UITextAlignmentRight; 
		label.textColor = [UIColor blueColor]; 
		label.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | 
		UIViewAutoresizingFlexibleHeight; 
		[cell.contentView addSubview:label]; 
		
		label =  [[[UILabel	alloc] initWithFrame:CGRectMake(60.0, 0, 50.0, 
															tableView.rowHeight)] autorelease]; 
		[cell addColumn:120];
		label.tag = VALUE_TAG; 
		label.font = [UIFont systemFontOfSize:12.0]; 
		// add some silly value
		label.text = f.name;
//		label.text = [NSString stringWithFormat:@"%d", indexPath.row * 4];
		label.textAlignment = UITextAlignmentLeft; 
		label.textColor = [UIColor blueColor]; 
		label.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | 
		UIViewAutoresizingFlexibleHeight; 
		[cell.contentView addSubview:label]; 
	

		label =  [[[UILabel	alloc] initWithFrame:CGRectMake(130.0, 0, 70.0, 
															tableView.rowHeight)] autorelease]; 
		[cell addColumn:170];
		label.tag = VALUE_TAG; 
		label.font = [UIFont systemFontOfSize:12.0]; 
		// add some silly value
		label.text = [NSString stringWithFormat:@"%.02f", f.lastPrice];

		//label.text = f.name;
		label.textAlignment = UITextAlignmentLeft; 
		label.textColor = [UIColor blueColor]; 
		label.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | 
		UIViewAutoresizingFlexibleHeight; 
		[cell.contentView addSubview:label]; 
	}
	
	return cell;
}


	
// =====================
// Override to support row selection in the table view.
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    // Navigation logic may go here -- for example, create and push another view controller.
	// AnotherViewController *anotherViewController = [[AnotherViewController alloc] initWithNibName:@"AnotherView" bundle:nil];
	// [self.navigationController pushViewController:anotherViewController animated:YES];
	// [anotherViewController release];
 
	
	 //TabBarNavigatorAppDelegate *appDelegate = [(TabBarNavigatorAppDelegate *)[UIApplication sharedApplication] delegate];
	Company *company = (Company *)[self.companies objectAtIndex:indexPath.row];
	
	if (self.companyView == nil) {
		CompanyViewController *viewController = [[CompanyViewController alloc] initWithNibName:@"CompanyViewController" bundle:[NSBundle mainBundle]];
		self.companyView = viewController;
		[viewController release];
	}
	
	[self.navigationController pushViewController:self.companyView animated:YES];
	self.companyView.title = [company name];
	[self.companyView.companyDescription setText:[company description]];

}



/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/


/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source.
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }   
}
*/


/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/


/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


- (void)dealloc {
    [super dealloc];
}


@end

