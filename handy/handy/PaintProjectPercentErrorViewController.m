//
//  PaintProjectPercentErrorViewController.m
//  handy
//
//  Created by Marvin on 8/24/13.
//  Copyright (c) 2013 Four Eyed Dev. All rights reserved.
//

#import "PaintProjectPercentErrorViewController.h"

@interface PaintProjectPercentErrorViewController ()

@end

@implementation PaintProjectPercentErrorViewController

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
    [self.navigationItem.leftBarButtonItem configureFlatButtonWithColor:[UIColor turquoiseColor] highlightedColor:[UIColor greenSeaColor]  cornerRadius:3];
    
    self.title = @"Margins";

    self.labelTitle.font = [UIFont fontWithName:@"Bemio Italic" size:28.0f];
    self.labelTitle.textColor = [UIColor turquoiseColor];
    
    self.labelSmallTitle.font = [UIFont fontWithName:@"Rockwell Std" size:18.0f];
    self.labelSmallTitle.textColor = [UIColor alizarinColor];
    
    self.label.font = [UIFont fontWithName:@"Helvetica-Light" size:15.0];
    self.label.textColor = [UIColor concreteColor];
    self.label2.font = [UIFont fontWithName:@"Helvetica-Light" size:15.0];
    self.label.textColor = [UIColor midnightBlueColor];
    
    self.button.titleLabel.font = [UIFont fontWithName:@"Bemio Italic" size:28.0f];
    self.button.buttonColor = [UIColor alizarinColor];
    self.button.shadowColor = [UIColor pomegranateColor];
    self.button.shadowHeight = 3.0f;
    self.button.cornerRadius = 0.0f;
    [self.button setTitleColor:[UIColor cloudsColor] forState:UIControlStateNormal];
    [self.button setTitleColor:[UIColor cloudsColor] forState:UIControlStateHighlighted];
    
    [self.sliderError configureFlatSliderWithTrackColor:[UIColor midnightBlueColor] progressColor:[UIColor midnightBlueColor] thumbColor:[UIColor concreteColor]];
    self.sliderError.maximumValue = 20.0;
    self.sliderError.value = 10.0;
    
    [self.projectData setObject:[NSNumber numberWithInt:(int)self.sliderError.value] forKey:@"margin_error"];
}

- (IBAction)buttonPressed:(id)sender
{
    PaintProjectFinalViewController *nextView = [[PaintProjectFinalViewController alloc] initWithNibName:@"PaintProjectFinalViewController" bundle:nil dictionary:self.projectData];
    [self.navigationController pushViewController:nextView animated:YES];
}

- (IBAction)sliderChanged:(id)sender
{
    self.label2.text = [NSString stringWithFormat:@"%d%%", (int)self.sliderError.value];
}

- (IBAction)sliderDone:(id)sender
{
    self.label2.text = [NSString stringWithFormat:@"%d%%", (int)self.sliderError.value];
    [self.projectData setObject:[NSNumber numberWithInt:(int)self.sliderError.value] forKey:@"margin_error"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
