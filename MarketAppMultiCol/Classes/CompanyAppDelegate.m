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


@implementation CompanyAppDelegate

@synthesize window;
@synthesize navigationController;
@synthesize companies;

#pragma mark -
#pragma mark Application lifecycle

- (void)applicationDidFinishLaunching:(UIApplication *)application {    
    
	Company *aapl = [[Company alloc] initWithName:@"AAPL" description:@"Apple Inc." lastPrice:205.58];
	Company *goog = [[Company alloc] initWithName:@"GOOG" description:@"Google Inc." lastPrice:205.58];
	Company *msft = [[Company alloc] initWithName:@"MSFT" description:@"Microsoft Corporation"  lastPrice:205.58];
	Company *ibm = [[Company alloc] initWithName:@"IBM" description:@"International Business Machines Corp." lastPrice:205.58];
	Company *orcl = [[Company alloc] initWithName:@"ORCL" description:@"Oracle" lastPrice:205.58];
	Company *csco = [[Company alloc] initWithName:@"CSCO" description:@"Cisco" lastPrice:205.58];
	Company *c = [[Company alloc] initWithName:@"C" description:@"Citibank" lastPrice:205.58];

	NSLog(@"Loading companies");
	self.companies = [[NSMutableArray alloc] initWithObjects:aapl,goog,msft,ibm,orcl,csco,c,nil];
				
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

