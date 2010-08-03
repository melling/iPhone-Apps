//
//  SnowFallViewController.h
//  SnowFall
//
//  Created by apple on 10/9/08.
//  Copyright Amuck LLC 2008. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SnowFallViewController : UIViewController {
	UIImage* flakeImage;
}
@property (nonatomic, retain) UIImage* flakeImage;
- (void)onTimer;
- (void)onAnimationComplete:(NSString *)animationID finished:(NSNumber *)finished context:(void *)context;
@end

