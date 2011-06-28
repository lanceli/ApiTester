//
//  ProviderViewController.m
//  ApiTester
//
//  Created by WU Kai on 5/26/11.
//  Copyright 2011 None. All rights reserved.
//

#import "ApiTesterAppDelegate.h"
#import "ProviderViewController.h"
#import "AuthorizeWebViewController.h"
#import "ApiListViewController.h"
#import "Provider.h"

@implementation ProviderViewController

@synthesize providers=_providers;
@synthesize reloadCell=_reloadCell;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
        self.reloadCell = nil;
    }
    return self;
}

- (void)dealloc
{
    [_providers release];
    [_reloadCell release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (IBAction)infoButtonAction
{
}

#pragma mark -
#pragma mark View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];

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
    if (self.reloadCell) {
        [self.tableView reloadRowsAtIndexPaths:[NSArray arrayWithObject:self.reloadCell] withRowAnimation:NO];
    }
    self.reloadCell = nil;
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

#pragma mark -
#pragma mark Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [_providers count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"ProviderCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier] autorelease];
    }

    Provider *p = [self.providers objectAtIndex:indexPath.row];

    cell.textLabel.text = p.title;
    cell.detailTextLabel.text = [p isAuthorized] ? [NSString stringWithFormat:@"API total: %d ",[p.apis count]] : @"Authorization required";
    cell.imageView.image = [UIImage imageNamed:p.logo];
    cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
    
    // Configure the cell...
    return cell;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIColor *lite = [UIColor colorWithPatternImage:[UIImage imageNamed:@"MetalLiteCell.png"]];
    UIColor *dark = [UIColor colorWithPatternImage:[UIImage imageNamed:@"MetalDarkCell.png"]];
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
- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath
{
    Provider *provider = [self.providers objectAtIndex:indexPath.row];
    if ([provider isFacebook] || [provider isGithub]) {
        [provider revoke];
        ApiTesterAppDelegate *appDelegate = (ApiTesterAppDelegate *)[[UIApplication sharedApplication] delegate];
        [provider isFacebook] ? [appDelegate.facebook authorize:nil delegate:self] : [appDelegate.github authorize:nil delegate:self];
    }
    else {
        UIViewController<ProviderPropertyProtocol> *vc = 
               [[AuthorizeWebViewController alloc] initWithNibName:@"AuthorizeWebViewController"
                                                            bundle:nil];
        [vc setProvider:provider];
        [self presentModalViewController:vc animated:YES];
        [vc release];
    }
    self.reloadCell = indexPath;
}

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
    Provider *provider = [self.providers objectAtIndex:indexPath.row];
    if ([provider isAuthorized]) {
        NSLog(@"%@ is already authorized",provider.title);
        ApiListViewController *vc = [[ApiListViewController alloc] initWithNibName:@"ApiListViewController" bundle:nil];
        vc.provider = provider;
        [self.navigationController pushViewController:vc animated:YES];
        [vc release];
    }
    else {
        NSLog(@"%@ is not yet authorized",provider.title);
        [self tableView:tableView accessoryButtonTappedForRowWithIndexPath:indexPath];
    }
}

#pragma mark -
#pragma mark GHSessionDelegate
- (void)ghDidLogin
{
    ApiTesterAppDelegate *appDelegate = (ApiTesterAppDelegate *)[[UIApplication sharedApplication] delegate];
    NSLog(@"Github accessToken is :%@",appDelegate.github.accessToken);
    for (Provider *provider in self.providers) {
        if ([provider isGithub]) {
            provider.accessTokenKey = appDelegate.github.accessToken;
            provider.accessTokenSecret = appDelegate.github.accessToken;
            [self.tableView reloadRowsAtIndexPaths:[NSArray arrayWithObject:self.reloadCell] withRowAnimation:NO];
            break;
        }
    }
}

- (void)ghDidNotLogin:(BOOL)cancelled
{
    NSLog(@"Github dismissed");
    [self.tableView deselectRowAtIndexPath:self.reloadCell animated:NO];
}

- (void)ghDidLogout
{
    NSLog(@"Github logout");
}

#pragma mark -
#pragma mark FBSessionDelegate

/**
 * Your application should implement this delegate to receive session callbacks.
 */
- (void)fbDidLogin
{
    ApiTesterAppDelegate *appDelegate = (ApiTesterAppDelegate *)[[UIApplication sharedApplication] delegate];
    NSLog(@"Facebook accessToken is :%@",appDelegate.facebook.accessToken);
    NSLog(@"Facebook accessToken expires at :%@",appDelegate.facebook.expirationDate);
    //[self.tableView deselectRowAtIndexPath:self.reloadCell animated:NO];
    for (Provider *provider in self.providers) {
        if ([provider isFacebook]) {
            provider.accessTokenKey = appDelegate.facebook.accessToken;
            provider.accessTokenSecret = [appDelegate.facebook.expirationDate description];
            [self.tableView reloadRowsAtIndexPaths:[NSArray arrayWithObject:self.reloadCell] withRowAnimation:NO];
            break;
        }
    }
}

/**
 * Called when the user dismissed the dialog without logging in.
 */
- (void)fbDidNotLogin:(BOOL)cancelled
{
    NSLog(@"Facebook dismissed");
    [self.tableView deselectRowAtIndexPath:self.reloadCell animated:NO];
}

/**
 * Called when the user logged out.
 */
- (void)fbDidLogout
{
    NSLog(@"Facebook logout");
}
@end
