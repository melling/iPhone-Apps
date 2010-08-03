//
//  MinutesToMidnightAppDelegate.h
//  MinutesToMidnight
//
//  Created by Michael Mellinger on 6/14/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MinutesToMidnightViewController;

@interface MinutesToMidnightAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    MinutesToMidnightViewController *viewController;
	NSTimer *timer;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet MinutesToMidnightViewController *viewController;
-(void) onTimer;

@end

