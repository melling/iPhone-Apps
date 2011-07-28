//
//  Person.m
//  PredicateFilter
//
//  Created by Michael Mellinger on 7/27/11.
//  Copyright 2011 h4labs. All rights reserved.
//

#import "Person.h"

@implementation Person

@synthesize firstName;
@synthesize lastName;

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

+ (Person *)personWithFirstName:(NSString *)firstName lastName:(NSString *)lastName
{
	Person *person = [[[Person alloc] init] autorelease];
	person.firstName = firstName;
	person.lastName = lastName;
    
	return person;
}

- (NSString *)description
{
	return [NSString stringWithFormat:@"",
			NSStringFromClass([self class]),
			firstName,
			lastName];
}

- (void) dealloc
{
	[firstName release];
	[lastName release];
	[super dealloc];
}

@end
