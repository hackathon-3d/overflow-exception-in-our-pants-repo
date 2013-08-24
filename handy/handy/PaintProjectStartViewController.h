//
//  PaintProjectStartViewController.h
//  handy
//
//  Created by Marvin on 8/24/13.
//  Copyright (c) 2013 Four Eyed Dev. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PaintProjectMeasureViewController.h"

@interface PaintProjectStartViewController : UIViewController<UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate>
{
    BOOL didNameProject;
    BOOL didPickFinish;
    
    float kOFFSET_FOR_KEYBOARD;
}

@property (nonatomic, strong) IBOutlet UITextField *projectName;
@property (nonatomic, strong) IBOutlet UITableView *finishTable;

@property (nonatomic, strong) IBOutlet UILabel *label1;
@property (nonatomic, strong) IBOutlet UILabel *label2;

@property (nonatomic, strong) NSMutableDictionary *projectData;
@property (nonatomic, strong) NSIndexPath *prevIndexPath;
@property (nonatomic, strong) UITapGestureRecognizer *tapRecognizer;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil dictionary:(NSMutableDictionary *)projectData;

@end
