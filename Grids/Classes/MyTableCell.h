//
//  MyTableCell.h
//  Grids
//
//  Created by Tracy Snell on 10/17/08.
//  Copyright 2008 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface MyTableCell : UITableViewCell {

	NSMutableArray *columns;
}

- (void)addColumn:(CGFloat)position;

@end
