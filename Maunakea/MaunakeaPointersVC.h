//
//  MaunakeaPointersVC.h
//  Maunakea
//
//  Created by Darshan Desai on 3/23/13.
//  Copyright (c) 2013 Darshan Desai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MaunakeaPointersVC : UIViewController <UISplitViewControllerDelegate, UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

// pointer to the table - to access it
@property (weak) IBOutlet UITableView* myMemoryView;

@end

