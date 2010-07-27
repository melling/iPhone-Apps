//
//  iCalculatorAppDelegate.h
//  iCalculator
//
//  Created by Michael Mellinger on 7/26/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@class iCalcViewController;

@interface iCalculatorAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
	iCalcViewController *calcViewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) iCalcViewController *calcViewController;

@end

