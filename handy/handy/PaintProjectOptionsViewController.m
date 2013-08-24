//
//  PaintProjectOptionsViewController.m
//  handy
//
//  Created by Marvin on 8/24/13.
//  Copyright (c) 2013 Four Eyed Dev. All rights reserved.
//

#import "PaintProjectOptionsViewController.h"

@interface PaintProjectOptionsViewController ()

@end

@implementation PaintProjectOptionsViewController

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
    [buttonItemRight configureFlatButtonWithColor:[UIColor turquoiseColor] highlightedColor:[UIColor greenSeaColor]  cornerRadius:3];
    self.navigationItem.rightBarButtonItem = buttonItemRight;
    [self.navigationItem.leftBarButtonItem configureFlatButtonWithColor:[UIColor turquoiseColor] highlightedColor:[UIColor greenSeaColor]  cornerRadius:3];
    
    self.navigationController.navigationBar.backItem.title = @"Back";
    
    self.title = @"Options";
    
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
    self.label4.textColor = [UIColor concreteColor];
    self.label5.font = [UIFont fontWithName:@"Helvetica-Light" size:15.0];
    self.label5.textColor = [UIColor concreteColor];
    
    self.sliderNewColor.maximumValue = 4;
    self.sliderOldColor.maximumValue = 4;
    
    self.sliderNewColor.value = 2;
    [self.sliderNewColor configureFlatSliderWithTrackColor:[UIColor asbestosColor] progressColor:[UIColor asbestosColor] thumbColor:[UIColor silverColor]];
    
    self.sliderOldColor.value = 2;
    [self.sliderOldColor configureFlatSliderWithTrackColor:[UIColor asbestosColor] progressColor:[UIColor asbestosColor] thumbColor:[UIColor silverColor]];
}

- (void)nextScreen
{
    PaintProjectPercentErrorViewController *nextView = [[PaintProjectPercentErrorViewController alloc] initWithNibName:@"PaintProjectPercentErrorViewController" bundle:nil dictionary:self.projectData];
    [self.navigationController pushViewController:nextView animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)sliderOldChanged:(id)sender
{
    int value = self.sliderOldColor.value;
    if (value == 0) {
        [self.sliderOldColor configureFlatSliderWithTrackColor:[UIColor midnightBlueColor] progressColor:[UIColor midnightBlueColor] thumbColor:[UIColor silverColor]];
    }
    else if (value == 1) {
        [self.sliderOldColor configureFlatSliderWithTrackColor:[UIColor wetAsphaltColor] progressColor:[UIColor wetAsphaltColor] thumbColor:[UIColor silverColor]];
    }
    else if (value == 2) {
        [self.sliderOldColor configureFlatSliderWithTrackColor:[UIColor asbestosColor] progressColor:[UIColor asbestosColor] thumbColor:[UIColor silverColor]];
    }
    else if (value == 3) {
        [self.sliderOldColor configureFlatSliderWithTrackColor:[UIColor concreteColor] progressColor:[UIColor concreteColor] thumbColor:[UIColor silverColor]];
    }
    else {
        [self.sliderOldColor configureFlatSliderWithTrackColor:[UIColor silverColor] progressColor:[UIColor silverColor] thumbColor:[UIColor silverColor]];
    }
}

- (IBAction)sliderNewChanged:(id)sender
{
    int value = self.sliderNewColor.value;
    if (value == 0) {
        [self.sliderNewColor configureFlatSliderWithTrackColor:[UIColor midnightBlueColor] progressColor:[UIColor midnightBlueColor] thumbColor:[UIColor silverColor]];
    }
    else if (value == 1) {
        [self.sliderNewColor configureFlatSliderWithTrackColor:[UIColor wetAsphaltColor] progressColor:[UIColor wetAsphaltColor] thumbColor:[UIColor silverColor]];
    }
    else if (value == 2) {
        [self.sliderNewColor configureFlatSliderWithTrackColor:[UIColor asbestosColor] progressColor:[UIColor asbestosColor] thumbColor:[UIColor silverColor]];
    }
    else if (value == 3) {
        [self.sliderNewColor configureFlatSliderWithTrackColor:[UIColor concreteColor] progressColor:[UIColor concreteColor] thumbColor:[UIColor silverColor]];
    }
    else {
        [self.sliderNewColor configureFlatSliderWithTrackColor:[UIColor silverColor] progressColor:[UIColor silverColor] thumbColor:[UIColor silverColor]];
    }
}

- (IBAction)sliderOldEnded:(id)sender
{
    [self.projectData setObject:[NSNumber numberWithInt:(int)self.sliderOldColor.value] forKey:@"old_color"];
}

- (IBAction)sliderNewEnded:(id)sender
{
    [self.projectData setObject:[NSNumber numberWithInt:(int)self.sliderNewColor.value] forKey:@"new_color"];
}

- (IBAction)buttonMixedChanged:(id)sender
{
    [self.checkMixedPrimer setBackgroundImage:[UIImage imageNamed:@"CheckBoxMarked@2x.png"] forState:UIControlStateSelected];
    [self.checkMixedPrimer setBackgroundImage:[UIImage imageNamed:@"CheckBoxMarked@2x.png"] forState:UIControlStateNormal];
    
    [self.projectData setObject:[NSNumber numberWithBool:YES] forKey:@"mixed_primer"];
}

- (IBAction)buttonPreChanged:(id)sender
{
    [self.checkPrePrimer setBackgroundImage:[UIImage imageNamed:@"CheckBoxMarked@2x.png"] forState:UIControlStateSelected];
    [self.checkPrePrimer setBackgroundImage:[UIImage imageNamed:@"CheckBoxMarked@2x.png"] forState:UIControlStateNormal];
    
    [self.projectData setObject:[NSNumber numberWithBool:YES] forKey:@"pre_primer"];
}

- (IBAction)buttonWallsUnpainted:(id)sender
{
    [self.checkUnpainted setBackgroundImage:[UIImage imageNamed:@"CheckBoxMarked@2x.png"] forState:UIControlStateSelected];
    [self.checkUnpainted setBackgroundImage:[UIImage imageNamed:@"CheckBoxMarked@2x.png"] forState:UIControlStateNormal];
    
    [self.projectData setObject:[NSNumber numberWithBool:YES] forKey:@"unpainted"];
}

@end
