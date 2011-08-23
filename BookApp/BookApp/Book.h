//
//  Book.h
//  BookApp
//
//  Created by Michael Mellinger on 8/22/11.
//  Copyright 2011 h4labs. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Book : NSObject {
    NSString *title;
    NSString *author;
    NSInteger year;
    NSNumber *rating;
    
}

@property (nonatomic, retain) NSString *title;
@property (nonatomic, retain) NSString *author;
@property (nonatomic, retain) NSNumber *rating;
@property NSInteger year;

-(id)initWithTitle:(NSString *)aTitle author:(NSString *)anAuthor year:(NSInteger )aYear rating:(NSNumber *)aRating;
@end
