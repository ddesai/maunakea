//
//  MaunakeaAppDelegate.h
//  Maunakea
//
//  Created by Darshan Desai on 3/17/13.
//  Copyright (c) 2013 Darshan Desai. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataModel.h"

@interface MaunakeaAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) DataModel *dataModel;
@property (strong, nonatomic) UIWindow *window;

@end
