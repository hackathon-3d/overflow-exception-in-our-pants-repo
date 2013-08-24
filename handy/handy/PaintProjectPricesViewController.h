//
//  PaintProjectPricesViewController.h
//  handy
//
//  Created by Marvin on 8/24/13.
//  Copyright (c) 2013 Four Eyed Dev. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface PaintProjectPricesViewController : UIViewController

@property (nonatomic, strong) IBOutlet UILabel *behrLabel;
@property (nonatomic, strong) IBOutlet UILabel *behrPrice;

@property (nonatomic, strong) IBOutlet UILabel *sherwinLabel;
@property (nonatomic, strong) IBOutlet UILabel *sherwinPrice;

@property (nonatomic, strong) IBOutlet UILabel *valsparLabel;
@property (nonatomic, strong) IBOutlet UILabel *valsparPrice;

@property (nonatomic, strong) IBOutlet FUIButton *homeButton;


@property (nonatomic, strong) NSMutableDictionary *resultData;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil dictionary:(NSMutableDictionary *)projectData;
- (IBAction)goHome:(id)sender;

@end
