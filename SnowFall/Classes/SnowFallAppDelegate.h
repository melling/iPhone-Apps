//
//  SnowFallAppDelegate.h
//  SnowFall
//
//  Created by apple on 10/9/08.
//  Copyright Amuck LLC 2008. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SnowFallViewController;

@interface SnowFallAppDelegate : NSObject <UIApplicationDelegate> {
	IBOutlet UIWindow *window;
	IBOutlet SnowFallViewController *viewController;
}

@property (nonatomic, retain) UIWindow *window;
@property (nonatomic, retain) SnowFallViewController *viewController;

@end

