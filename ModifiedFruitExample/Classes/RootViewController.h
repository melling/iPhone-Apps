//
//  RootViewController.h
//  Fruit
//
//  Created by Michael Mellinger on 6/14/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FruitViewController.h"

@interface RootViewController : UITableViewController {
	FruitViewController *fruitView;
}

@property(nonatomic,retain) FruitViewController *fruitView;
@end
