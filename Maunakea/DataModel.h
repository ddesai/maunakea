//
//  DataModel.h
//  Maunakea
//
//  Created by Darshan Desai on 3/17/13.
//  Copyright (c) 2013 Darshan Desai. All rights reserved.
//

#import <Foundation/Foundation.h>

// Memory Class
@interface MemoryCell : NSObject

@property (strong, atomic) NSString *addr;
@property (strong, atomic) NSString *val;

- (id) initMemoryCellWithAddress:(NSString*)newAddress andValue:(NSString*)newValue;
- (id) initMemoryCellWithValue:(NSString*)newValue;
- (id) init;

@end


// Category Class
@interface Category : NSObject

@property (strong, atomic) NSString *name;
@property (strong, atomic) UIViewController *detailVC;

- (id) initCategoryWithName:(NSString*)newName andVC:(UIViewController*)newVC;
- (id) init;

@end



// Data Model
@interface DataModel : NSObject

@property (strong, atomic) NSMutableArray *categories;
@property (strong, atomic) NSMutableArray *memory;


- (id) init;
- (void) addVC:(NSString*)newName andVC:(UIViewController*)newVC;
- (int) getCategories;

//Memory
- (void) addMemoryCell:(NSString*)newAddress andValue:(NSString*)newValue;
- (void) addMemoryCellWithValue:(NSString*)newValue;
- (void) addMemoryCell;
- (int) getMemorySize;
- (MemoryCell*)getMemoryAtIndex: (NSUInteger) index;
- (NSString *)getMemoryAddrAtIndex: (NSUInteger) index;
- (NSString *)getMemoryValAtIndex: (NSUInteger) index;
@end

