//
//  Book.m
//  BookApp
//
//  Created by Michael Mellinger on 8/22/11.
//  Copyright 2011 h4labs. All rights reserved.
//

#import "Book.h"

@implementation Book

@synthesize title, author, year, rating;

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

-(id)initWithTitle:(NSString *)aTitle author:(NSString *)anAuthor year:(NSInteger )aYear rating:(NSNumber *)aRating {

    self.title = aTitle;
    self.author = anAuthor;
    self.year = aYear;
    self.rating = aRating;
    
    return self;
}

@end
