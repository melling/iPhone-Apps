//
//  TVAppDelegate.h
//  TVApp
//
//  Created by Michael Mellinger on 7/27/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TVAppDelegate : NSObject <UITableViewDataSource> {
    UIWindow *window;
	UITableView *myTable;
	NSArray    *theSimpsons;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@end

