//
//  PaintProjectStartViewController.m
//  handy
//
//  Created by Marvin on 8/24/13.
//  Copyright (c) 2013 Four Eyed Dev. All rights reserved.
//

#import "PaintProjectStartViewController.h"

@interface PaintProjectStartViewController ()

@end

@implementation PaintProjectStartViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil dictionary:(NSMutableDictionary *)projectData
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.projectData = projectData;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self.navigationController.navigationBar configureFlatNavigationBarWithColor:[UIColor midnightBlueColor]];
    UIBarButtonItem *buttonItemRight = [[UIBarButtonItem alloc] initWithTitle:@"Next" style:UIBarButtonItemStylePlain target:self action:@selector(nextScreen)];
    buttonItemRight.title = @"Next";
    [buttonItemRight configureFlatButtonWithColor:[UIColor concreteColor] highlightedColor:[UIColor concreteColor]  cornerRadius:3];
    UIBarButtonItem *buttonItemLeft = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(cancelTutorial)];
    [UIBarButtonItem configureFlatButtonsWithColor:[UIColor turquoiseColor]
                                  highlightedColor:[UIColor greenSeaColor]
                                      cornerRadius:3
                                   whenContainedIn:[UINavigationBar class], nil];
    self.navigationItem.rightBarButtonItem = buttonItemRight;
    self.navigationItem.leftBarButtonItem = buttonItemLeft;
    
    self.title = @"Project Name";
    
    [[UINavigationBar appearance] setTitleTextAttributes: @{
                                     UITextAttributeFont: [UIFont fontWithName:@"Rockwell Std" size:28.0f],
                                UITextAttributeTextColor: [UIColor cloudsColor]
     }];
    
    didNameProject = NO;
    didPickFinish = NO;
    
    self.view.backgroundColor = [UIColor cloudsColor];
    
    self.projectName.delegate = self;
    self.finishTable.delegate = self;
    
    self.projectName.font = [UIFont fontWithName:@"Helvetica-Light" size:17.0];
    
    self.label1.font = [UIFont fontWithName:@"Bemio Italic" size:24.0f];
    self.label1.textColor = [UIColor midnightBlueColor];
    
    self.label2.font = [UIFont fontWithName:@"Rockwell Std" size:20.0f];
    self.label2.textColor = [UIColor alizarinColor];
    
    self.finishTable.delegate = self;
    self.finishTable.dataSource = self;
    self.finishTable.backgroundColor = [UIColor clearColor];
    self.finishTable.separatorColor = [UIColor clearColor];
    
    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    
    [nc addObserver:self selector:@selector(keyboardWillShow:) name:
     UIKeyboardWillShowNotification object:nil];
    
    [nc addObserver:self selector:@selector(keyboardWillHide:) name:
     UIKeyboardWillHideNotification object:nil];
    
    self.tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                            action:@selector(didTapAnywhere:)];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [NotificationCenter removeObserver:self name:UIKeyboardWillShowNotification object:nil];
    [NotificationCenter removeObserver:self name:UIKeyboardWillHideNotification object:nil];
}

-(void) keyboardWillShow:(NSNotification *) note {
    [self.view addGestureRecognizer:self.tapRecognizer];
}

-(void) keyboardWillHide:(NSNotification *) note
{
    [self.view removeGestureRecognizer:self.tapRecognizer];
}

-(void)didTapAnywhere: (UITapGestureRecognizer*) recognizer {
    [self.view endEditing:YES];
}

- (void)nextScreen
{
    if (didPickFinish && didNameProject)
    {
        PaintProjectMeasureViewController *nextView = [[PaintProjectMeasureViewController alloc] initWithNibName:@"PaintProjectMeasureViewController" bundle:nil dictionary:self.projectData];
        [self.navigationController pushViewController:nextView animated:YES];
    }
}

- (void)cancelTutorial
{
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark TextFieldDelegateMethods

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    [self.projectData setObject:self.projectName.text forKey:@"projects_name"];
    if (![self.projectName.text isEqualToString:@""]) {
        didNameProject = YES;
        [self.navigationItem.rightBarButtonItem  configureFlatButtonWithColor:[UIColor turquoiseColor] highlightedColor:[UIColor greenSeaColor]  cornerRadius:3];
    }
}

#pragma mark TableViewDelegateMethods

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [self.projectData setObject:[NSNumber numberWithInt:indexPath.row] forKey:@"finish_type"];
    
    if (self.prevIndexPath != nil) {
        [self.finishTable cellForRowAtIndexPath:self.prevIndexPath].textLabel.textColor = [UIColor midnightBlueColor];
    }
    
    [self.finishTable cellForRowAtIndexPath:indexPath].textLabel.textColor = [UIColor cloudsColor];
    self.prevIndexPath = indexPath;
    didPickFinish = YES;
}

#pragma mark TableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    // If you're serving data from an array, return the length of the array:
    return 5;
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] ;
    }
    
    cell.textLabel.font = [UIFont fontWithName:@"Helvetica-Light" size:17.0];
    cell.textLabel.textColor = [UIColor midnightBlueColor];
    [cell.textLabel sizeToFit];
    cell.textLabel.textAlignment = NSTextAlignmentCenter;
    
    cell.backgroundColor = [UIColor clearColor];
    
    // Set the data for this cell:
    switch (indexPath.row) {
        case 0:
            cell.textLabel.text = @"FLAT";
            break;
            
        case 1:
            cell.textLabel.text = @"EGGSHELL";
            break;
            
        case 2:
            cell.textLabel.text = @"SATIN";
            break;
            
        case 3:
            cell.textLabel.text = @"SEMI-GLOSS";
            break;
            
        case 4:
            cell.textLabel.text = @"HIGH GLOSS";
            break;
            
        default:
            break;
    }
    
    UIView *selectionColor = [[UIView alloc] init];
    selectionColor.backgroundColor = [UIColor midnightBlueColor];
    cell.selectedBackgroundView = selectionColor;
    
    return cell;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
