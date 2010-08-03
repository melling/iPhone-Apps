//
//  MinutesToMidnightViewController.h
//  MinutesToMidnight
//
//  Created by Michael Mellinger on 6/14/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MinutesToMidnightViewController : UIViewController {
    IBOutlet UILabel *countdownLabel;
}
- (void)updateLabel;
@end

