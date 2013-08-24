//
//  ViewController.m
//  handy
//
//  Created by Marvin on 8/23/13.
//  Copyright (c) 2013 Four Eyed Dev. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [self.navigationController.navigationBar configureFlatNavigationBarWithColor:[UIColor midnightBlueColor]];
    UIBarButtonItem *buttonItemRight = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(createProject)];
    [buttonItemRight configureFlatButtonWithColor:[UIColor turquoiseColor] highlightedColor:[UIColor greenSeaColor] cornerRadius:3];
    buttonItemRight.style = UIBarButtonSystemItemAdd;
    self.navigationItem.rightBarButtonItem = buttonItemRight;
    
    self.title = @"My Projects";
    
    [[UINavigationBar appearance] setTitleTextAttributes: @{
                                     UITextAttributeFont: [UIFont fontWithName:@"Rockwell Std" size:28.0f],
                                UITextAttributeTextColor: [UIColor cloudsColor]
     }];

    self.view.backgroundColor = [UIColor cloudsColor];
    
    
    [self.tableView reloadData];
}

- (void)viewDidAppear:(BOOL)animated
{
    FMDatabase *db = [FMDatabase databaseWithPath:[MainBundle pathForResource:@"handy_db" ofType:@""]];
    
    if (![db open]) {
        NSLog(@"Harrumph, dp !open");
    }
    
    self.projects = [NSMutableArray array];
    
    FMResultSet *s = [db executeQuery:@"SELECT * FROM projects"];
    while ([s next]) {
        NSMutableDictionary *aProject = [NSMutableDictionary dictionary];
        [aProject setObject:[s stringForColumn:@"projects_name"] forKey:@"projects_name"];
        [aProject setObject:[NSNumber numberWithInt:[s intForColumn:@"projects_type"]] forKey:@"projects_type"];
        [aProject setObject:[s dateForColumn:@"date_created"] forKey:@"projects_date"];
    }
    
    [db close];
    
    self.backgroundImage.image = [UIImage imageNamed:@"LetsDoIt.png"];
    
    if([self.projects count] > 0)
    {
        self.backgroundImage.hidden = YES;
    }
    else
    {
        self.backgroundImage.hidden = NO;
        self.tableView.hidden = YES;
    }

    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) createProject
{
    NSMutableDictionary *newProjectData = [NSMutableDictionary dictionary];
    
    PaintProjectStartViewController *newProjectTutorial = [[PaintProjectStartViewController alloc] initWithNibName:@"PaintProjectStartViewController" bundle:nil dictionary:newProjectData];
    
    UINavigationController *tutorialController = [[UINavigationController alloc] initWithRootViewController:newProjectTutorial];
    
    tutorialController.navigationBar.backItem.title = @"Back";
    
    newProjectTutorial.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    
    [self.navigationController presentViewController:tutorialController animated:YES completion:nil];
}

- (void)cancelProject
{
    [self dismissViewControllerAnimated:YES completion: nil];
}

- (void)saveAndExitProjectWithData:(NSMutableDictionary *)projectData
{
    [self dismissViewControllerAnimated:YES completion: nil];
}

#pragma mark TableViewDelegateMethods

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark TableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    // If you're serving data from an array, return the length of the array:
    return [self.projects count];
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] ;
    }
    
    // Set the data for this cell:
    
    cell.textLabel.text = [self.projects objectAtIndex:indexPath.row];
    cell.detailTextLabel.text = @"More text";
    
    // set the accessory view:
    cell.accessoryType =  UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}

@end
