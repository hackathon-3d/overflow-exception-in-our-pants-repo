//
//  PaintProjectOptionsViewController.h
//  handy
//
//  Created by Marvin on 8/24/13.
//  Copyright (c) 2013 Four Eyed Dev. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PaintProjectPercentErrorViewController.h"

@interface PaintProjectOptionsViewController : UIViewController

@property (nonatomic, strong) IBOutlet UILabel *label;
@property (nonatomic, strong) IBOutlet UILabel *label2;
@property (nonatomic, strong) IBOutlet UILabel *label3;
@property (nonatomic, strong) IBOutlet UILabel *label4;
@property (nonatomic, strong) IBOutlet UILabel *label5;
@property (nonatomic, strong) IBOutlet UILabel *titleLabel;
@property (nonatomic, strong) IBOutlet UILabel *titleLabel2;
@property (nonatomic, strong) IBOutlet UILabel *titleLabel3;
@property (nonatomic, strong) IBOutlet UISlider *sliderOldColor;
@property (nonatomic, strong) IBOutlet UISlider *sliderNewColor;
@property (nonatomic, strong) IBOutlet UIButton *checkMixedPrimer;
@property (nonatomic, strong) IBOutlet UIButton *checkPrePrimer;
@property (nonatomic, strong) IBOutlet UIButton *checkUnpainted;

@property (nonatomic, strong) NSMutableDictionary *projectData;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil dictionary:(NSMutableDictionary *)projectData;
- (IBAction)sliderOldChanged:(id)sender;
- (IBAction)sliderNewChanged:(id)sender;
- (IBAction)sliderOldEnded:(id)sender;
- (IBAction)sliderNewEnded:(id)sender;
- (IBAction)buttonMixedChanged:(id)sender;
- (IBAction)buttonPreChanged:(id)sender;
- (IBAction)buttonWallsUnpainted:(id)sender;

@end
