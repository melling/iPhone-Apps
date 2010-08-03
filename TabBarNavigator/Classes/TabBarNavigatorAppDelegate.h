//
//  TabBarNavigatorAppDelegate.h
//  TabBarNavigator
//
//  Created by Michael Mellinger on 7/25/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TabBarNavigatorAppDelegate : NSObject <UIApplicationDelegate, UITabBarControllerDelegate> {
    UIWindow *window;
    UITabBarController *tabBarController;
	UIWebView *hackerNewsWeb;
	UINavigationController *navigationController;


}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UINavigationController *navigationController;
@property (nonatomic, retain) IBOutlet UITabBarController *tabBarController;
@property (nonatomic, retain) IBOutlet UIWebView *hackerNewsWeb;

@end
