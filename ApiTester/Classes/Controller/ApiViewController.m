//
//  ApiViewController.m
//  ApiTester
//
//  Created by WU Kai on 6/14/11.
//  Copyright 2011 None. All rights reserved.
//

#import "ApiViewController.h"
#import "ApiResultViewController.h"
#import "ApiInfoViewController.h"
#import "ApiParameterCell.h"
#import "ApiParameter.h"
#import "OAuthConsumer.h"
#import "Provider.h"
#import "Api.h"


@implementation ApiViewController
@synthesize api=_api,ticket=_ticket,response=_response;
@synthesize parameters=_parameters,activeField=_activeField;
@synthesize parameterTable;
@synthesize none,infoButton,parametersButton,resultButton,tableView=aTableView;

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
    [_ticket release];
    [_response release];
    [_parameters release];
    [_activeField release];

    [none release];
    [infoButton release];
    [parametersButton release];
    [resultButton release];
    [aTableView release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

-(void)request:(OAServiceTicket *)ticket didFinishWithData:(NSData *)data
{
    self.ticket = ticket;
    NSString *body = [[NSString alloc] initWithData:data
                                           encoding:NSUTF8StringEncoding];
    self.response = body;
    [body release];
    self.parameterTable = NO;
    [self.tableView reloadData];
}

-(void)request:(OAServiceTicket *)ticket didFailWithError:(NSError *)error
{
    self.ticket = ticket;
    self.response = [error localizedDescription];
    self.parameterTable = NO;
    [self.tableView reloadData];
}

- (IBAction)testButtonAction:(id) sender
{
    NSLog(@"test %@",self.api.name);
    OAMutableURLRequest *request = [[self.api.provider oauthRequest:[NSURL URLWithString:self.api.endPointURL]] autorelease];
    [request setHTTPMethod:self.api.httpMethod];

    NSMutableArray *mandatoryParameters = [self.parameters objectAtIndex:0];
    NSMutableArray *optionalParameters  = [self.parameters objectAtIndex:1];
    NSMutableArray *params = [NSMutableArray array];

    for (ApiParameter *p in mandatoryParameters) {
        OARequestParameter *op = [[OARequestParameter alloc] initWithName:p.parameterName
                                                                    value:p.parameterValue];
        [params addObject:op];
        [op release];
    }

    for (ApiParameter *p in optionalParameters) {
        if ([p.checked boolValue]) {
            OARequestParameter *op = [[OARequestParameter alloc] initWithName:p.parameterName
                                                                        value:p.parameterValue];
            [params addObject:op];
            [op release];
        }
    }

    [request setParameters:params];

    OADataFetcher *fetcher = [[[OADataFetcher alloc] init] autorelease];
    [fetcher fetchDataWithRequest:request
                         delegate:self
                didFinishSelector:@selector(request:didFinishWithData:)
                  didFailSelector:@selector(request:didFailWithError:)];
}

- (IBAction)infoButtonAction:(id) sender
{
    NSLog(@"show info for %@",self.api.name);
	ApiInfoViewController *vc = [[ApiInfoViewController alloc] initWithNibName:@"ApiInfoViewController" bundle:nil];
    vc.api = self.api;
	vc.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;

	[self presentModalViewController:vc animated:YES];
    [vc release];
}

- (IBAction)parametersButtonAction:(id) sender
{
    NSLog(@"show %@ parameters",self.api.name);
    if (!self.parameterTable) {
        self.parameterTable = YES;
        self.tableView.rowHeight = 44;
        [self.tableView reloadData];
    }
}

- (IBAction)resultButtonAction:(id) sender
{
    NSLog(@"show %@ result",self.api.name);
    if (self.parameterTable) {
        self.parameterTable = NO;
        [self.tableView reloadData];
    }
}

-(void)keyboardWillShow:(NSNotification *)notif
{
    NSDictionary* userInfo = [notif userInfo];

    // get the size of the keyboard
    NSValue* boundsValue = [userInfo objectForKey:UIKeyboardFrameBeginUserInfoKey];
    CGSize keyboardSize = [boundsValue CGRectValue].size;

    UIEdgeInsets contentInsets = UIEdgeInsetsMake(0.0,0.0,keyboardSize.height,0.0);
    self.tableView.contentInset = contentInsets;
    self.tableView.scrollIndicatorInsets = contentInsets;

    CGRect cell = self.activeField.superview.superview.frame;
    [self.tableView scrollRectToVisible:cell animated:YES];
}

-(void)keyboardWillHide:(NSNotification *)notif
{
    UIEdgeInsets contentInsets = UIEdgeInsetsZero;
    self.tableView.contentInset = contentInsets;
    self.tableView.scrollIndicatorInsets = contentInsets;
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
    self.parameterTable = YES;

    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillShow:)
                                                 name:UIKeyboardWillShowNotification
                                               object:self.view.window];

    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillHide:)
                                                 name:UIKeyboardWillHideNotification
                                               object:self.view.window];

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
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIKeyboardWillShowNotification
                                                  object:nil];

    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIKeyboardWillHideNotification
                                                  object:nil];
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
    // Return the number of sections: mandatory,optional
   return self.isParameterTable ? 2 : self.ticket == nil ? 1 : 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    if (self.isParameterTable) {
        NSInteger count = [[self.parameters objectAtIndex:section] count];
        return count > 0 ? count : 1;
    }
    return section == ApiCodeSection ? 1 : [[(NSHTTPURLResponse *) self.ticket.response allHeaderFields] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CodeCellIdentifier = @"CodeCell";
    static NSString *HeaderCellIdentifier = @"HeaderCell";
    static NSString *ParameterCellIdentifier = @"ParameterCell";
    
    if (!self.isParameterTable) {
        if (self.ticket == nil) {
            return self.none;
        }
        if (indexPath.section == ApiCodeSection) {
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CodeCellIdentifier];
            if (cell == nil) {
                cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CodeCellIdentifier] autorelease];
            }

            cell.textLabel.text = [NSString stringWithFormat:@"%d",[(NSHTTPURLResponse *) self.ticket.response statusCode]];
            cell.textLabel.textColor = self.ticket.didSucceed ? [UIColor greenColor] : [UIColor redColor];
            cell.textLabel.shadowColor = [UIColor lightGrayColor];
            cell.textLabel.shadowOffset = CGSizeMake(0.0,1.0);
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            
            // Configure the cell...
            return cell;
        }
        else {
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:HeaderCellIdentifier];
            if (cell == nil) {
                cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:HeaderCellIdentifier] autorelease];
            }

            NSArray *keys = [[(NSHTTPURLResponse *) self.ticket.response allHeaderFields] allKeys];
            NSArray *values = [[(NSHTTPURLResponse *) self.ticket.response allHeaderFields] allValues];
            cell.textLabel.text = [keys objectAtIndex:indexPath.row];
            cell.detailTextLabel.text = [values objectAtIndex:indexPath.row];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            
            // Configure the cell...
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
            cell.accessoryType = [parameter.checked boolValue] ? UITableViewCellAccessoryCheckmark : UITableViewCellAccessoryNone;
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            return cell;
        }
    }

    return nil;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSArray *pTitles = [NSArray arrayWithObjects:@"Mandatory Parameters",@"Optional Parameters",nil];
    NSArray *rTitles = [NSArray arrayWithObjects:@"Code",@"Headers",nil];
    return self.isParameterTable ? [pTitles objectAtIndex:section] : self.ticket == nil ? @"" : [rTitles objectAtIndex:section];
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
    // Toggle checked for optional parameters
    if (self.isParameterTable && indexPath.section == ApiOptionalSection) {
        ApiParameter *parameter = [[self.parameters objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
        if ([parameter.checked boolValue]) {
            parameter.checked = [NSNumber numberWithBool:NO];
            [[self.tableView cellForRowAtIndexPath:indexPath] setAccessoryType:UITableViewCellAccessoryNone];
            NSLog(@"%@ is deselected", parameter.parameterName);
        }
        else {
            parameter.checked = [NSNumber numberWithBool:YES];
            [[self.tableView cellForRowAtIndexPath:indexPath] setAccessoryType:UITableViewCellAccessoryCheckmark];
            NSLog(@"%@ is selected", parameter.parameterName);
        }
    }
    if (!self.isParameterTable && indexPath.section == ApiCodeSection && self.ticket != nil) {
        ApiResultViewController *vc = [[ApiResultViewController alloc] initWithNibName:@"ApiResultViewController" bundle:nil];
        vc.api = self.api;
        vc.text = self.response;
        [self.navigationController pushViewController:vc animated:YES];
        [vc release];
    }
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

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    self.activeField = nil;
    UITableViewCell *cell = (UITableViewCell *)[[textField superview] superview];
    if (cell) {
        UITableView *table = (UITableView *)[cell superview];
        NSIndexPath *indexPath = [table indexPathForCell:cell];
        ApiParameter *parameter = [[self.parameters objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
        parameter.parameterValue = textField.text;
        NSLog(@"%@ = %@",parameter.parameterName,parameter.parameterValue);
    }
    else {
        NSLog(@"cell cannot be found for textfield");
    }
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    self.activeField = textField;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
    [super touchesBegan:touches withEvent:event];
}


@end
