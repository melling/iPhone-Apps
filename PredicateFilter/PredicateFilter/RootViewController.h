//
//  RootViewController.h
//  PredicateFilter
//
//  Created by Michael Mellinger on 7/27/11.
//  Copyright 2011 h4labs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RootViewController : UITableViewController {
    NSArray *people;
	NSArray *filteredPeople;
    
	UISearchDisplayController *searchDisplayController;
}

@property (nonatomic, retain) NSArray *people;
@property (nonatomic, retain) NSArray *filteredPeople;

@property (nonatomic, retain) UISearchDisplayController *searchDisplayController;


@end
