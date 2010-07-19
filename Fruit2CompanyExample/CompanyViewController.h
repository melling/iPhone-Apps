//
//  companyViewController.h
//  Fruit
//
//  Created by Michael Mellinger on 6/15/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface CompanyViewController : UIViewController {
	IBOutlet UITextView *companyDescription;
}

@property(nonatomic,retain) IBOutlet UITextView *companyDescription;

@end
