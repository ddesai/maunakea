//
//  MaunakeaReadingDetailVC.m
//  Maunakea
//
//  Created by Darshan Desai on 3/17/13.
//  Copyright (c) 2013 Darshan Desai. All rights reserved.
//

#import "MaunakeaReadingDetailVC.h"
#import "MaunakeaAppDelegate.h"

@interface MaunakeaReadingDetailVC ()
@property (strong, nonatomic) UIPopoverController *masterPopoverController;
- (void)configureView;
@end

@implementation MaunakeaReadingDetailVC

DataModel* dm;
static int toggle = 6;

@synthesize myMemoryView;

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem
{
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        
        // Update the view.
        [self configureView];
    }
    
    if (self.masterPopoverController != nil) {
        [self.masterPopoverController dismissPopoverAnimated:YES];
    }
}

- (void)configureView
{
    // Update the user interface for the detail item.
    
    if (self.detailItem) {
        self.detailDescriptionLabel.text = [self.detailItem description];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Split view

- (void)splitViewController:(UISplitViewController *)splitController willHideViewController:(UIViewController *)viewController withBarButtonItem:(UIBarButtonItem *)barButtonItem forPopoverController:(UIPopoverController *)popoverController
{
    barButtonItem.title = NSLocalizedString(@"Master", @"Master");
    [self.navigationItem setLeftBarButtonItem:barButtonItem animated:YES];
    self.masterPopoverController = popoverController;
}

- (void)splitViewController:(UISplitViewController *)splitController willShowViewController:(UIViewController *)viewController invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem
{
    // Called when the view is shown again in the split view, invalidating the button and popover controller.
    [self.navigationItem setLeftBarButtonItem:nil animated:YES];
    self.masterPopoverController = nil;
}


// --- Table View

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if(!dm) {
        // Obtain the Data Model from the App Delegate
        dm = [(MaunakeaAppDelegate *)[[UIApplication sharedApplication] delegate] dataModel];
    }
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    if(!dm) {
        // Obtain the Data Model from the App Delegate
        dm = [(MaunakeaAppDelegate *)[[UIApplication sharedApplication] delegate] dataModel];
    }
    return [dm getMemorySize];
    //return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    //UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    UITableViewCell *cell = [myMemoryView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    // Configure the cell...
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier];
        //cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    cell.textLabel.text = [dm getMemoryAddrAtIndex:[indexPath row]];
    cell.detailTextLabel.text = [dm getMemoryValAtIndex:[indexPath row]];
    toggle++; if(toggle == 9) toggle = 1;
    if(toggle <= 4) {
        cell.backgroundColor = dm.C1;
    }
    else if(toggle <=8) {
        cell.backgroundColor = dm.C4;
    }
    
    /*
    // For the first time, it initializes it to these values
    // Later, after I change the data model to use object, this code will change
    if([dataModel currentSection] == SECTION_INIT) {
        cell.textLabel.text = [dataModel getSectionAtIndex:[indexPath row]];
        cell.detailTextLabel.text = [self parseSelection:[indexPath row]];
    }
    // Makes sure that we only update the changed item
    else {
        if([dataModel currentSection] == [indexPath row])
            cell.detailTextLabel.text = [self parseSelection:[indexPath row]];
    }*/
    return cell;
}


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    /*
    [dataModel setCurrentSection:[indexPath row]];
    
    SearchDetailViewController *ivc = [[SearchDetailViewController alloc] initWithStyle:UITableViewStyleGrouped];
    ivc.searchDelegate = self;
    
    [self.navigationController pushViewController:ivc animated:YES];
     */
}



@end