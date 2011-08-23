//
//  BookTableViewController.h
//  BookApp
//
//  Created by Michael Mellinger on 8/22/11.
//  Copyright 2011 h4labs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BookTableViewController : UITableViewController <UITableViewDataSource, UITableViewDelegate> {
    NSMutableArray *bookList;
}

@property (nonatomic, copy) NSMutableArray *bookList;

-(void)setBookList:(NSMutableArray *)aBookList;

@end
