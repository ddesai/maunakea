//
//  DataModel.m
//  Maunakea
//
//  Created by Darshan Desai on 3/17/13.
//  Copyright (c) 2013 Darshan Desai. All rights reserved.
//

#import "DataModel.h"

@implementation DataModel

@synthesize categories;


- (id) init
{
    self = [super init];
    if (self) {
        categories = [[NSMutableArray alloc] init];
    }
    [self initCats];
    return self;
}

- (void) addCategoryWithName:(NSString*)newName andVC:(UIViewController*)newVC
{
    Category *c = [[Category alloc] initCategoryWithName:newName andVC:newVC];
    [categories addObject:c];
}

- (int) getCategories
{
    return [categories count];
}

- (void) initCats
{
    [self addCategoryWithName:@"Home" andVC:nil];
    [self addCategoryWithName:@"Chapter 1" andVC:nil];
    [self addCategoryWithName:@"Chapter 2" andVC:nil];
}
@end


// Category Class
@implementation Category

@synthesize name, detailVC;


- (id) initCategoryWithName:(NSString*)newName andVC:(UIViewController*)newVC
{
    self = [super init];
    if(self) {
        name = newName;
        detailVC = newVC;
    }
    return self;
}

- (id) init
{
    return [self initCategoryWithName:@"UNDEF Category" andVC:nil];
}

@end
