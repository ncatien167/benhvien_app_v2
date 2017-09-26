//
//  FirstLoginViewController.m
//  benhvien_app_v2
//
//  Created by AnhTien on 9/19/17.
//  Copyright © 2017 AnhTien. All rights reserved.
//

#import "FirstLoginViewController.h"
#import "LoginViewController.h"

@interface FirstLoginViewController ()

@end

@implementation FirstLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)GoToLoginViewWithEmail:(id)sender {
    LoginViewController *loginViewController = (LoginViewController *)[LoginViewController instanceFromStoryboardName:@"Login"];
    BaseNavigationViewController *navigation = [[BaseNavigationViewController alloc] initWithRootViewController:loginViewController];
    [self presentViewController:navigation animated:true completion:nil];
}

-(IBAction)GoToLoginViewWithFacebook:(id)sender {
    
}

@end
