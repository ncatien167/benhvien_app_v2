//
//  BaseViewController.h
//  benhvien_app_v2
//
//  Created by AnhTien on 9/19/17.
//  Copyright © 2017 AnhTien. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIViewController+Storyboard.h"
#import "UIAlertController+Blocks.h"
#import "BaseNavigationViewController.h"
#import "BaseTabBarController.h"
#import <MBProgressHUD/MBProgressHUD.h>
#import "UIColor+Hex.h"
#import "ApiManager.h"
#import "ApiRequest.h"
#import "AppDelegate.h"

@interface BaseViewController : UIViewController

- (void)showHUB;
- (void)hideHUB;

- (void)setupThemeButton:(UIBarButtonItem *)button;
- (void)showAlertWithTitle:(NSString *)title message:(NSString *)message;

- (void)showMenuButton;
- (void)showBackButton;
- (void)showDoneButton;
- (void)showCancelButton;

@end
