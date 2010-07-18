//
//  FruitAppDelegate.h
//  Fruit
//
//  Created by Michael Mellinger on 6/14/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

@interface FruitAppDelegate : NSObject <UIApplicationDelegate> {
    
    UIWindow *window;
    UINavigationController *navigationController;
	
	NSMutableArray *fruits;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UINavigationController *navigationController;
@property (nonatomic, retain) NSMutableArray *fruits;

@end

