//
//  ViewViewController.h
//  View
//
//  Created by Michael Mellinger on 7/26/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SecondView;

@interface ViewViewController : UIViewController {

	IBOutlet SecondView *view2;
}

-(IBAction)next;

@end

