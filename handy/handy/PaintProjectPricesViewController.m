//
//  PaintProjectPricesViewController.m
//  handy
//
//  Created by Marvin on 8/24/13.
//  Copyright (c) 2013 Four Eyed Dev. All rights reserved.
//

#import "PaintProjectPricesViewController.h"

@interface PaintProjectPricesViewController ()

@end

@implementation PaintProjectPricesViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil dictionary:(NSMutableDictionary *)resultData
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.resultData = resultData;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self.navigationController.navigationBar configureFlatNavigationBarWithColor:[UIColor midnightBlueColor]];
    
    self.behrLabel.font = [UIFont fontWithName:@"Rockwell Std" size:20.0f];
    self.behrLabel.textColor =  [UIColor alizarinColor];
    self.behrPrice.font = [UIFont fontWithName:@"Helvetica-Light" size:42.0];
    self.behrPrice.textColor = [UIColor concreteColor];
    self.behrPrice.text = [self.resultData objectForKey:@"Behr"];
    
    self.sherwinLabel.font = [UIFont fontWithName:@"Rockwell Std" size:20.0f];
    self.sherwinLabel.textColor = [UIColor alizarinColor];
    self.sherwinPrice.font = [UIFont fontWithName:@"Helvetica-Light" size:42.0];
    self.sherwinPrice.textColor = [UIColor concreteColor];
    self.sherwinPrice.text = [self.resultData objectForKey:@"Sherman Williams"];
    
    self.valsparLabel.font = [UIFont fontWithName:@"Rockwell Std" size:20.0f];
    self.valsparLabel.textColor = [UIColor alizarinColor];
    self.valsparPrice.font = [UIFont fontWithName:@"Helvetica-Light" size:42.0];
    self.valsparPrice.textColor = [UIColor concreteColor];
    self.valsparPrice.text = [self.resultData objectForKey:@"Valspar"];
    
    self.homeButton.buttonColor = [UIColor alizarinColor];
    self.homeButton.shadowColor = [UIColor pomegranateColor];
    self.homeButton.shadowHeight = 3.0f;
    self.homeButton.cornerRadius = 0.0f;
    self.homeButton.titleLabel.font = [UIFont fontWithName:@"Bemio Italic" size:22.0f];
    [self.homeButton setTitleColor:[UIColor cloudsColor] forState:UIControlStateNormal];
    [self.homeButton setTitleColor:[UIColor cloudsColor] forState:UIControlStateHighlighted];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)goHome:(id)sender
{
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}

@end
