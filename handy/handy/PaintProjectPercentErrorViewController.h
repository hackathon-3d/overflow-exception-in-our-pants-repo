//
//  PaintProjectPercentErrorViewController.h
//  handy
//
//  Created by Marvin on 8/24/13.
//  Copyright (c) 2013 Four Eyed Dev. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PaintProjectFinalViewController.h"

@interface PaintProjectPercentErrorViewController : UIViewController

@property (nonatomic, strong) IBOutlet UILabel *labelTitle;
@property (nonatomic, strong) IBOutlet UILabel *labelSmallTitle;
@property (nonatomic, strong) IBOutlet UILabel *label;
@property (nonatomic, strong) IBOutlet UILabel *label2;
@property (nonatomic, strong) IBOutlet FUIButton *button;
@property (nonatomic, strong) IBOutlet UISlider *sliderError;

@property (nonatomic, strong) NSMutableDictionary *projectData;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil dictionary:(NSMutableDictionary *)projectData;
- (IBAction)buttonPressed:(id)sender;
- (IBAction)sliderChanged:(id)sender;
- (IBAction)sliderDone:(id)sender;

@end
