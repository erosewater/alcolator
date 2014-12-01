//
//  AppDelegate.m
//  Calcohol
//
//  Created by dbk-dev on 11/19/14.
//  Copyright (c) 2014 David Krasnove. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "WhiskeyViewController.h"
// #import "MainMenuViewController.h"



@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] ;
    // Override point for customization after application launch.
    //ViewController *viewController = [[ViewController alloc] init];
    //self.window.rootViewController = viewController;
    //MainMenuViewController *mainMenuViewController = [[MainMenuViewController alloc] init];
    //UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:mainMenuViewController];
    //self.window.rootViewController = navigationController;
    ViewController *wineVC = [[ViewController alloc]init];
    WhiskeyViewController *whiskeyVC = [[WhiskeyViewController alloc] init];
    UITabBarController *tabBarVC = [[UITabBarController alloc] init];
    tabBarVC.viewControllers = @[wineVC, whiskeyVC];
    
    self.window.rootViewController = tabBarVC;
    tabBarVC.delegate = self;
    
    
    
    
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)tabBarController:(UITabBarController *)tabBarController
 didSelectViewController:(UIViewController *)viewController {
    NSString *selectedWine = @"Wine Tab Selected";
    NSString *selectedWhiskey = @"Whiskey Tab Selected";
    
    if ((unsigned long)tabBarController.selectedIndex == 0) {
        NSLog(@"New View Controller Selected: %@", selectedWine);
    } else {
        NSLog(@"New View Controller Selected: %@", selectedWhiskey);
    }
        
    
    
   // NSLog(@"selected %lu",(unsigned long)tabBarController.selectedIndex);
    
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
