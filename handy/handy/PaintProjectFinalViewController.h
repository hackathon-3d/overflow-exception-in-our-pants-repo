//
//  PaintProjectFinalViewController.h
//  handy
//
//  Created by Marvin on 8/24/13.
//  Copyright (c) 2013 Four Eyed Dev. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PaintCalculator.h"
#import <FMDB/FMDatabase.h>
#import "PaintProjectPricesViewController.h"

@interface PaintProjectFinalViewController : UIViewController

@property (nonatomic, strong) IBOutlet UILabel *topTitle;
@property (nonatomic, strong) IBOutlet UILabel *bottomTitle;
@property (nonatomic, strong) IBOutlet UILabel *result;

@property (nonatomic, strong) IBOutlet FUIButton *costButton;
@property (nonatomic, strong) IBOutlet FUIButton *homeButton;
@property (nonatomic, strong) IBOutlet UIButton *deleteButton;

@property (nonatomic, strong) NSMutableDictionary *projectData;
@property (nonatomic, strong) NSMutableDictionary *resultSet;

@property (nonatomic, strong) PaintCalculator *calculator;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil dictionary:(NSMutableDictionary *)projectData;

- (IBAction)presentCosts:(id)sender;
- (IBAction)goHome:(id)sender;

@end
