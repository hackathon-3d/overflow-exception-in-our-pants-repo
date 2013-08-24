//
//  PaintProjectMeasureViewController.h
//  handy
//
//  Created by Marvin on 8/24/13.
//  Copyright (c) 2013 Four Eyed Dev. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PaintProjectOptionsViewController.h"

@interface PaintProjectMeasureViewController : UIViewController<UITextFieldDelegate>
{
    BOOL didChangeTextFtHeight;
    BOOL didChangeTextInHeight;
    BOOL didChangeTextFtLength;
    BOOL didChangeTextInLength;
}

@property (nonatomic, strong) IBOutlet UILabel *titleLabel;
@property (nonatomic, strong) IBOutlet UILabel *titleLabel2;
@property (nonatomic, strong) IBOutlet UILabel *titleLabel3;
@property (nonatomic, strong) IBOutlet UILabel *label;
@property (nonatomic, strong) IBOutlet UILabel *label2;
@property (nonatomic, strong) IBOutlet UILabel *label3;
@property (nonatomic, strong) IBOutlet UILabel *label4;
@property (nonatomic, strong) IBOutlet UILabel *label5;
@property (nonatomic, strong) IBOutlet UILabel *label6;
@property (nonatomic, strong) IBOutlet UILabel *label7;
@property (nonatomic, strong) IBOutlet UILabel *label8;
@property (nonatomic, strong) IBOutlet UILabel *label9;
@property (nonatomic, strong) IBOutlet UITextField *textFtHeight;
@property (nonatomic, strong) IBOutlet UITextField *textFtLength;
@property (nonatomic, strong) IBOutlet UITextField *textFtNoPaint;
@property (nonatomic, strong) IBOutlet UITextField *textInHeight;
@property (nonatomic, strong) IBOutlet UITextField *textInLength;
@property (nonatomic, strong) IBOutlet UITextField *textInNoPaint;

@property (nonatomic, strong) NSMutableDictionary *projectData;
@property (nonatomic, strong) UITapGestureRecognizer *tapRecognizer;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil dictionary:(NSMutableDictionary *)projectData;

@end
