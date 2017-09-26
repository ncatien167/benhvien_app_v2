//
//  AppDelegate.m
//  benhvien_app_v2
//
//  Created by AnhTien on 9/19/17.
//  Copyright © 2017 AnhTien. All rights reserved.
//

#import "AppDelegate.h"
#import "FirstLoginViewController.h"
#import "UIViewController+Storyboard.h"
#import "HomeViewController.h"
#import "UserDataManager.h"
#import "UIColor+Hex.h"
#import <HNKGooglePlacesAutocomplete/HNKGooglePlacesAutocomplete.h>

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [self setupApplicationTheme];
    if ([UserDataManager shareClient].accessToken &&
        [UserDataManager shareClient].accessToken.length > 0) {
        [self setupHomeScreen];
    } else {
        [self setupLoginScreen];
    }
    return YES;
}

- (void)setupApplicationData {
    [HNKGooglePlacesAutocompleteQuery setupSharedQueryWithAPIKey:GoogleApiKey];
}

- (void)setupLoginScreen {
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    FirstLoginViewController *firstViewController = (FirstLoginViewController *)[FirstLoginViewController instanceFromStoryboardName:@"Login"];
    self.window.rootViewController = firstViewController;
    [self.window makeKeyAndVisible];
}

- (void)setupHomeScreen {
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    HomeViewController *homeViewController = (HomeViewController *)[HomeViewController instanceFromStoryboardName:@"Home"];
    BaseNavigationViewController *navigation = [[BaseNavigationViewController alloc] initWithRootViewController:homeViewController];
    self.window.rootViewController = navigation;
    [self.window makeKeyAndVisible];
}

- (void)setupApplicationTheme {
    [UINavigationBar appearance].barTintColor = [UIColor colorWithHex:0xd2232a];
    [UINavigationBar appearance].tintColor = [UIColor redColor];
    
    NSDictionary *titleAttribute = [[NSDictionary alloc] initWithObjectsAndKeys:[UIColor whiteColor], NSForegroundColorAttributeName, nil];
    [UINavigationBar appearance].titleTextAttributes = titleAttribute;
}

@end
