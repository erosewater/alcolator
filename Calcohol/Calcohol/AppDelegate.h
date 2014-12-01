//
//  AppDelegate.h
//  Calcohol
//
//  Created by dbk-dev on 11/19/14.
//  Copyright (c) 2014 David Krasnove. All rights reserved.
//

#import <UIKit/UIKit.h>

//@interface AppDelegate : UIResponder <UIApplicationDelegate>
@interface AppDelegate: UIResponder <UITabBarControllerDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, assign) id< UITabBarControllerDelegate > tabDelegate;

@end

