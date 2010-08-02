#import <UIKit/UIKit.h>

@class CDAViewController;

@interface CDAUIView : UIView {
  CDAViewController *myController;
}

@property(nonatomic, assign) CDAViewController* myController;

@end
