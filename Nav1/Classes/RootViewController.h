//
//  RootViewController.h
//  Nav1
//
//  Created by Michael Mellinger on 7/28/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RootViewController : UIViewController {
	IBOutlet UIButton *pressStudy;
	IBOutlet UIButton *pressFlashcards;
	IBOutlet UIButton *pressQuiz;
	IBOutlet UIButton *pressHelp;
	IBOutlet UIButton *pressAbout;
}

@property (nonatomic, retain) IBOutlet UIButton *pressStudy;
@property (nonatomic, retain) IBOutlet UIButton *pressFlashcards;
@property (nonatomic, retain) IBOutlet UIButton *pressQuiz;
@property (nonatomic, retain) IBOutlet UIButton *pressHelp;
@property (nonatomic, retain) IBOutlet UIButton *pressAbout;

-(IBAction)pressStudy:(id)sender;
-(IBAction)pressFlashcards:(id)sender;
-(IBAction)pressQuiz:(id)sender;
-(IBAction)pressHelp:(id)sender;
-(IBAction)pressAbout:(id)sender;

@end
