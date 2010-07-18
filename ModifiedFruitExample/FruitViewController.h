//
//  FruitViewController.h
//  Fruit
//
//  Created by Michael Mellinger on 6/15/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface FruitViewController : UIViewController {
	IBOutlet UITextView *fruitDescription;
}

@property(nonatomic,retain) IBOutlet UITextView *fruitDescription;

@end
