//
//  FirstViewController.h
//  NavigationController
//
//  Created by Chakra on 31/03/10.
//  Copyright 2010 Chakra Interactive Pvt Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SecondViewController;

@interface FirstViewController : UIViewController {

	IBOutlet SecondViewController *secondViewController;
}

@property(nonatomic, retain) SecondViewController *secondViewController;

- (IBAction)PressMe:(id)sender;

@end
