//
//  RootViewController.h
//  Navi1
//
//  Created by Michael Mellinger on 8/2/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface RootViewController : UIViewController {
	IBOutlet UIButton *pressMe;
}

@property (nonatomic, retain) IBOutlet UIButton *pressMe;

-(IBAction)pressMe:(id)sender;

@end
