//
//  PaintProjectFinalViewController.m
//  handy
//
//  Created by Marvin on 8/24/13.
//  Copyright (c) 2013 Four Eyed Dev. All rights reserved.
//

#import "PaintProjectFinalViewController.h"

@interface PaintProjectFinalViewController ()

@end

@implementation PaintProjectFinalViewController

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
    self.title = @"Results";
    
    [self.navigationController.navigationBar configureFlatNavigationBarWithColor:[UIColor midnightBlueColor]];
    
    self.topTitle.font = [UIFont fontWithName:@"Rockwell Std" size:28.0f];
    self.topTitle.textColor = [UIColor alizarinColor];
    self.bottomTitle.font = [UIFont fontWithName:@"Rockwell Std" size:28.0f];
    self.bottomTitle.textColor = [UIColor alizarinColor];
    
    self.result.font = [UIFont fontWithName:@"Helvetica-Light" size:120.0];
    self.result.textColor = [UIColor midnightBlueColor];
    
    self.homeButton.buttonColor = [UIColor alizarinColor];
    self.homeButton.shadowColor = [UIColor pomegranateColor];
    self.homeButton.shadowHeight = 3.0f;
    self.homeButton.cornerRadius = 0.0f;
    self.homeButton.titleLabel.font = [UIFont fontWithName:@"Bemio Italic" size:22.0f];
    [self.homeButton setTitleColor:[UIColor cloudsColor] forState:UIControlStateNormal];
    [self.homeButton setTitleColor:[UIColor cloudsColor] forState:UIControlStateHighlighted];
    
    self.costButton.buttonColor = [UIColor alizarinColor];
    self.costButton.shadowColor = [UIColor pomegranateColor];
    self.costButton.shadowHeight = 3.0f;
    self.costButton.cornerRadius = 0.0f;
    self.costButton.titleLabel.font = [UIFont fontWithName:@"Bemio Italic" size:22.0f];
    [self.costButton setTitleColor:[UIColor cloudsColor] forState:UIControlStateNormal];
    [self.costButton setTitleColor:[UIColor cloudsColor] forState:UIControlStateHighlighted];
    
    //type of paint
    int typeOfPaint;
    if ([self.projectData objectForKey:@"finish_type"]) {
        NSNumber *number = [self.projectData objectForKey:@"finish_type"];
        typeOfPaint = [number intValue];
    }
    else
    {
        typeOfPaint = 0;
    }
    //wall height
    int heightFt = 0;
    if ([self.projectData objectForKey:@"textFtHeight"]) {
        NSNumber *number = [self.projectData objectForKey:@"textFtHeight"];
        heightFt = [number intValue];
    }
    int heightIn = 0;
    if ([self.projectData objectForKey:@"textInHeight"]) {
        NSNumber *number = [self.projectData objectForKey:@"textInHeight"];
        heightIn = [number intValue];
    }
    float height = heightFt + heightIn/12.0;
    //wall length
    int lengthFt = 0;
    if ([self.projectData objectForKey:@"textFtLength"]) {
        NSNumber *number = [self.projectData objectForKey:@"textFtLength"];
        lengthFt = [number intValue];
    }
    int lengthIn = 0;
    if ([self.projectData objectForKey:@"textInLength"]) {
        NSNumber *number = [self.projectData objectForKey:@"textInLength"];
        lengthIn = [number intValue];
    }
    float length = lengthFt + lengthIn/12.0;
    //no paint
    int noPaintFt = 0;
    if ([self.projectData objectForKey:@"textFtNoPaint"]) {
        NSNumber *number = [self.projectData objectForKey:@"textFtNoPaint"];
        noPaintFt = [number intValue];
    }
    int noPaintIn = 0;
    if ([self.projectData objectForKey:@"textInNoPaint"]) {
        NSNumber *number = [self.projectData objectForKey:@"textInNoPaint"];
        noPaintIn = [number intValue];
    }
    float noPain = noPaintFt + noPaintIn/12.0;
    //base color
    int base = 2;
    if ([self.projectData objectForKey:@"old_color"]) {
        NSNumber *number = [self.projectData objectForKey:@"old_color"];
        base = [number intValue];
    }
    //new color
    int new = 2;
    if ([self.projectData objectForKey:@"new_color"]) {
        NSNumber *number = [self.projectData objectForKey:@"new_color"];
        new = [number intValue];
    }
    BOOL isDarker = NO;
    if (new>base) {
        isDarker = YES;
    }
    //unpainted
    BOOL unpainted = NO;
    if ([self.projectData objectForKey:@"unpainted"]) {
        NSNumber *number = [self.projectData objectForKey:@"unpainted"];
        new = [number boolValue];
    }
    //primer pre/mix
    BOOL pre = NO;
    if ([self.projectData objectForKey:@"pre_primer"]) {
        NSNumber *number = [self.projectData objectForKey:@"pre_primer"];
        new = [number boolValue];
    }
    BOOL mixed = NO;
    if ([self.projectData objectForKey:@"mixed_primer"]) {
        NSNumber *number = [self.projectData objectForKey:@"mixed_primer"];
        new = [number boolValue];
    }
    //margin of error
    float marginOfError = .1;
    if ([self.projectData objectForKey:@"margin_error"]) {
        NSNumber *number = [self.projectData objectForKey:@"margin_error"];
        new = [number intValue]/100;
    }
    int primer;
    if (pre) {
        primer = PRIMER_OPTION_SEPARATE;
    }
    else if (mixed)
    {
        primer = PRIMER_OPTION_MIXED;
    }
    else
    {
        primer = PRIMER_OPTION_NONE;
    }
    
    self.calculator = [[PaintCalculator alloc] init];
    self.resultSet = [self.calculator estimateGallonsAndCostForWidth:length Height:height UseOfPrimer:primer ChosenFinish:typeOfPaint MarginOfError:marginOfError ExistenceOfADarkerBase:isDarker AndOrUnfinishedSurfaces:unpainted];
    
    self.result.text = [NSString stringWithFormat:@"%d", [[self.resultSet objectForKey:@"Gallons"] intValue] ];
    
    FMDatabase *db = [FMDatabase databaseWithPath:[MainBundle pathForResource:@"handy_db" ofType:@""]];
    
    if (![db open]) {
        NSLog(@"Harrumph, dp !open");
    }
    NSDate *date = [NSDate date];
    //[db executeUpdate:@"INSERT INTO projects (projects_name, projects_type) VALUES (?)", [NSNumber numberWithInt:42]];
    [db executeUpdate:@"INSERT INTO projects (projects_name, projects_type, date_created) VALUES (?, ?, ?)", [self.projectData objectForKey:@"projects_name"], [NSNumber numberWithInt:0], date];
    FMResultSet *s = [db executeQuery:@"SELECT * FROM projects"];
    int project_id = 0;
    while ([s next]) {
        project_id = [s intForColumnIndex:0];
    }
    [db executeUpdate:@"INSERT INTO paint_projects VALUES (?, ?, ?)", project_id, [self.resultSet objectForKey:@"gallons"], typeOfPaint];
    
    [db close];
}

- (IBAction)presentCosts:(id)sender
{
    PaintProjectPricesViewController *nextView = [[PaintProjectPricesViewController alloc] initWithNibName:@"PaintProjectPricesViewController" bundle:nil dictionary:self.resultSet];
    [self.navigationController pushViewController:nextView animated:YES];
}

- (IBAction)goHome:(id)sender
{
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
