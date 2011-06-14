//
//  ApiListViewController.m
//  ApiTester
//
//  Created by WU Kai on 5/30/11.
//  Copyright 2011 None. All rights reserved.
//

#import "ApiListViewController.h"
#import "ApiViewController.h"
#import "Provider.h"
#import "Api.h"


@implementation ApiListViewController

@synthesize provider=_provider;
@synthesize sections=_sections;
@synthesize filtered=_filtered;
@synthesize searchBar=_searchBar;
@synthesize searchDC=_searchDC;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)dealloc
{
    [_provider release];
    [_sections release];
    [_filtered release];
    [_searchBar release];
    [_searchDC release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark -
#pragma mark View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSArray *apis = [[self.provider.apis allObjects] sortedArrayUsingSelector:@selector(compare:)];
    self.title = self.provider.title;
    self.sections = [NSMutableArray array];
    self.filtered = [NSArray array];
    NSMutableArray *sections = [NSMutableArray array];
    for (Api *api in apis) {
        NSUInteger slashLetter = [api.name rangeOfString:@"/"].location;
        NSString *section = slashLetter != NSNotFound ? [api.name substringToIndex:slashLetter] : api.name;
        if (![sections containsObject:section]) {
              [sections addObject:section];
              [self.sections addObject:[NSMutableArray array]];
        }
        NSUInteger count = [self.sections count] - 1;
        [[self.sections objectAtIndex:count] addObject:api];
    }

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
{
    [self.searchBar setText:@""];
}

#pragma mark -
#pragma mark Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    if (tableView == self.tableView) return [self.sections count];
    return 1;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (tableView == self.tableView) {
        Api *api = [[self.sections objectAtIndex:section] objectAtIndex:0];
        NSUInteger slashLetter = [api.name rangeOfString:@"/"].location;
        return slashLetter != NSNotFound ? [api.name substringToIndex:slashLetter] : api.name;
    }
    return nil;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    if (tableView == self.tableView) {
        return [[self.sections objectAtIndex:section] count];
    }
    NSArray *apis = [[self.provider.apis allObjects] sortedArrayUsingSelector:@selector(compare:)];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"name contains[cd] %@",self.searchBar.text];
    self.filtered = [apis filteredArrayUsingPredicate:predicate];
    return [self.filtered count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"ApiCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier] autorelease];
    }

    Api *api = nil;
    if (tableView == self.tableView) {
        api = [[self.sections objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
    }
    else {
        api = [self.filtered objectAtIndex:indexPath.row];
    }
    // Configure the cell...
    cell.textLabel.text = api.name;
    cell.detailTextLabel.text = api.briefing;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIColor *lite = [UIColor colorWithPatternImage:[UIImage imageNamed:@"JeansLiteCell.png"]];
    UIColor *dark = [UIColor colorWithPatternImage:[UIImage imageNamed:@"JeansDarkCell.png"]];
    if (indexPath.row%2>0 ) {
        cell.backgroundColor = lite ;
        cell.textLabel.backgroundColor = [UIColor clearColor];
        cell.textLabel.shadowColor = [UIColor whiteColor];
        cell.textLabel.shadowOffset = CGSizeMake(0.0,1.0);
        cell.detailTextLabel.backgroundColor = [UIColor clearColor];
        cell.detailTextLabel.shadowColor = [UIColor whiteColor];
        cell.detailTextLabel.shadowOffset = CGSizeMake(0.0,1.0);
    }
    else {
        cell.backgroundColor = dark ;
        cell.textLabel.backgroundColor = [UIColor clearColor];
        cell.textLabel.shadowColor = [UIColor whiteColor];
        cell.textLabel.shadowOffset = CGSizeMake(0.0,1.0);
        cell.detailTextLabel.backgroundColor = [UIColor clearColor];
        cell.detailTextLabel.shadowColor = [UIColor whiteColor];
        cell.detailTextLabel.shadowOffset = CGSizeMake(0.0,1.0);
    }
}
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark -
#pragma mark Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     [detailViewController release];
     */
    Api *api = nil;
    if (tableView == self.tableView) {
        api = [[self.sections objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
    }
    else {
        api = [self.filtered objectAtIndex:indexPath.row];
    }
    ApiViewController *vc = [[ApiViewController alloc] initWithNibName:@"ApiViewController" bundle:nil];
    vc.api = api;
    [self.navigationController pushViewController:vc animated:YES];
    [vc release];
}

@end
