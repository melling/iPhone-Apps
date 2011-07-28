//
//  Person.h
//  PredicateFilter
//
//  Created by Michael Mellinger on 7/27/11.
//  Copyright 2011 h4labs. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject {
    NSString *firstName;
	NSString *lastName;
}

@property (nonatomic, retain) NSString *firstName;
@property (nonatomic, retain) NSString *lastName;

+ (Person *)personWithFirstName:(NSString *)firstName lastName:(NSString *)lastName;

@end
