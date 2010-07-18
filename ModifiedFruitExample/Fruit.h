//
//  Fruit.h
//  Fruit
//
//  Created by Michael Mellinger on 6/14/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Fruit : NSObject {

	NSString *name;
	NSString *description;
	
}
@property(nonatomic,copy) NSString *name;
@property(nonatomic,copy) NSString *description;

- (id)initWithName:(NSString*)n description:(NSString*)desc;

@end
