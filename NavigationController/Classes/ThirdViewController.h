//
//  ThirdViewController.h
//  NavigationController
//
//  Created by Chakra on 31/03/10.
//  Copyright 2010 Chakra Interactive Pvt Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ForthViewController;


@interface ThirdViewController : UIViewController {

	IBOutlet ForthViewController*forthViewController;
}

 @property(nonatomic, retain) ForthViewController*forthViewController;

 - (IBAction)PressMe:(id)sender;

@end
