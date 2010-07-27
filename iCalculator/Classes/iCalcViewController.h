//
//  iCalcViewController.h
//  iCalculator
//
//  Created by Michael Mellinger on 7/26/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class iCalculator;

@interface iCalcViewController : UIViewController {

	IBOutlet id displayField;
	iCalculator *_calculator;
}

-(IBAction) press:(id)sender;

@end
