//
//  RootViewController.h
//  Fruit
//
//  Created by Michael Mellinger on 6/14/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CompanyViewController.h"

@interface RootViewController : UITableViewController {
	CompanyViewController *fruitView;
}

@property(nonatomic,retain) CompanyViewController *fruitView;
@end
