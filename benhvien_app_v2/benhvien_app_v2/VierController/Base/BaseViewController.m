//
//  BaseViewController.m
//  benhvien_app_v2
//
//  Created by AnhTien on 9/19/17.
//  Copyright © 2017 AnhTien. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpUserInterface];
    [self showDoneButton];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)showHUB {
    dispatch_async(dispatch_get_main_queue(), ^{
        [MBProgressHUD showHUDAddedTo:self.view animated:true];
    });
}

- (void)hideHUB {
    dispatch_async(dispatch_get_main_queue(), ^{
        [MBProgressHUD hideHUDForView:self.view animated:true];
    });
}

- (void)showAlertWithTitle:(NSString *)title message:(NSString *)message {
    [UIAlertController showAlertInViewController:self
                                       withTitle:title
                                         message:message
                               cancelButtonTitle:@"OK"
                          destructiveButtonTitle:nil
                               otherButtonTitles:nil
                                        tapBlock:nil];
}

- (void)setupThemeButton:(UIBarButtonItem *)button {
    NSDictionary *buttonAttribute = @{NSFontAttributeName:              [UIFont systemFontOfSize:16],
                                      NSForegroundColorAttributeName:   [UIColor whiteColor]};
    [button setTitleTextAttributes:buttonAttribute forState:UIControlStateNormal];
}

- (void)showMenuButton {
    UIBarButtonItem *menuButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"nav-menu"]
                                                                   style:UIBarButtonItemStylePlain
                                                                  target:self
                                                                  action:@selector(meunButtonPressed:)];
    [self setupThemeButton:menuButton];
    self.navigationItem.leftBarButtonItem = menuButton;
}

- (void)showBackButton {
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"nav-back"]
                                                                   style:UIBarButtonItemStylePlain
                                                                  target:self
                                                                  action:@selector(backButtonPressed:)];
    [self setupThemeButton:backButton];
    self.navigationItem.leftBarButtonItem = backButton;
}

- (void)showDoneButton {
    
}

- (void)showCancelButton {
    UIBarButtonItem *cancelButton = [[UIBarButtonItem alloc] initWithTitle:@"Huỷ"
                                                                     style:UIBarButtonItemStylePlain target:self
                                                                    action:@selector(cancelButtonPressed:)];
    [self setupThemeButton:cancelButton];
    self.navigationItem.leftBarButtonItem = cancelButton;
}

#pragma Action

- (IBAction)meunButtonPressed:(id)sender {
    
}

- (IBAction)backButtonPressed:(id)sender {
    [self.navigationController popViewControllerAnimated:true];
}

- (IBAction)cancelButtonPressed:(id)sender {
    [UIAlertController showAlertInViewController:self
                                       withTitle:@"Xác nhận"
                                         message:@"Bạn chắc chắn muốn huỷ?"
                               cancelButtonTitle:@"Cancel"
                          destructiveButtonTitle:@"Yes"
                               otherButtonTitles:nil
                                        tapBlock:^(UIAlertController * _Nonnull controller, UIAlertAction * _Nonnull action, NSInteger buttonIndex) {
                                            if (buttonIndex == controller.cancelButtonIndex) {
                                                
                                            } else if (buttonIndex == controller.destructiveButtonIndex) {
                                                [self dismissViewControllerAnimated:true completion:nil];
                                            } else if (buttonIndex >= controller.firstOtherButtonIndex) {
                                                
                                            }
                                        }];
}

@end
