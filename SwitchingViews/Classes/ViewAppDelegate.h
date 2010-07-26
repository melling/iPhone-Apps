//
//  ViewAppDelegate.h
//  View
//
//  Created by Michael Mellinger on 7/26/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ViewViewController;

@interface ViewAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    ViewViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet ViewViewController *viewController;

@end

