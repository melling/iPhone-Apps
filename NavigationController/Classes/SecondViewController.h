//
//  SecondViewController.h
//  NavigationController
//
//  Created by Chakra on 31/03/10.
//  Copyright 2010 Chakra Interactive Pvt Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ThirdViewController;

@interface SecondViewController : UIViewController {
	
	IBOutlet ThirdViewController *thirdViewController;
	
}

@property(nonatomic, retain) ThirdViewController*thirdViewController;

- (IBAction)PressMe:(id)sender;

@end
