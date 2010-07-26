//
//  SecondView.h
//
//  Created by Michael Mellinger on 7/26/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface SecondView : UIViewController /* Specify a superclass (eg: NSObject or NSView) */ {

	IBOutlet UIView *view;
}

-(IBAction)back;

@end
