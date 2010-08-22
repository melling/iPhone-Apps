//
//  TestAdAppDelegate.h
//  TestAd
//
//  Created by Michael Mellinger on 8/21/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TestAdViewController;

@interface TestAdAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    TestAdViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet TestAdViewController *viewController;

@end

