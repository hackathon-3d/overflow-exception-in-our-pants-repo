//
//  PaintProjectMeasureViewController.m
//  handy
//
//  Created by Marvin on 8/24/13.
//  Copyright (c) 2013 Four Eyed Dev. All rights reserved.
//

#import "PaintProjectMeasureViewController.h"

@interface PaintProjectMeasureViewController ()

@end

@implementation PaintProjectMeasureViewController

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
    self.navigationItem.rightBarButtonItem = buttonItemRight;
    [self.navigationItem.leftBarButtonItem configureFlatButtonWithColor:[UIColor turquoiseColor] highlightedColor:[UIColor greenSeaColor]  cornerRadius:3];
    
    self.navigationController.navigationBar.backItem.title = @"Back";
    
    self.title = @"Measure";
    
    self.titleLabel.font = [UIFont fontWithName:@"Rockwell Std" size:18.0f];
    self.titleLabel.textColor = [UIColor alizarinColor];
    self.titleLabel2.font = [UIFont fontWithName:@"Rockwell Std" size:18.0f];
    self.titleLabel2.textColor = [UIColor alizarinColor];
    self.titleLabel3.font = [UIFont fontWithName:@"Rockwell Std" size:18.0f];
    self.titleLabel3.textColor = [UIColor alizarinColor];
    
    self.label.font = [UIFont fontWithName:@"Helvetica-Light" size:15.0];
    self.label.textColor = [UIColor concreteColor];
    self.label2.font = [UIFont fontWithName:@"Helvetica-Light" size:15.0];
    self.label2.textColor = [UIColor concreteColor];
    self.label3.font = [UIFont fontWithName:@"Helvetica-Light" size:15.0];
    self.label3.textColor = [UIColor concreteColor];
    self.label4.font = [UIFont fontWithName:@"Helvetica-Light" size:15.0];
    self.label4.textColor = [UIColor midnightBlueColor];
    self.label5.font = [UIFont fontWithName:@"Helvetica-Light" size:15.0];
    self.label5.textColor = [UIColor midnightBlueColor];
    self.label6.font = [UIFont fontWithName:@"Helvetica-Light" size:15.0];
    self.label6.textColor = [UIColor midnightBlueColor];
    self.label7.font = [UIFont fontWithName:@"Helvetica-Light" size:15.0];
    self.label7.textColor = [UIColor midnightBlueColor];
    self.label8.font = [UIFont fontWithName:@"Helvetica-Light" size:15.0];
    self.label8.textColor = [UIColor midnightBlueColor];
    self.label9.font = [UIFont fontWithName:@"Helvetica-Light" size:15.0];
    self.label9.textColor = [UIColor midnightBlueColor];
    
    self.textFtHeight.font = [UIFont fontWithName:@"Helvetica-Light" size:17.0];
    self.textFtLength.font = [UIFont fontWithName:@"Helvetica-Light" size:17.0];
    self.textFtNoPaint.font = [UIFont fontWithName:@"Helvetica-Light" size:17.0];
    self.textInHeight.font = [UIFont fontWithName:@"Helvetica-Light" size:17.0];
    self.textInLength.font = [UIFont fontWithName:@"Helvetica-Light" size:17.0];
    self.textInNoPaint.font = [UIFont fontWithName:@"Helvetica-Light" size:17.0];
    
    self.textFtHeight.delegate = self;
    self.textFtLength.delegate = self;
    self.textFtNoPaint.delegate = self;
    self.textInHeight.delegate = self;
    self.textInLength.delegate = self;
    self.textInNoPaint.delegate = self;;
    
    [[UINavigationBar appearance] setTitleTextAttributes: @{
                                     UITextAttributeFont: [UIFont fontWithName:@"Rockwell Std" size:28.0f],
                                UITextAttributeTextColor: [UIColor cloudsColor]
     }];
    
    [NotificationCenter addObserver:self selector:@selector(keyboardWillShow:) name:
     UIKeyboardWillShowNotification object:nil];
    
    [NotificationCenter addObserver:self selector:@selector(keyboardWillHide:) name:
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
    if (didChangeTextFtHeight && didChangeTextFtLength && didChangeTextInHeight && didChangeTextInLength)
    {
        PaintProjectOptionsViewController *nextView = [[PaintProjectOptionsViewController alloc] initWithNibName:@"PaintProjectOptionsViewController" bundle:nil dictionary:self.projectData];
        [self.navigationController pushViewController:nextView animated:YES];
    }
}

#pragma mark TextFieldDelegateMethods

- (void)textFieldDidEndEditing:(UITextField *)textField
{
//    [self.projectData setObject:self.projectName.text forKey:@"projects_name"];
//    if (![self.projectName.text isEqualToString:@""]) {
//        didNameProject = YES;
//        [self.navigationItem.rightBarButtonItem  configureFlatButtonWithColor:[UIColor turquoiseColor] highlightedColor:[UIColor greenSeaColor]  cornerRadius:3];
//    }
    if (![self.textFtHeight.text isEqualToString:@""])
    {
        [self.projectData setObject:[NSNumber numberWithInt: [self.textFtHeight.text intValue]] forKey:@"textFtHeight"];
        didChangeTextFtHeight = YES;
    }
    if (![self.textFtLength.text isEqualToString:@""])
    {
        [self.projectData setObject:[NSNumber numberWithInt: [self.textFtLength.text intValue]] forKey:@"textFtLength"];
        didChangeTextFtLength = YES;
    }
    if (![self.textInHeight.text isEqualToString:@""])
    {
        [self.projectData setObject:[NSNumber numberWithInt: [self.textInHeight.text intValue]] forKey:@"textInHeight"];
        didChangeTextInHeight = YES;
    }
    if (![self.textInLength.text isEqualToString:@""])
    {
        [self.projectData setObject:[NSNumber numberWithInt: [self.textInLength.text intValue]] forKey:@"textInLength"];
        didChangeTextInLength = YES;
    }
    if (![self.textFtNoPaint.text isEqualToString:@""])
    {
        [self.projectData setObject:[NSNumber numberWithInt: [self.textFtNoPaint.text intValue]] forKey:@"textFtNoPaint"];
    }
    if (![self.textInNoPaint.text isEqualToString:@""])
    {
       [self.projectData setObject:[NSNumber numberWithInt: [self.textInNoPaint.text intValue]] forKey:@"textInNoPaint"];
    }
    
    if (didChangeTextFtHeight && didChangeTextFtLength && didChangeTextInHeight && didChangeTextInLength) {
        [self.navigationItem.rightBarButtonItem  configureFlatButtonWithColor:[UIColor turquoiseColor] highlightedColor:[UIColor greenSeaColor]  cornerRadius:3];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
