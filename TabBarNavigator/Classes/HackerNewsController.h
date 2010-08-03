//
//  HackerNews.h
//  TabBarNavigator
//
//  Created by Michael Mellinger on 7/25/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface HackerNewsController : UIViewController {
	IBOutlet UIWebView *webView;

}

@property (nonatomic, retain) UIWebView *webView;

@end
