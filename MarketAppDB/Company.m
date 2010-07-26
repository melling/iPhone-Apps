//
//  Fruit.m
//  Fruit
//
//  Created by Michael Mellinger on 6/14/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "Company.h"

@implementation Company
@synthesize name,description,lastPrice;

- (id)initWithName:(NSString*)n description:(NSString*)desc {
	self.name = n;
	self.description = desc;
	return self;
}

- (id)initWithName:(NSString*)n description:(NSString*)desc lastPrice:(float_t)price{
	self.name = n;
	self.description = desc;
	self.lastPrice = price;
	return self;
}

@end
