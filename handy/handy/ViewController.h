//
//  ViewController.h
//  handy
//
//  Created by Marvin on 8/23/13.
//  Copyright (c) 2013 Four Eyed Dev. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FMDatabase.h>
#import "PaintProjectStartViewController.h"

@interface ViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) IBOutlet UITableView *tableView;
@property (nonatomic, strong) IBOutlet UIImageView *backgroundImage;

@property (nonatomic, strong) NSMutableArray *projects;

@end
