//
//  CompanyAppDelegate.m
//  Fruit
//
//  Created by Michael Mellinger on 6/14/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import "CompanyAppDelegate.h"
#import "RootViewController.h"
#import "Company.h"
#import "/usr/include/sqlite3.h"


@implementation CompanyAppDelegate

@synthesize window;
@synthesize navigationController;
@synthesize companies;

#pragma mark -
#pragma mark Application lifecycle

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
		
		symbol = sqlite3_column_text(statement, 0);
		units  = sqlite3_column_int(statement, 1);
		price  = sqlite3_column_double(statement, 2);
		lastPrice  = sqlite3_column_double(statement, 3);

		printf("We bought %d from %s at a price equal to %.4f\n",units, symbol, price);	
		
		NSString *aString = [NSString stringWithFormat:@"%s" , symbol];
		Company *aCompany = [[Company alloc] initWithName:aString description:@"Apple Inc." lastPrice:lastPrice];
		
		[self.companies addObject:aCompany];

		[aString release];
		returnCode = sqlite3_step(statement);
	}
	sqlite3_finalize(statement);
	sqlite3_free(sqlStatement);
}


- (void)applicationDidFinishLaunching:(UIApplication *)application {    
    
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
	
    // Override point for customization after app launch    
	[self getYahooPrices];
	[window addSubview:[navigationController view]];
    [window makeKeyAndVisible];
}

//- (void)load {
//	NSURL *myURL = [NSURL URLWithString:@""];
//	NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:myURL
//														   cachePolicy:NSURLRequestReloadIgnoringLocalCacheData
//													   timeoutInterval:60];
//	
//    [[NSURLConnection alloc] initWithRequest:request delegate:self];
//}
//
//- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
//    responseData = [[NSMutableData alloc] init];
//}
//
//- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
//    [responseData appendData:data];
//}
//
//- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
//    [responseData release];
//    [connection release];
//    [textView setString:@"Unable to fetch data"];
//}
//
//- (void)connectionDidFinishLoading:(NSURLConnection *)connection 
//{
//    NSLog(@"Succeeded! Received %d bytes of data",[responseData
//                                                   length]);
//    NSString *txt = [[[NSString alloc] initWithData:responseData encoding: NSASCIIStringEncoding] autorelease];
//	
//}
- (void)getYahooPrices {
	// Create the request.
	NSURLRequest *theRequest=[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://download.finance.yahoo.com/d/quotes.csv?s=AAPL&f=sl1d1t1c1ohgv&e=.csv"]
											  cachePolicy:NSURLRequestUseProtocolCachePolicy
										  timeoutInterval:60.0];
	// create the connection with the request
	// and start loading the data
	NSURLConnection *theConnection=[[NSURLConnection alloc] initWithRequest:theRequest delegate:self];
	if (theConnection) {
		// Create the NSMutableData to hold the received data.
		// receivedData is an instance variable declared elsewhere.
		receivedData = [[NSMutableData data] retain];
//		NSLog([NSString stringWithFormat:@"%s", receivedData]);
//		NSLog(receivedData);
	} else {
		NSLog(@"No connection");
		// Inform the user that the connection failed.
	}	
}
- (void)applicationWillTerminate:(UIApplication *)application {
	// Save data if appropriate
}


#pragma mark -
#pragma mark Memory management

- (void)dealloc {
	[navigationController release];
	[window release];
	[super dealloc];
}


@end

