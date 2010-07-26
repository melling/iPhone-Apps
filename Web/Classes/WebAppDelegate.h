//
//  WebAppDelegate.h
//  Web
//
//  Created by Michael Mellinger on 7/26/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@class WebViewController;

@interface WebAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    WebViewController *viewController;
	UIWebView *hackerNews;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet WebViewController *viewController;
@property (nonatomic, retain) IBOutlet UIWebView *hackerNews;

@end

