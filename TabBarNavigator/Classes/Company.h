//
//  Fruit.h
//  Fruit
//
//  Created by Michael Mellinger on 6/14/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Company : NSObject {

	NSString *name;
	NSString *description;
	float_t lastPrice;
	
}
@property(nonatomic,copy) NSString *name;
@property(nonatomic,copy) NSString *description;
@property(nonatomic) float_t lastPrice;

- (id)initWithName:(NSString*)n description:(NSString*)desc;
- (id)initWithName:(NSString*)n description:(NSString*)desc lastPrice:(float_t)price;

@end
