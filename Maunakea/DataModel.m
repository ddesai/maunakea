//
//  DataModel.m
//  Maunakea
//
//  Created by Darshan Desai on 3/17/13.
//  Copyright (c) 2013 Darshan Desai. All rights reserved.
//

#import "DataModel.h"

@implementation DataModel

@synthesize categories, memory, C1, C2, C3, C4;


- (id) init
{
    self = [super init];
    if (self) {
        categories = [[NSMutableArray alloc] init];
        memory = [[NSMutableArray alloc] init];
    }
    [self initCats];
    //[self initMemoryVariables];
    [self initMemoryPointers];
    [self initGlobals];
    return self;
}

// general

- (void) initGlobals
{
    C1 = [UIColor colorWithRed:0.8 green:0.4 blue:1 alpha:1];
    C2 = [UIColor colorWithRed:1 green:0.8 blue:0.5 alpha:1];
    C3 = [UIColor colorWithRed:1 green:0.9 blue:1 alpha:1];
    C4 = [UIColor colorWithRed:0.3 green:1 blue:0.4 alpha:1];
}

// Category code
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
    [self addCategoryWithName:@"Variables" andVC:nil];
    [self addCategoryWithName:@"Pointers" andVC:nil];
    [self addCategoryWithName:@"Functions" andVC:nil];
    [self addCategoryWithName:@"Link List" andVC:nil];
    [self addCategoryWithName:@"Pass by reference" andVC:nil];
    [self addCategoryWithName:@"Recursion" andVC:nil];
}


// Memory Code
- (void) addMemoryCell:(NSString*)newAddress andValue:(NSString*)newValue
{
    MemoryCell *m = [[MemoryCell alloc] initMemoryCellWithAddress:newAddress andValue:newValue];
    [memory addObject:m];
}

- (void) addMemoryCellWithValue:(NSString*)newValue
{
    MemoryCell *m = [[MemoryCell alloc] initMemoryCellWithValue:newValue];
    [memory addObject:m];
}

- (void) addMemoryCell
{
    MemoryCell *m = [[MemoryCell alloc] init];
    [memory addObject:m];
}

- (int) getMemorySize
{
    return [memory count];
}

- (MemoryCell *)getMemoryAtIndex: (NSUInteger) index
{
    return [memory objectAtIndex:index];
}

- (NSString *)getMemoryAddrAtIndex: (NSUInteger) index
{
    return [[memory objectAtIndex:index] addr];
}

- (NSString *)getMemoryValAtIndex: (NSUInteger) index
{
    return [[memory objectAtIndex:index] val];
}

- (void) initMemoryPointers
{
    [self addMemoryCell:@"Address" andValue:@"Value"];
    [self addMemoryCellWithValue:@"0"];
    [self addMemoryCellWithValue:@"0"];
    [self addMemoryCellWithValue:@"0"];
    [self addMemoryCellWithValue:@"41"];
    [self addMemoryCellWithValue:@"0"];
    [self addMemoryCellWithValue:@"0"];
    [self addMemoryCellWithValue:@"0"];
    [self addMemoryCellWithValue:@"34"];
    [self addMemoryCellWithValue:@"0"];
    [self addMemoryCellWithValue:@"0"];
    [self addMemoryCellWithValue:@"0"];
    [self addMemoryCellWithValue:@"75"];
    [self addMemoryCellWithValue:@"0"];
    [self addMemoryCellWithValue:@"0"];
    [self addMemoryCellWithValue:@"0"];
    [self addMemoryCellWithValue:@"7"];
    [self addMemoryCellWithValue:@"0"];
    [self addMemoryCellWithValue:@"0"];
    [self addMemoryCellWithValue:@"0xFF"];
    [self addMemoryCellWithValue:@"0x00"];
    [self addMemoryCellWithValue:@"0"];
    [self addMemoryCellWithValue:@"0"];
    [self addMemoryCellWithValue:@"0xFF"];
    [self addMemoryCellWithValue:@"0x04"];
    [self addMemoryCellWithValue:@"0"];
    [self addMemoryCellWithValue:@"0"];
    [self addMemoryCellWithValue:@"0xFF"];
    [self addMemoryCellWithValue:@"0x0C"];
    
    [self addMemoryCell];
    [self addMemoryCell];
}

- (void) initMemoryVariables
{
    [self addMemoryCell:@"Address" andValue:@"Value"];
    [self addMemoryCellWithValue:@"65"];
    [self addMemoryCellWithValue:@"0"];
    [self addMemoryCellWithValue:@"0"];
    [self addMemoryCellWithValue:@"0"];
    [self addMemoryCellWithValue:@"8"];
    [self addMemoryCellWithValue:@"0"];
    [self addMemoryCellWithValue:@"0"];
    [self addMemoryCellWithValue:@"0"];
    [self addMemoryCellWithValue:@"4"];
    [self addMemoryCellWithValue:@"0"];
    [self addMemoryCellWithValue:@"0"];
    [self addMemoryCellWithValue:@"0"];
    [self addMemoryCellWithValue:@"12"];
    [self addMemoryCellWithValue:@"0"];
    [self addMemoryCellWithValue:@"0"];
    [self addMemoryCellWithValue:@"0"];
    [self addMemoryCellWithValue:@"4"];
    [self addMemoryCellWithValue:@"0"];
    [self addMemoryCellWithValue:@"0"];
    [self addMemoryCellWithValue:@"0"];
    [self addMemoryCellWithValue:@"32"];
    [self addMemoryCellWithValue:@"0"];
    [self addMemoryCellWithValue:@"0"];
    [self addMemoryCellWithValue:@"0"];
    [self addMemoryCellWithValue:@"2"];
    
    [self addMemoryCell];
    [self addMemoryCell];
    [self addMemoryCell];
    [self addMemoryCell];
    [self addMemoryCell];
    [self addMemoryCell];
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



// Memory Class

// Category Class
@implementation MemoryCell

@synthesize addr, val;

static unsigned int memPointer = 0xFF00;

- (id) initMemoryCellWithAddress:(NSString*)newAddress andValue:(NSString*)newValue
{
    self = [super init];
    if(self) {
        addr = newAddress;
        val = newValue;
    }
    return self;
}

- (id) initMemoryCellWithValue:(NSString*)newValue
{
    NSString *newAddress = [NSString stringWithFormat:@"0x%X",memPointer++];
    return [self initMemoryCellWithAddress:newAddress andValue:newValue];
}


- (id) init
{
    return [self initMemoryCellWithValue:@"0"];
}

@end
