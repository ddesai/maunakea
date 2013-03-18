//
//  DataModel.h
//  Maunakea
//
//  Created by Darshan Desai on 3/17/13.
//  Copyright (c) 2013 Darshan Desai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataModel : NSObject

@property (strong, atomic) NSMutableArray *categories;


- (id) init;
- (void) addVC:(NSString*)newName andVC:(UIViewController*)newVC;
- (int) getCategories;

@end

// Category Class
@interface Category : NSObject

@property (strong, atomic) NSString *name;
@property (strong, atomic) UIViewController *detailVC;

- (id) initCategoryWithName:(NSString*)newName andVC:(UIViewController*)newVC;
- (id) init;

@end
