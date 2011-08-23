//
//  BookAppAppDelegate.h
//  BookApp
//
//  Created by Michael Mellinger on 8/22/11.
//  Copyright 2011 h4labs. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BookAppViewController;

@interface BookAppAppDelegate : NSObject <UIApplicationDelegate> {
    NSMutableArray *appBookList;

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet BookAppViewController *viewController;

@property (nonatomic, retain) NSMutableArray *appBookList;

- (NSMutableArray *)getBookList;
- (void)setBookList:(NSMutableArray *)aBookList;
@end
