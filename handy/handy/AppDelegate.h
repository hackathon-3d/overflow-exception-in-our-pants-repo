//
//  AppDelegate.h
//  handy
//
//  Created by Marvin on 8/23/13.
//  Copyright (c) 2013 Four Eyed Dev. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) ViewController *viewController;
@property (strong, nonatomic) UINavigationController *navController;

@end
