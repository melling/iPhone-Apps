//
//  TestAdViewController.h
//  TestAd
//
//  Created by Michael Mellinger on 8/21/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <iAd/iAd.h>;

@interface TestAdViewController : UIViewController <ADBannerViewDelegate>{
	
	ADBannerView *adView;
	BOOL bannerIsVisible;

}

@property (nonatomic,assign) BOOL bannerIsVisible;

@end

