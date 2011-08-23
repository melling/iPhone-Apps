//
//  BookAppViewController.h
//  BookApp
//
//  Created by Michael Mellinger on 8/22/11.
//  Copyright 2011 h4labs. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "BookTableViewController.h"

@interface BookAppViewController : UIViewController {
    NSMutableArray *books;
    
    IBOutlet UITableView *bookTable;
    IBOutlet BookTableViewController *bookTableViewController;
}

@property (nonatomic, copy) NSMutableArray *books;
@property (nonatomic, retain) BookTableViewController *bookTableViewController;
@property (nonatomic, retain) UITableView *bookTable;

- (IBAction)populateBookData:(id)sender;
- (IBAction)dumpBookData:(id)sender;
@end
