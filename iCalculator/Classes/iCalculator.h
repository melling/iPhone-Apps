//
//  iCalculator.h
//  iCalculator
//
//  Created by Michael Mellinger on 7/26/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface iCalculator : NSObject {

	NSMutableString *_display;
	double _operand;
	NSString *_operator;
}

-init;
-(void) dealloc;
-(void) input: (NSString *) character;
-(NSString *) displayValue;

@end
