//
//  ApiViewController.m
//  ApiTester
//
//  Created by WU Kai on 6/14/11.
//  Copyright 2011 None. All rights reserved.
//

#import "ApiViewController.h"
#import "ApiParameterCell.h"
#import "ApiResultCell.h"
#import "ApiParameter.h"
#import "Api.h"


@implementation ApiViewController
@synthesize api = _api;
@synthesize parameters = _parameters,result=_result;
@synthesize parameterTable;
@synthesize none;
@synthesize infoButton,parametersButton,resultButton,tableView=_tableView;

- (id)init
{
    self = [super init];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)dealloc
{
    [_api release];
    [_parameters release];
    [_result release];
    [none release];
    [infoButton release];
    [parametersButton release];
    [resultButton release];
    [_tableView release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (IBAction)testButtonAction:(id) sender
{
    NSLog(@"test %@",self.api.name);
}

- (IBAction)infoButtonAction:(id) sender
{
    NSLog(@"show info for %@",self.api.name);
}

- (IBAction)parametersButtonAction:(id) sender
{
    NSLog(@"show %@ parameters",self.api.name);
    self.parameterTable = YES;
    [self.tableView reloadData];
}

- (IBAction)resultButtonAction:(id) sender
{
    NSLog(@"show %@ result",self.api.name);
    self.parameterTable = NO;
    [self.tableView reloadData];
}
#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = self.api.name;
    self.navigationItem.rightBarButtonItem = [[[UIBarButtonItem alloc] initWithTitle:@"Test"
                                                                               style:UIBarButtonItemStylePlain
                                                                              target:self
                                                                              action:@selector(testButtonAction:)] autorelease];
    NSArray *parameters = [self.api.apiParameters allObjects];
    self.parameters = [NSMutableArray array];
    [self.parameters addObject:[NSMutableArray array]];//mandatory
    [self.parameters addObject:[NSMutableArray array]];//optional
    for (ApiParameter *parameter in parameters) {
        [[self.parameters objectAtIndex:[parameter.optional intValue]] addObject:parameter];
    }
    self.parametersButton.highlighted = YES;
    self.parameterTable = YES;
    self.result = nil;

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

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections: mandatory,optional,result
    return self.isParameterTable ? 2 : 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    if (self.isParameterTable) {
        NSInteger count = [[self.parameters objectAtIndex:section] count];
        return count > 0 ? count : 1;
    }
    return 1;//ApiResultSection;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ParameterCellIdentifier = @"ParameterCell";
    static NSString *ResultCellIdentifier = @"ResultCell";
    
    if (!self.isParameterTable) {
        if (!self.result) {
            return self.none;
        }
        else {
            ApiResultCell *cell = (ApiResultCell *) [tableView dequeueReusableCellWithIdentifier:ResultCellIdentifier];
            if (cell == nil) {
                cell = (ApiResultCell *) [[[NSBundle mainBundle] loadNibNamed:@"ApiResultCell" owner:self options:nil] lastObject];
            }
            return cell;
        }
    }
    else {
        NSMutableArray *section = [self.parameters objectAtIndex:indexPath.section];

        if ([section count] == 0) {
            return self.none;
        }
        else {
            ApiParameter *parameter = [section objectAtIndex:indexPath.row];
            ApiParameterCell *cell = (ApiParameterCell *) [tableView dequeueReusableCellWithIdentifier:ParameterCellIdentifier];
            if (cell == nil) {
                cell = (ApiParameterCell *) [[[NSBundle mainBundle] loadNibNamed:@"ApiParameterCell" owner:self options:nil] lastObject];
            }
            // Configure the cell...
            cell.parameterName.text = parameter.parameterName;
            cell.parameterValue.text = parameter.parameterValue;
            cell.accessoryType = UITableViewCellAccessoryCheckmark;
            return cell;
        }
    }

    return nil;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSArray *titles = [NSArray arrayWithObjects:@"Mandatory Parameters",@"Optional Parameters",nil];
    return self.isParameterTable ? [titles objectAtIndex:section] : @"Result";
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

#pragma mark - Table view delegate

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
}

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.view endEditing:YES];
}

#pragma mark - Text field delegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
    [super touchesBegan:touches withEvent:event];
}


@end
